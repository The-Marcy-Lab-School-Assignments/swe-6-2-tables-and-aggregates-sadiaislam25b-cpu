-- create-and-seed.sql
-- Design and seed a table for ONE of the following scenarios:
--
--   A. A restaurant menu
--      Suggested columns: name, cuisine, price, vegetarian, calories, available
--
--   B. A music library
--      Suggested columns: title, artist, genre, year, duration_seconds, streams
--
--   C. A gym class schedule
--      Suggested columns: class_name, instructor, day_of_week, capacity, enrolled, difficulty
--
--   D. A movie collection
--      Suggested columns: title, director, genre, year, runtime_minutes, rating
--
--   E. A bookstore inventory
--      Suggested columns: title, author, genre, price, pages, in_stock
--
-- Requirements:
--   [ ] Creates a new database with an appropriate name
--   [ ] Connects to the database after creating it
--   [ ] Creates a new table with an appropriate name
--   [ ] The seed file can be executed multiple times without causing errors related to the database and/or table already existing
--   [ ] The table has a primary key column with unique, auto-generated, and sequential values
--   [ ] The table has at least 5 additional columns beyond the primary key
--   [ ] The table has at least 3 different data types used
--   [ ] The table has at least one `NOT NULL` constraint
--   [ ] The table has at least one `DEFAULT` value
--   [ ] The table has at least one `UNIQUE` constraint
--   [ ] The table has at least 8 rows of seed data inserted

-- ============================================================
-- Step 1: Create the database
-- ============================================================

DROP DATABASE IF EXISTS bookstore_db;
CREATE DATABASE bookstore_db;
\c bookstore_db;

-- ============================================================
-- Step 2: Create the table
-- ============================================================

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    price NUMERIC(6,2) DEFAULT 0,
    pages INT,
    in_stock BOOLEAN DEFAULT TRUE,
    UNIQUE(title, author)
);

-- ============================================================
-- Step 3: Insert seed data (at least 8 rows)
-- ============================================================

INSERT INTO books (title, author, genre, price, pages, in_stock) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 10.99, 180, TRUE),
('1984', 'George Orwell', 'Dystopian', 12.50, 328, TRUE),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 9.99, 281, TRUE),
('Pride and Prejudice', 'Jane Austen', 'Romance', 8.50, 279, TRUE),
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy', 15.00, 310, TRUE),
('Beloved', 'Toni Morrison', 'Historical Fiction', 13.75, 324, TRUE),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 11.25, 214, TRUE),
('Moby Dick', 'Herman Melville', 'Adventure', 14.00, 635, TRUE);