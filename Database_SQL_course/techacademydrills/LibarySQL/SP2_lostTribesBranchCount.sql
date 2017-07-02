/* This PROC is for finding out how many copies of 'Lost Tribes' each branch carries. */


USE db_library
GO

CREATE PROCEDURE sp2_lostTribesBranchCount
as


SELECT        tbl_library_branch.branchName AS Branch, tbl_book_copies.no_of_copies AS Copies 
FROM            tbl_book LEFT JOIN
                         tbl_book_copies ON tbl_book.bookID = tbl_book_copies.bookID RIGHT JOIN
                         tbl_library_branch ON tbl_book_copies.branchID = tbl_library_branch.branchID WHERE tbl_book.title='The Lost Tribe';

GO