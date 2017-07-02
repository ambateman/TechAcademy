/*THis PROC finds books due today that belong to the Sharpstown branch. It returns the name and address of the borrower. If you test this and get
   no records back, make sure that there is a book that is due today. Change the date if you need to.  
   It doesn't check for overdue books (which would be a good one. */


USE db_library
GO


CREATE PROCEDURE sp4_dueTodayNameAndBook
AS

SELECT        tbl_book.title, tbl_borrower.name, tbl_borrower.address
FROM            tbl_book_loans INNER JOIN
                         tbl_borrower ON tbl_book_loans.cardNo = tbl_borrower.cardNo INNER JOIN
                         tbl_library_branch ON tbl_book_loans.branchID = tbl_library_branch.branchID INNER JOIN
                         tbl_book ON tbl_book_loans.bookID = tbl_book.bookID
WHERE        (tbl_library_branch.branchName = 'Sharpstown') AND (tbl_book_loans.dueDate = CONVERT(CHAR(10), GETDATE(), 101));
GO