/* This Proc identifies borrowers who have more than 4 books out (5 or more...) */

USE db_library
GO

CREATE PROCEDURE sp6_UsersWithFiveOrMoreBooks
AS
SELECT        tbl_borrower.name, tbl_borrower.address
FROM            tbl_borrower
INNER JOIN (SELECT        tbl_borrower.name, tbl_borrower.address, tbl_book_loans.cardNo,count(tbl_book_loans.cardNo) as 'total'
FROM            tbl_borrower INNER JOIN
                         tbl_book_loans ON tbl_borrower.cardNo = tbl_book_loans.cardNo
GROUP BY tbl_borrower.name, tbl_borrower.address,tbl_book_loans.cardNo) as subq
ON tbl_borrower.cardNo = subq.cardNo
WHERE subq.total > 4;

GO