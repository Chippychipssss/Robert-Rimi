-- Converted for Microsoft SQL Server (MSSQL)
-- Original MySQL/MariaDB syntax removed or adapted

-- Create database
CREATE DATABASE library_management_system;
GO
USE library_management_system;
GO

-- Table structure for table books
CREATE TABLE books (
  book_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT NULL,
  grade VARCHAR(300) NOT NULL,
  title VARCHAR(300) NOT NULL,
  author VARCHAR(300) NOT NULL,
  publisher VARCHAR(300) NOT NULL,
  edition INT NOT NULL,
  isbn VARCHAR(100) NOT NULL,
  pages INT NOT NULL,
  date_issued DATE NULL
);
GO

-- Dumping data for table books
SET IDENTITY_INSERT books ON;
INSERT INTO books (book_id, user_id, grade, title, author, publisher, edition, isbn, pages, date_issued) VALUES
(1, 5, 'Horror', 'Zombie Day', 'Kazi Nazrul Islam', 'Nazrul Publications', 3, 'jfklsgsdlg5qw7q87w', 800, '2018-07-10'),
(3, 4, 'Adventure', 'A Song of Ice & Fire', 'George R. R. Martin', 'Game of Thrones', 8, 'has23dadh123427', 1200, '2018-07-11'),
(4, 5, 'Adventure', 'Harry Potter & The Half Blood Prince', 'J.K Rowling', 'Rowling''s Publications', 1, '31ghf1jk24kjb3l4l1gjh', 667, '2018-07-10'),
(5, 2, 'Adventure', 'Harry Potter & The Deadly Hallows', 'J.K Rowling', 'Rowling''s Publications', 2, 'agsh32gqkj12bkl134', 798, '2018-07-10'),
(7, 0, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 'Agatha Publications', 2, '4zgdhdv2dfh81v31sdgj', 669, NULL),
(10, 0, 'Modern Literature', 'In Search of Lost Time', 'Marcel Proust', 'NY Publishers', 8, '2j3nsd235habh3dfkj', 4215, '2018-07-11'),
(11, 2, 'Story', 'Kidagaa Kimemwozea', 'Ababu', 'Ababu Publications', 2, '2j3nsd235habh3dfkj', 321, '2018-07-14');
SET IDENTITY_INSERT books OFF;
GO

-- Table structure for table books_request
CREATE TABLE books_request (
  request_id INT IDENTITY(1,1) PRIMARY KEY,
  user_id INT NOT NULL,
  grade VARCHAR(300) NOT NULL,
  title VARCHAR(300) NOT NULL,
  author VARCHAR(300) NOT NULL,
  edition INT NOT NULL,
  isbn VARCHAR(100) NOT NULL,
  date DATE NOT NULL
);
GO

SET IDENTITY_INSERT books_request ON;
INSERT INTO books_request (request_id, user_id, grade, title, author, edition, isbn, date) VALUES
(1, 2, 'Mystery', 'Murder on the Orient Express', 'Agatha Christie', 3, '12gf3gj1jhr3jklj1ugjkb', '2018-07-10'),
(2, 5, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2018-07-10'),
(3, 4, 'Mystery', 'The Mysterious Affair at Styles', 'Agatha Christie', 3, '4zgdhdv2dfh81v31sdgj', '2018-07-10');
SET IDENTITY_INSERT books_request OFF;
GO

-- Table structure for table issue_date
CREATE TABLE issue_date (
  issue_id INT IDENTITY(1,1) PRIMARY KEY,
  book_id INT NOT NULL,
  user_id INT NOT NULL,
  date DATE NOT NULL
);
GO

SET IDENTITY_INSERT issue_date ON;
INSERT INTO issue_date (issue_id, book_id, user_id, date) VALUES
(1, 1, 2, '2018-07-10'),
(2, 5, 2, '2018-07-10'),
(3, 3, 2, '2018-07-10'),
(4, 4, 5, '2018-07-10'),
(5, 1, 2, '2018-07-10'),
(6, 5, 5, '2018-07-10'),
(7, 1, 5, '2018-07-10'),
(8, 4, 5, '2018-07-10'),
(9, 3, 5, '2018-07-10'),
(10, 5, 5, '2018-07-10'),
(11, 3, 5, '2018-07-10'),
(12, 3, 5, '2018-07-10'),
(13, 3, 5, '2018-07-10'),
(14, 3, 5, '2018-07-10'),
(15, 3, 4, '2018-07-10'),
(16, 1, 5, '2018-07-10'),
(17, 3, 5, '2018-07-10'),
(18, 5, 2, '2018-07-10'),
(19, 3, 4, '2018-07-11'),
(20, 7, 4, '2018-07-11'),
(21, 7, 5, '2018-07-11'),
(22, 3, 4, '2018-07-11');
SET IDENTITY_INSERT issue_date OFF;
GO

-- Table structure for table users
CREATE TABLE users (
  user_id INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(300) NOT NULL,
  phone VARCHAR(11) NOT NULL,
  email VARCHAR(300) NOT NULL UNIQUE,
  is_admin BIT NOT NULL,
  password VARCHAR(300) NOT NULL,
  address VARCHAR(300) NOT NULL,
  gender VARCHAR(300) NOT NULL
);
GO

SET IDENTITY_INSERT users ON;
INSERT INTO users (user_id, name, phone, email, is_admin, password, address, gender) VALUES
(1, 'Abrar', '01711568524', 'a.zshahriar@gmail.com', 1, '1234', 'Mirpur DOHS', 'Male'),
(2, 'Arefin', '01764431859', 'arefin@gmail.com', 0, 'yellow', 'Mirpur 13', 'Male'),
(4, 'Rafin', '01924184941', 'rafin.ryan.07@outlook.com', 0, 'horse', 'Mirpur 13, Dhaka', 'Male'),
(5, 'Shimi', '01723645289', 'shimi@gmail.com', 0, 'abcd', 'Uttara, Sector 13', 'Female'),
(6, 'Jhuma', '01782963175', 'fjhuma@gmail.com', 0, 'qwerty', 'Banani, Chairman Bari', 'Female'),
(7, 'Istiak', '01932478293', 'istiakisha69@gmail.com', 0, 'istiak', 'Baily Road', 'Male'),
(8, 'Fahim Ahmed', '01726972364', 'fahim152@gmail.com', 0, 'fahimma', 'Kallayanpur', 'Male');
SET IDENTITY_INSERT users OFF;
GO

-- Foreign key for books.user_id to users.user_id (optional, uncomment if needed)
-- ALTER TABLE books ADD CONSTRAINT FK_books_users FOREIGN KEY (user_id) REFERENCES users(user_id);
-- Foreign key for issue_date.book_id to books.book_id (optional, uncomment if needed)
-- ALTER TABLE issue_date ADD CONSTRAINT FK_issue_date_books FOREIGN KEY (book_id) REFERENCES books(book_id);
-- Foreign key for issue_date.user_id to users.user_id (optional, uncomment if needed)
-- ALTER TABLE issue_date ADD CONSTRAINT FK_issue_date_users FOREIGN KEY (user_id) REFERENCES users(user_id);
