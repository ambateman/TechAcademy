/*This PROC is for finding the number of copies of each Stephen King book in the catalog and is in the Central branch. */

USE db_library
GO

CREATE PROCEDURE sp7_KingBooksAtCentral
AS

SELECT        tbl_book.title, tbl_book_copies.no_of_copies, tbl_library_branch.branchName
FROM            tbl_book_copies INNER JOIN
                         tbl_library_branch ON tbl_book_copies.branchID = tbl_library_branch.branchID INNER JOIN
                         tbl_book ON tbl_book_copies.bookID = tbl_book.bookID INNER JOIN
                         tbl_book_authors ON tbl_book.bookID = tbl_book_authors.bookID
WHERE        (tbl_library_branch.branchName = 'Central' AND tbl_book_authors.authorName = 'Stephen King')

GO