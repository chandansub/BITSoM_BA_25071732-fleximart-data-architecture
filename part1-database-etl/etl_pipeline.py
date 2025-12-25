import pandas as pd
import mysql.connector


db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Chandan@123",
    database="fleximart",
    port=3306
)

cursor = db.cursor()


report = {
    "customers_processed": 0,
    "products_processed": 0,
    "sales_processed": 0,
    "duplicates_removed": 0,
    "missing_values_handled": 0,
    "records_loaded": 0
}


def format_phone(phone):
    if pd.isna(phone):
        return None
    digits = ''.join(filter(str.isdigit, str(phone)))
    return "+91-" + digits if len(digits) == 10 else None

def format_date(value):
    if pd.isna(value):
        return None
    dt = pd.to_datetime(value, errors="coerce")
    return dt.strftime("%Y-%m-%d") if not pd.isna(dt) else None


customers = pd.read_csv("customers_raw.csv")
products = pd.read_csv("products_raw.csv")
sales = pd.read_csv("sales_raw.csv")

report["customers_processed"] = len(customers)
report["products_processed"] = len(products)
report["sales_processed"] = len(sales)


before = len(customers)
customers = customers.drop_duplicates()
report["duplicates_removed"] += before - len(customers)

customers["email"] = customers["email"].fillna("unknown@email.com")
customers["phone"] = customers["phone"].apply(format_phone)
customers["registration_date"] = customers["registration_date"].apply(format_date)

report["missing_values_handled"] += customers.isna().sum().sum()


before = len(products)
products = products.drop_duplicates()
report["duplicates_removed"] += before - len(products)

products["price"] = products["price"].fillna(products["price"].mean())
products["stock_quantity"] = products["stock_quantity"].fillna(0)
products["category"] = products["category"].str.title()

report["missing_values_handled"] += products.isna().sum().sum()


for _, row in customers.iterrows():
    try:
        cursor.execute("""
            INSERT INTO customers
            (first_name, last_name, email, phone, city, registration_date)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            row["first_name"],
            row["last_name"],
            row["email"],
            row["phone"],
            row["city"],
            row["registration_date"]
        ))
        report["records_loaded"] += 1
    except:
        pass


for _, row in products.iterrows():
    try:
        cursor.execute("""
            INSERT INTO products
            (product_name, category, price, stock_quantity)
            VALUES (%s, %s, %s, %s)
        """, (
            row["product_name"],
            row["category"],
            row["price"],
            row["stock_quantity"]
        ))
        report["records_loaded"] += 1
    except:
        pass


before = len(sales)
sales = sales.drop_duplicates()
report["duplicates_removed"] += before - len(sales)


date_col = None
for col in sales.columns:
    if "date" in col.lower():
        date_col = col
        break

if date_col is None:
    raise Exception("No date column found in sales CSV")

sales[date_col] = sales[date_col].apply(format_date)

for _, row in sales.iterrows():
    try:
        cursor.execute("""
            INSERT INTO orders
            (customer_id, order_date, total_amount, status)
            VALUES (%s, %s, %s, %s)
        """, (
            row["customer_id"],
            row[date_col],
            row["total_amount"],
            "Completed"
        ))
        report["records_loaded"] += 1
    except:
        pass

db.commit()


with open("data_quality_report.txt", "w") as f:
    for k, v in report.items():
        f.write(f"{k} : {v}\n")

print("ETL Pipeline completed successfully")

report_path = r"C:\Users\Venugopal G\OneDrive\Desktop\graded assignment\data_quality_report.txt"

with open(report_path, "w") as f:
    f.write("DATA QUALITY REPORT\n")
    f.write("===================\n\n")
    f.write(f"Customers records processed : {report['customers_processed']}\n")
    f.write(f"Products records processed  : {report['products_processed']}\n")
    f.write(f"Sales records processed     : {report['sales_processed']}\n")
    f.write(f"Duplicates removed          : {report['duplicates_removed']}\n")
    f.write(f"Missing values handled      : {report['missing_values_handled']}\n")
    f.write(f"Records loaded successfully : {report['records_loaded']}\n")

print("Data Quality Report generated successfully")

