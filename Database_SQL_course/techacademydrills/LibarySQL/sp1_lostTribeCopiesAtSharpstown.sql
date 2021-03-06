/* This PROC is for finding how many books titles 'The Lost Tribe' are owned by 'Sharpstown'. */


USE [db_library]
GO


CREATE PROCEDURE sp1_lostTribeCopiesAtSharpstown

AS

SELECT        tbl_book_copies.no_of_copies
FROM            tbl_book INNER JOIN
                         tbl_book_copies ON tbl_book.bookID = tbl_book_copies.bookID INNER JOIN
                         tbl_library_branch ON tbl_book_copies.branchID = tbl_library_branch.branchID
WHERE        (tbl_book.title = 'The Lost Tribe') AND (branchName = 'Sharpstown');

