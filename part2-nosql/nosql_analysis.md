NoSQL Database Analysis – FlexiMart

Section A: Limitations of RDBMS (Relational Database Systems)

Relational databases like MySQL work well when data structure is fixed and predictable. However, for a highly diverse product catalog, they face several limitations. Different products often have different attributes. For example, laptops require attributes such as RAM, processor, and storage, while shoes require size, color, and material. In an RDBMS, all these attributes must be predefined as columns, which leads to many unused or NULL fields.

Frequent schema changes are another issue. Whenever a new product type is added with new attributes, the table structure must be altered. This can be time-consuming and risky for large databases. Additionally, storing customer reviews is difficult in relational databases. Reviews are naturally nested data, but in RDBMS they must be stored in separate tables and joined using foreign keys, increasing query complexity and reducing performance.

---

Section B: Benefits of NoSQL (MongoDB)

MongoDB solves these problems by using a flexible, document-based data model. Each product is stored as a JSON-like document, allowing different products to have different fields. This makes it easy to store laptops, shoes, and other products without changing the database schema.

MongoDB also supports embedded documents. Customer reviews can be stored directly inside the product document, making data retrieval faster and more intuitive. There is no need for complex joins, as all related data is available in one place.

Another major advantage is horizontal scalability. MongoDB can easily scale across multiple servers using sharding, making it suitable for growing product catalogs and high traffic. This flexibility and scalability make MongoDB a good choice for managing diverse and evolving product data.

---

Section C: Trade-offs of Using MongoDB

One disadvantage of MongoDB is weaker support for complex transactions compared to MySQL. While MongoDB supports transactions, relational databases handle multi-table transactions more efficiently. Another drawback is data duplication. Since MongoDB often embeds related data, the same information may be stored in multiple documents, leading to increased storage usage and potential data inconsistency.
