--
-- File: db.sql
-- Description: Initializes the database schema and populates with placeholder data.
--

-- --- Drop Tables (Optional but useful for quick reset/testing) ---
-- These statements delete the tables if they already exist, allowing the script
-- to be run multiple times safely during development.
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS authors;

-- --- 1. Create Authors Table ---
CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  country VARCHAR(50)
);

-- --- 2. Create Books Table ---
CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  isbn VARCHAR(20) UNIQUE,
  publication_year INTEGER,
  -- Foreign key linking books to the authors table
  author_id INTEGER REFERENCES authors(id) ON DELETE CASCADE
);


-- --- 3. Insert Placeholder Data ---

-- Insert Authors
INSERT INTO authors (name, country) VALUES
  ('J.K. Rowling', 'UK'),
  ('George Orwell', 'UK'),
  ('Jane Austen', 'UK')
;

-- Insert Books
INSERT INTO books (title, isbn, publication_year, author_id) VALUES
  ('Harry Potter and the Sorcerers Stone', '9780590353403', 1997, 1),
  ('1984', '9780451524935', 1949, 2),
  ('Pride and Prejudice', '9780141439518', 1813, 3),
  ('Animal Farm', '9780451526342', 1945, 2)
;