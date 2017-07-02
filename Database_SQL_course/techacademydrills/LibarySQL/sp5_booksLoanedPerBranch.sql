
/* This PROC shows how many books are checked out at each branch */


USE [db_library]
GO

CREATE PROCEDURE sp5_booksLoanedPerBranch
AS
SELECT        tbl_library_branch.branchName, count(tbl_book_loans.cardNo) as'Books Loaned'
FROM		  tbl_library_branch 
INNER JOIN	  tbl_book_loans ON tbl_library_branch.branchID = tbl_book_loans.branchID group by tbl_library_branch.branchName ORDER BY 'Books Loaned' DESC;

GO