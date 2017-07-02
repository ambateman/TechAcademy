/* This PROC finds borrowers who currently don't have any books checked out. */

use db_library
GO

CREATE PROCEDURE sp3_nonBorrowerBorrower
AS 
SELECT DISTINCT name 
FROM tbl_borrower WHERE name NOT IN
(SELECT tbl_borrower.name FROM tbl_borrower 
INNER JOIN tbl_book_loans ON tbl_borrower.cardNo=tbl_book_loans.cardNo);
GO