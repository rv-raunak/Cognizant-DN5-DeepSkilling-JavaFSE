# Exercise: ORM, JPA, Hibernate & Spring Data JPA

### Q1: Explain the need and benefits of ORM (Object-Relational Mapping)

-> In standard JDBC we write raw SQL queries as strings, execute them manually, and then convert the returned rows and columns into Java objects which makes the process tedious, error-prone, and tightly coupled to a specific database like MySQL or Oracle

-> ORM acts as a bridge between Java objects and database tables by automatically mapping Java classes to relational database tables

-> One major benefit of ORM is abstraction b/c developers work directly with Java objects while the ORM framework generates the SQL queries behind the scenes

-> ORM also provides database independence since switching from MySQL to PostgreSQL usually requires only changing the configuration file while the Java code remains the same

-> It reduces boilerplate code by eliminating repetitive JDBC mapping logic and provides built-in transaction management for safe commit and rollback operations

-> One limitation is that there is a learning curve to understand how ORM generates SQL internally, and for highly complex multi-join queries manually optimized SQL can sometimes perform better


### Q2: Explain the difference between JPA, Hibernate, and Spring Data JPA

-> JPA (Java Persistence API) is the rulebook because it is only a specification that defines the interfaces and rules for object-relational mapping without providing any actual implementation

-> Hibernate is the engine because it implements the JPA specification and contains the actual logic required to convert Java objects into SQL queries and execute them on the database

-> Although other JPA implementations like EclipseLink exist, Hibernate is the most widely used implementation in the industry

-> Spring Data JPA is the manager because it sits on top of Hibernate and hides most of the repetitive boilerplate code required for sessions, transactions, and CRUD operations

-> With Spring Data JPA developers simply declare a repository interface and Spring automatically generates the Hibernate implementation during runtime


### Q3: Explain the core objects of the Hibernate framework

-> Configuration reads the Hibernate properties file including the database URL, username, password, and mapping information required to configure Hibernate

-> SessionFactory is a heavyweight and thread-safe object that is created only once when the application starts and is responsible for creating Session objects

-> Session is a lightweight and non-thread-safe object that represents a single interaction with the database where developers perform operations and then close the session after the work is completed

-> Transaction represents a unit of work that guarantees ACID properties by committing changes when successful or rolling back all changes if an error occurs

-> ConnectionProvider is responsible for providing JDBC connections and usually manages a connection pool to improve application performance by reusing database connections