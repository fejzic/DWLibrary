CREATE TABLE Author (
  author_id INT PRIMARY KEY,
  author_name VARCHAR (45),
  author_surname VARCHAR (45)
);

select * from Author;

INSERT INTO Author (author_id,author_name,author_surname) VALUES (1,'Ivo','Andric');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (3,'Mak','Dizdar');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (4,'Enver','Colakovic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (5,'Irfan','Horozovic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (6,'Miljenko','Jergovic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (7,'Petar','Kocic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (8,'Dzafer','Obradovic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (9,'Mesa','Selimovic');
INSERT INTO Author (author_id,author_name,author_surname) VALUES (10,'Abdulah','Sidran');


SELECT * FROM Author;

CREATE TABLE Category (
  category_id INT PRIMARY KEY,
  category_name VARCHAR (45)
);

INSERT INTO Category (category_id,category_name) VALUES (1,'novella');
INSERT INTO Category (category_id,category_name) VALUES (2,'novel');
INSERT INTO Category (category_id,category_name) VALUES (3,'poetry');
INSERT INTO Category (category_id,category_name) VALUES (4,'comedy');
INSERT INTO Category (category_id,category_name) VALUES (5,'drama');

SELECT * FROM Category;

CREATE TABLE Publisher (
  publisher_id INT PRIMARY KEY,
  name VARCHAR (45)
);

INSERT INTO Publisher (publisher_id,name) VALUES (1,'Bosanska Rijec Sarajevo');
INSERT INTO Publisher (publisher_id,name) VALUES (2,' Novo pokoljenje');
INSERT INTO Publisher (publisher_id,name) VALUES (3,' Prosveta');
INSERT INTO Publisher (publisher_id,name) VALUES (4,' Sarajevo');
INSERT INTO Publisher (publisher_id,name) VALUES (5,' Svjetlost,Sarajevo');


SELECT * FROM Publisher;

CREATE TABLE Book (
  book_id INT PRIMARY KEY,
  book_name VARCHAR(45),
  author_id INT,
  publisher_id INT,
  category_id INT,
  FOREIGN KEY(author_id) REFERENCES Author(author_id),
  FOREIGN KEY(publisher_id) REFERENCES Publisher(publisher_id),
  FOREIGN KEY(category_id) REFERENCES Category(category_id)
);

INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (1,'Na Drini cuprija',1,2,2);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (2,'Ratnikovo proljece',2,2,3);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (3,'Plivacica',3,4,3);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (4,'Pismo majci',4,4,2);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (5,'Izabrane Igre',5,5,5);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (6,'Mama Leone',6,4,1);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (7,'Mracajski proto',7,3,4);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (8,'Bosna u ogledalu',8,4,1);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (9,'Tvrdjava',9,5,2);
INSERT INTO Book (book_id,book_name,author_id,publisher_id,category_id) VALUES (10,'Sahbaza',10,5,5);


SELECT * FROM Book;

CREATE TABLE UserData (
  user_id INT PRIMARY KEY,
  name VARCHAR (45),
  surname VARCHAR (45),
  date_of_birth DATE
);

INSERT INTO UserData (user_id,name,surname,date_of_birth) VALUES (1,'Selma','Hodzic','02-dec-2000');
INSERT INTO UserData (user_id,name,surname,date_of_birth) VALUES (2,'Faris','Selmanovic','10-jan-1999');
INSERT INTO UserData (user_id,name,surname,date_of_birth) VALUES (3,'Elma','Fejzic','05-apr-1997');
INSERT INTO UserData (user_id,name,surname,date_of_birth) VALUES (4,'Sanela','Murat','21-apr-1992');
INSERT INTO UserData (user_id,name,surname,date_of_birth) VALUES (5,'Damir','Sabanovic','15-jul-2001');

SELECT * FROM UserData;

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    date_of_employment DATE,
    contract_expiration_date DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES UserData(user_id)
);

INSERT INTO Employee (employee_id,date_of_employment,contract_expiration_date,user_id) VALUES (1,'12-nov-2005','12-nov-2010',1);
INSERT INTO Employee (employee_id,date_of_employment,contract_expiration_date,user_id) VALUES (2,'05-jan-2010','05-jan-2015',2);
INSERT INTO Employee (employee_id,date_of_employment,contract_expiration_date,user_id) VALUES (3,'20-dec-2015','20-dec-2020',3);
INSERT INTO Employee (employee_id,date_of_employment,contract_expiration_date,user_id) VALUES (4,'03-jul-2002','03-jul-2008',4);
INSERT INTO Employee (employee_id,date_of_employment,contract_expiration_date,user_id) VALUES (5,'18-jun-2005','18-jun-2010',5);

CREATE TABLE Member (
	member_id INT PRIMARY KEY,
	date_of_membership DATE,
	membership_expiration_date DATE,
	user_id INT,
	FOREIGN KEY(user_id) REFERENCES UserData(user_id)
);

INSERT INTO Member (member_id,date_of_membership,membership_expiration_date,user_id) VALUES (1,'05-nov-2012','05-nov-2014',1);
INSERT INTO Member (member_id,date_of_membership,membership_expiration_date,user_id) VALUES (2,'10-apr-2015','10-apr-2017',2);
INSERT INTO Member (member_id,date_of_membership,membership_expiration_date,user_id) VALUES (3,'20-aug-2017','20-aug-2019',3);
INSERT INTO Member (member_id,date_of_membership,membership_expiration_date,user_id) VALUES (4,'25-sep-2008','25-sep-2008',4);
INSERT INTO Member (member_id,date_of_membership,membership_expiration_date,user_id) VALUES (5,'17-jul-2020','17-jul-2020',5);

select * from Member;

CREATE TABLE Record_of_book_borrowing (
	borrow_id INT PRIMARY KEY,
	borrow_date DATE,
	return_date DATE,
	book_id INT,
	member_id INT,
	FOREIGN KEY(book_id) REFERENCES Book(book_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
);

INSERT INTO Record_of_book_borrowing (borrow_id,borrow_date,return_date,book_id,member_id) VALUES (1,'05-aug-2018','05-oct-2018',5,2);
INSERT INTO Record_of_book_borrowing (borrow_id,borrow_date,return_date,book_id,member_id) VALUES (2,'10-apr-2016','10-jun-2016',8,5);
INSERT INTO Record_of_book_borrowing (borrow_id,borrow_date,return_date,book_id,member_id) VALUES (3,'15-feb-2020','15-apr-2020',3,4);
INSERT INTO Record_of_book_borrowing (borrow_id,borrow_date,return_date,book_id,member_id) VALUES (4,'27-jun-2008','27-aug-2008',4,1);
INSERT INTO Record_of_book_borrowing (borrow_id,borrow_date,return_date,book_id,member_id) VALUES (5,'03-sep-2020','03-nov-2020',6,3);


select * from Record_of_book_borrowing;





