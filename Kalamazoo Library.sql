Create database [Kalamazoo Library]
go

--Create tables:
create table Library_Branch (
	BranchID int primary key not null identity (1,1),
	BranchName varchar(50) not null,
	BranchAddress varchar(100) not null
);

create table Publisher (
	PublisherName varchar(50) primary key not null, 
	PublisherAddress varchar(100) not null, 
	Phone varchar(10) not null,
);

create table Books (
	BookID int primary key not null identity (1000,1),
	Title varchar(50) not null,
	PublisherName varchar(50) foreign key references Publisher(PublisherName) not null
);

create table Book_Authors (
	BookID int foreign key references Books(BookID) not null,
	AuthorName varchar(30) not null
);

create table Book_Copies (
	BookID int foreign key references Books(BookID) not null,
	BranchID int foreign key references Library_Branch(BranchID) not null,
	Number_Of_Copies smallint not null 
);

create table Borrower (
	CardNo int primary key not null identity (1,1),
	Name varchar(50) not null,
	BorrowerAddress varchar(100) not null,
	Phone varchar(10) not null
);

create table Book_Loans (
	BookID int foreign key references Books(BookID) not null,
	BranchID int foreign key references Library_Branch(BranchID) not null,
	CardNo int foreign key references Borrower(CardNo) not null,
	DateOut date not null,
	DateDue date not null, 
);

--Populate tables:
insert into Library_Branch
	(BranchName, BranchAddress)
	values
	('Central', '2410 State St. Kalamazoo, MI 49009'),
	('Sharpstown', '336 Sharpstown Lane, Kalamazoo, MI 49001'),
	('Southwest', '1201 Stadium Dr., Kalamazoo, MI 49007'),
	('Westnedge', '8989 Westnedge Ave., Kalamazoo, MI 49012')
;


insert into Publisher
	(PublisherName, PublisherAddress, Phone)
	values
	('Penguin Random House', '800 E. 96th St., Indianapolis, IN 46240', '3174283000'),
	('Hachette', '1290 Avenue of the Americas, New York, NY 10001', '2123818015'),
	('Macmillan', '175 5th Ave, New York, NY 10010', '2124987306'),
	('HarperCollins', '5665 Carmichael Road, Montgomery, AL 36117', '3349658737'),
	('Simon & Schuster', '1230 6th Ave, New York, NY 10020', '2126987000')
;


insert into Books
	(Title, PublisherName)
	Values
	('The Shining', 'Hachette'),
	('The Stand', 'Hachette'),
	('The Lost Tribe', 'Penguin Random House'),
	('Grant', 'Macmillan'),
	('Sapiens', 'Simon & Schuster'),
	('Provinces of Night', 'HarperCollins'),
	('The Long Home', 'HarperCollins'),
	('Slaughterhouse 5', 'Macmillan'),
	('The Devil in the White City', 'Macmillan'),
	('Blood and Thunder', 'Hachette'),
	('Endurance', 'Penguin Random House'),
	('Cats Cradle', 'Penguin Random House'),
	('Creation', 'HarperCollins'),
	('Lords of the Bow', 'HarperCollins'), 
	('Cold Mountain', 'Simon & Schuster'),
	('A Short History of Nearly Everything', 'Macmillan'),
	('The Sports Gene', 'Hachette'),
	('Blink', 'Simon & Schuster'),
	('Night', 'HarperCollins'),
	('Freedom', 'HarperCollins'),
	('A Long Way Gone', 'Macmillan'),
	('Infinite Jest', 'Macmillan')
;


insert into Book_Authors
	(BookID, AuthorName)
	values
	(1000, 'Stephen King'),
	(1001, 'Stephen King'),
	(1002, 'William King'),
	(1003, 'Ron Chernow'),
	(1004, 'Yuval Noah Harari'),
	(1005, 'William Gay'), 
	(1006, 'William Gay'),
	(1007, 'Kurt Vonnegut'), 
	(1008, 'Erik Larson'), 
	(1009, 'Hampton Sides'),
	(1010, 'Alfred Lansing'), 
	(1011, 'Kurt Vonnegut'), 
	(1012, 'Gore Vidal'), 
	(1013, 'Conn Igguldson'), 
	(1014, 'Charles Frazier'), 
	(1015, 'Bill Bryson'), 
	(1016, 'David Epstein'), 
	(1017, 'Malcom Gladwell'), 
	(1018, 'Elie Wiesel'), 
	(1019, 'Jonathan Franzen'), 
	(1020, 'Ishmael Beah'), 
	(1021, 'David Foster Wallace')
;


insert into Book_Copies
	(BookID, BranchID, Number_Of_Copies)
	values
	(1000, 1, 5),
	(1000, 2, 3), 
	(1000, 3, 4), 
	(1000, 4, 2),
	(1001, 1, 2), 
	(1001, 2, 4), 
	(1001, 3, 2),
	(1001, 4, 2),
	(1002, 2, 3), 
	(1003, 1, 8), 
	(1003, 2, 5), 
	(1003, 3, 4), 
	(1003, 4, 4), 
	(1004, 1, 3), 
	(1004, 2, 2),
	(1005, 1, 3), 
	(1005, 2, 2), 
	(1005, 4, 2), 
	(1006, 1, 2), 
	(1007, 1, 4), 
	(1007, 2, 3), 
	(1007, 3, 2), 
	(1007, 4, 2), 
	(1008, 1, 10), 
	(1008, 2, 3), 
	(1008, 3, 2), 
	(1008, 4, 3), 
	(1009, 1, 2), 
	(1010, 1, 2), 
	(1010, 2, 3), 
	(1011, 1, 4), 
	(1011, 3, 4), 
	(1011, 4, 2), 
	(1012, 1, 3), 
	(1012, 2, 2), 
	(1013, 1, 4), 
	(1013, 2, 3), 
	(1013, 3, 2),
	(1014, 1, 5), 
	(1014, 4, 4), 
	(1015, 1, 6), 
	(1015, 2, 2), 
	(1015, 4, 2), 
	(1016, 1, 2), 
	(1016, 3, 2), 
	(1017, 1, 4), 
	(1017, 3, 3), 
	(1017, 4, 2), 
	(1018, 1, 7), 
	(1018, 2, 2), 
	(1018, 3, 3), 
	(1019, 1, 8), 
	(1019, 2, 4), 
	(1019, 3, 3), 
	(1020, 1, 2), 
	(1020, 3, 1), 
	(1021, 1, 4), 
	(1021, 2, 2), 
	(1021, 3, 3), 
	(1021, 4, 1)
;


insert into Borrower
	(Name, BorrowerAddress, Phone)
	values
	('Harold Blood Jr.', '1230 Southern Way', '2694046768'), 
	('Lance LeGendre', '2804 Duke St.', '2693436628'),
	('Suddin Sapien', '1401 State St.', '2693696989'),
	('Kasual Savoy', '8181 Lafayette Rd.', '3134206329'),
	('Shitta Sillah', '2712 Pioneer Ave.', '2693821582'), 
	('Demetrius Wigfall', '333 Ferry St.', '2693721776'), 
	('Christian Mahogany', '4784 Rutgers Rd.', '2017238001'), 
	('Kervens Bonhomme', '1222 Bronson Blvd.', '2697341755'), 
	('Storm Duck', '999 Chapel Lane', '2694517465'),
	('Viramontes Pippens', '8154 Texas Ave.', '2694444444'),
	('Ashanti Cistrunk', '999 Old Mill Rd.', '2693445590'),
	('Yahweh Jeudy', '834 State St.', '2693438824'),
	('Demarcus Governor III', '111 Central Palace Place', '5056897322')
;

insert into Book_Loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	values
	(1000, 1, 1, '2019-01-18', '2019-02-08'),
	(1001, 1, 1, '2019-01-18', '2019-02-08'),
	(1005, 1, 1, '2019-01-18', '2019-02-08'),
	(1000, 1, 2, '2019-01-04', '2019-01-25'),
	(1008, 1, 2, '2019-01-04', '2019-01-25'),
	(1013, 1, 2, '2019-01-07', '2019-01-28'),
	(1002, 2, 3, '2019-01-14', '2019-02-04'),
	(1003, 2, 3, '2019-01-14', '2019-02-04'),
	(1004, 2, 3, '2019-01-14', '2019-02-04'),
	(1007, 2, 3, '2019-01-14', '2019-02-04'),
	(1008, 2, 3, '2019-01-14', '2019-02-04'),
	(1010, 2, 3, '2019-01-14', '2019-02-04'),
	(1012, 2, 3, '2019-01-14', '2019-02-04'),
	(1015, 2, 3, '2019-01-14', '2019-02-04'),
	(1018, 2, 3, '2019-01-14', '2019-02-04'),
	(1000, 3, 4, '2018-12-07', '2018-12-28'), 
	(1001, 3, 4, '2018-12-07', '2018-12-28'), 
	(1003, 3, 4, '2018-12-07', '2018-12-28'), 
	(1007, 3, 4, '2018-12-07', '2018-12-28'), 
	(1008, 3, 4, '2018-12-07', '2018-12-28'), 
	(1011, 3, 4, '2018-12-07', '2018-12-28'),
	(1014, 1, 5, '2019-01-24', '2019-02-14'),
	(1015, 1, 5, '2019-01-24', '2019-02-14'),
	(1016, 1, 5, '2019-01-24', '2019-02-14'),
	(1017, 1, 5, '2019-01-24', '2019-02-14'),
	(1018, 1, 5, '2019-01-24', '2019-02-14'),
	(1019, 1, 5, '2019-01-24', '2019-02-14'),
	(1020, 1, 5, '2019-01-24', '2019-02-14'),
	(1021, 1, 5, '2019-01-24', '2019-02-14'),
	(1000, 4, 6, '2019-01-24', '2019-02-14'),
	(1001, 4, 6, '2019-01-24', '2019-02-14'), 
	(1005, 4, 7, '2019-01-26', '2019-02-16'), 
	(1007, 4, 7, '2019-01-26', '2019-02-16'),
	(1008, 4, 7, '2019-01-26', '2019-02-16'),
	(1011, 4, 7, '2019-01-26', '2019-02-16'),
	(1014, 4, 7, '2019-01-26', '2019-02-16'),
	(1015, 4, 7, '2019-01-26', '2019-02-16'),
	(1017, 4, 7, '2019-01-26', '2019-02-16'),
	(1021, 4, 7, '2019-01-26', '2019-02-16'),
	(1003, 1, 8, '2019-01-17', '2019-02-07'), 
	(1012, 2, 9, '2019-01-17', '2019-02-07'), 
	(1000, 1, 10, '2019-01-20', '2019-02-10'), 
	(1003, 1, 10, '2019-01-20', '2019-02-10'), 
	(1004, 1, 10, '2019-01-20', '2019-02-10'), 
	(1005, 1, 10, '2019-01-20', '2019-02-10'), 
	(1007, 1, 10, '2019-01-20', '2019-02-10'), 
	(1008, 1, 10, '2019-01-20', '2019-02-10'), 
	(1009, 1, 10, '2019-01-20', '2019-02-10'), 
	(1010, 1, 10, '2019-01-20', '2019-02-10'), 
	(1011, 1, 10, '2019-01-20', '2019-02-10'), 
	(1012, 1, 10, '2019-01-20', '2019-02-10'), 
	(1020, 3, 11, '2019-01-20', '2019-02-10')
; 


--Check to see if the tables look ok: 

select * from Library_Branch --a1
select * from Publisher --a2
select * from Books --a3
select * from Book_Authors --a4
select * from Book_Copies --a5
select * from Borrower --a6
select * from Book_Loans --a7
;

--All working!:-)

--Create stored Procedures:
/*1. How many copies of the book Lost Tribe are owned by Sharpstown?:*/
use [Kalamazoo Library]
go

--Let's have a look at the 3 tables we will use:
select * from Library_Branch
select * from Books
select * from Book_Copies
go


create procedure spNosBooksBranch @Title varchar(30) = null, @BranchName varchar(30) = null
as
select a5.Number_Of_Copies, a3.Title, a1.BranchName 
from Book_Copies a5
left join Books a3 on a3.BookID = a5.BookID
left join Library_Branch a1 on a1.BranchID = a5.BranchID
where a3.Title like '%' + isnull(@Title,a3.Title) + '%' 
and a1.BranchName like '%' + isnull(@BranchName,a1.BranchName) + '%'
Go

-- Test Code:
spNosBooksBranch @Title = 'Lost Tribe', @BranchName = 'Sharps'
Go
spNosBooksBranch @Title = 'Slaughter', @BranchName = 'Cent'
Go
--It works!!

/*2. How many copies of the book Lost Tribe are owned by each branch?:*/

create procedure spNosBooksEachBranch @Title varchar(30) = null
as 
select a5.Number_Of_Copies, a3.Title, a1.BranchName 
from Book_Copies a5
left join Books a3 on a3.BookID = a5.BookID
left join Library_Branch a1 on a1.BranchID = a5.BranchID
where a3.Title like '%' + isnull(@Title,a3.Title) + '%' 
Go

--Test Code (I'm testing multiple titles cause Lost Tribe is only at one library, so I want to see if it works for a book at multiple)
spNosBooksEachBranch @Title = 'Lost Tribe'
Go
spNosBooksEachBranch @Title = 'Slaughter'
Go
--It Works!

/*3.Retrieve the names of all borrowers who do not have any books 
checked out*/
--Let's look at the tables we'll be using:
select * from Borrower --a6
select * from Book_Loans --a7
go


create procedure spBorrowerNoCheckOuts 
as
select a6.Name, a6.CardNo from Borrower a6
where a6.CardNo not in
(select a7.CardNo from Book_Loans a7)
go

--Test Code:
spBorrowerNoCheckOuts 
go

/*4. For each book that is loaned out from Sharpstown and whose
due date is today, retrieve the book title, borrower's name, and 
borrower's address. */

--Let's look at the tables we'll be using:
select * from Library_Branch --a1
select * from Books --a3
select * from Borrower --a6
select * from Book_Loans --a7
Go

create procedure spDueToday @DateDue date = null, @BranchName varchar(30) = null
as
select a1.BranchName, a3.Title, a6.Name, a6.BorrowerAddress, a7.DateDue
from Book_Loans a7 
inner join Library_Branch a1 on a1.BranchID = a7.BranchID
inner join Books a3 on a3.BookID = a7.BookID 
inner join Borrower a6 on a6.CardNo = a7.CardNo
where a7.DateDue = isnull(@DateDue,a7.DateDue)
and a1.BranchName like '%' + isnull(@BranchName,a1.BranchName) + '%'
Go

--Test code; no books due today (Feb. 2nd), so I'm going to try multiple days to test it:
spDueToday @DateDue = '2019-02-02', @BranchName = 'Sharps'
go
spDueToday @DateDue = '2019-02-04', @BranchName = 'Sharps'
go

/*5. For each library branch, retrieve the branch name and total number of books loaned 
out from that branch */

--Let's look at the tables we'll be using:
select * from Library_Branch --a1
select * from Book_Loans --a7
go

/* Since there's no column in any of the tables that tell if a book has been returned or 
not, I'm going to assume all books that have a due date are still out whether the date 
is past that due date or not (as many people do not return books on time).  So, all the 
books from Book_Loans are considered loaned out */
create procedure spBranchesBooksOut @BranchName varchar(30) = null
as
select a1.BranchName, count(a1.BranchName)
from Book_Loans a7
left join Library_Branch a1 on a1.BranchID = a7.BranchID
where a1.BranchName like '%' + isnull(@BranchName, a1.BranchName) + '%'
group by a1.BranchName
go


--Test the Code; by this procedure we have to look up each branch individually
spBranchesBooksOut @BranchName = 'central'
go
spBranchesBooksOut @BranchName = 'sharps'
go
spBranchesBooksOut @BranchName = 'southwest'
go
spBranchesBooksOut @BranchName = 'westnedge'
go


/* 6. Retrieve the names, addresses, and # of books checked for all 
borrowers who have more than 5 books checked out*/

--Let's look at the tables we'll be using:
select * from Borrower --a6
select * from Book_Loans --a7
go

Create Procedure spBorrowerInfoCount
as
select a6.Name, a6.BorrowerAddress, Count(a7.CardNo)
From Borrower a6
inner join Book_Loans a7 on a7.CardNo = a6.CardNo
group by a6.Name, a6.BorrowerAddress
having count(a7.CardNo) > 5
go

--Test Code:
spBorrowerInfoCount
go
/*This works, but it would be better if I could make a function where I could fill 
in the number to be greater than.  For example spBorrowerInfoCount @count > 5.  That 
way I could easily search who has more than 3 books out, who has more than 15 books out, etc.  
And I wouldn't have to change the stored procedure each time.  However, I was unable to 
figure out a way to do this*/

/*7. For each book authored by Stephen King, retrieve the title and the number of copies 
owned by the library whose name is Central */

--Let's look at the tables we'll be using:
select * from Library_Branch --a1
select * from Books --a3
select * from Book_Authors --a4
select * from Book_Copies --a5
go

Create Procedure spGetBookByAuthor @author varchar(30) = null, @branch varchar (30) = null
as
select a3.Title, a4.AuthorName, a1.BranchName, a5.Number_Of_Copies 
from Book_Authors a4 
left join Books a3 on a3.BookID = a4.BookID
left join Book_Copies a5 on a5.BookID = a3.BookID
left join Library_Branch a1 on a1.BranchID = a5.BranchID
where a4.AuthorName like '%' + isnull(@author,a4.AuthorName) + '%'
and a1.BranchName like '%' + isnull(@branch,a1.BranchName) + '%'
go
 
--Test Code:
spGetBookByAuthor @author = 'stephen king', @branch = 'central'
