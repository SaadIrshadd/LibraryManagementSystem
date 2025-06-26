create procedure sp_UserLogin
(
@member_id [nvarchar](50),
@password [nvarchar](50)
)
as
begin
set nocount on;
select full_name,member_id,password,account_status from member_master_tbl where member_id=@member_id and password=@password and account_status='Active'
end 
go

---------------
select * from admin_login_tbl;

create procedure sp_AdminLogin
(
@username [nvarchar](50),
@password [nvarchar](50)
)
as
begin
set nocount on;
select username,password,full_name from admin_login_tbl where username=@username and password=@password
end 
go


select max(member_id)from member_master_tbl;  

truncate table member_master_tbl;

----------
create procedure sp_CheckDuplicateMember
(
@member_id [nvarchar](50),
@email [nvarchar](50)
)
as
begin

select * from member_master_tbl where member_id=@member_id And email=@email;
end 
go



----------
create procedure sp_SignUp
(
@full_name nvarchar(50),
@dob varchar(50),
@contact_no varchar(50),
@email varchar(50),
@state varchar(50),
@city varchar(50),
@pincode varchar(50),
@full_address nvarchar(max),
@member_id varchar(50),
@password varchar(50),
@account_status nvarchar(50)
)
as
begin
insert into member_master_tbl(full_name,dob,contact_no,email,state,city,pincode,full_address,member_id,password,account_status)
values(@full_name,@dob,@contact_no,@email,@state,@city,@pincode,@full_address,@member_id,@password,@account_status)
end 
go

----------
create procedure sp_AddAuthor
(
@id nvarchar(50),
@name nvarchar(50)
)
as
begin
Insert into author_master_tbl (author_id,author_name)
values(@id,@name)
end 
go


select max(author_id)as ID from author_master_tbl;

----------
create procedure sp_GetAuthor
as
begin
set nocount on;
select author_id,author_name from author_master_tbl;
end 
go


---------------
create procedure sp_GetAuthorByID
(
@id nchar(10)
)
as
begin
set nocount on;
select author_id,author_name from author_master_tbl where author_id=@id;
end 
go

--------------
create procedure sp_UpdateAuthor
(
@id nvarchar(50),
@name nvarchar(50)
)
as
begin
update author_master_tbl set author_name=@name where author_id=@id
end 
go


-------------
create procedure sp_DeleteAuthor
(
@id nvarchar(50)
)
as
begin
Delete from author_master_tbl where author_id=@id
end 
go


----------
select * from publisher_master_tbl

select max(publisher_id)as ID from publisher_master_tbl;


-------------
create procedure sp_UpdatePublisher
(
@id nchar(10),
@name nvarchar(50)
)
as
begin
update publisher_master_tbl set publisher_name=@name where publisher_id=@id
end 
go

-------------
create procedure sp_AddPublisher
(
@id nchar(10),
@name nvarchar(50)
)
as
begin
Insert into publisher_master_tbl (publisher_id,publisher_name)
values(@id,@name)
end 
go


------------------
create procedure sp_GetPublisher
as
begin
set nocount on;
select publisher_id,publisher_name from publisher_master_tbl order by publisher_name asc
end 
go


-----------------
create procedure sp_GetPublisher
(
@id char(10)
)
as
begin
set nocount on;
select publisher_id,publisher_name from publisher_master_tbl where publisher_id=@id
end 
go



---------------
create procedure sp_GetMemberByID
(
@id nvarchar(50)
)
as 
begin
set nocount on;
select full_name,dob,contact_no,email,state,city,pincode,full_address from member_master_tbl where member_id=@id
end 
go

---------------
create procedure sp_UpdateMemberStatus
(
@id nvarchar(50),
@qrType nvarchar(50)
)
as 
	BEGIN
		IF @qrType='Active'
		BEGIN 
			Update member_master_tbl set account_status='Active' where member_id=@id
		END
		IF @qrType='Pending'
		BEGIN 
			Update member_master_tbl set account_status='Pending' where member_id=@id
		END
		IF @qrType='Deactive'
		BEGIN 
			Update member_master_tbl set account_status='Deactive' where member_id=@id
		END
		IF @qrType='Delete'
		BEGIN 
			Delete from member_master_tbl where member_id=@id
		END
	END
go

----------- 
create procedure sp_GetMemberAllRecord
as 
begin
set nocount on;
select member_id,full_name,dob,contact_no,email,state,city,pincode,full_address,account_status from member_master_tbl order by member_id
end  
go


--------------
create procedure sp_UpdateMemberRecord
(
@full_name nvarchar(50),
@dob varchar(50),
@contact_no varchar(50),
@email varchar(50),
@state varchar(50),
@city varchar(50),
@pincode varchar(50),
@full_address nvarchar(max),
@member_id varchar(50)
)
as
begin
select * from member_master_tbl
update member_master_tbl set full_name=@full_name,dob=@dob,contact_no=@contact_no,email=@email,state=@state,city=@city,pincode=@pincode,full_address=@full_address where member_id=@member_id
end
go

---------------

------------
create procedure sp_DeleteMember
(
@member_id int
)
as
begin
Delete from member_master_tbl where member_id=@member_id
end 
go




-----------------
create procedure sp_Insert_Update_DeleteBookInventory
(
@book_id nchar(10)=null,
@book_name nvarchar(max)=null,
@genre nvarchar(max)=null,
@author_name nvarchar(max)=null,
@publisher_name nvarchar(max)=null,
@publish_date nvarchar(50)=null,
@language nvarchar(50)=null,
@edititon nvarchar(50)=null,
@book_cost nvarchar(50)=null,
@no_of_pages nchar(10)=null,
@book_description nvarchar(max)=null,
@actual_stock nchar(10)=null,
@current_stock nchar(10)=null,
@book_img_link nvarchar(max)=null,
@StatementType nvarchar(20)=''
)
as
begin
	if @StatementType='Insert'
		Begin
		Insert into book_master_tbl 
			(book_id,
			book_name,
			genre,
			author_name,
			publisher_name,
			publish_date,
			language,
			edition,
			book_cost,
			no_of_pages,
			book_description,
			actual_stock,
			current_stock,
			book_img_link)
		values
			(@book_id,
			@book_name,
			@genre,
			@author_name,
			@publisher_name,
			@publish_date,
			@language,
			@edititon,
			@book_cost,
			@no_of_pages,
			@book_description,
			@actual_stock,
			@current_stock,
			@book_img_link)
		End

	if @StatementType='Select'
		begin 
			select book_id,book_name,genre,author_name,publisher_name,publish_date,
			language,edition,book_cost,no_of_pages,book_description,actual_stock,
			current_stock,book_img_link
		from book_master_tbl
	  end

	  if @StatementType='SelectByID'
		begin 
			select book_id,book_name,genre,author_name,publisher_name,publish_date,
			language,edition,book_cost,no_of_pages,book_description,actual_stock,
			current_stock,book_img_link
		from book_master_tbl where book_id=@book_id
	  end

	if @StatementType='Update'
		begin
			update book_master_tbl
			set book_name=@book_name,
				genre=@genre,
				author_name=@author_name,
				publisher_name=@publisher_name,
				publish_date=@publish_date,
				language=@language,
				edition=@edititon,
				book_cost=@book_cost,
				no_of_pages=@no_of_pages,
				book_description=@book_description,
				actual_stock=@actual_stock,
				current_stock=@current_stock,
				book_img_link=@book_img_link
		where	book_id=@book_id
		end

	else if @StatementType='Delete'
		Begin
			delete from book_master_tbl
			Where book_id=@book_id
		End
	End
Go

---------------
create procedure sp_GetBookByID
(
@book_id nchar(10)
)
as 
begin
select book_id,book_name,genre,author_name,publisher_name,publish_date,
language,edition,book_cost,no_of_pages,book_description,actual_stock,
Coalesce(current_stock,0)as current_stock,book_img_link
from book_master_tbl where book_id=@book_id
end
go


exec sp_GetBookByID 1

select * from book_issue_tbl
---------------
create procedure sp_getIssueBook
as
begin
set nocount on
Select member_id,member_name,book_id,book_name,issue_date,due_date from book_issue_tbl order by member_id;
end 
go


----------
create procedure sp_ChechkBookStock
(
@book_id nchar(10)=null
)
as 
begin
set nocount on
select book_id,book_name,genre,author_name,publisher_name,language,edition,book_cost,no_of_pages,book_description,actual_stock,current_stock,book_img_link
from book_master_tbl where book_id=@book_id and current_stock>0
end 
go


--------------
create procedure sp_checkIssue
(
@member_id nchar(10),
@book_id nchar(10)
)
as 
begin
select * from book_issue_tbl where member_id=@member_id and book_id=@book_id
end
go


--------------
create procedure sp_BookIssue
(
@member_id nvarchar(50),
@member_name nvarchar(50),
@book_id nvarchar(50),
@book_name nvarchar(50),
@issue_date nvarchar(50),
@due_date nvarchar(50)
)
as
begin
Insert into book_issue_tbl(member_id,member_name,book_id,book_name,issue_date,due_date)
values(@member_id,@member_name,@book_id,@book_name,@issue_date,@due_date)
end
go

--------------
create procedure sp_UpdateBookStock
(
@book_id nvarchar(50)
)
as
begin
update book_master_tbl
set current_stock=current_stock-1 where book_id=@book_id
end
go

-------------
create procedure sp_returnBook_UpdateStock
(
@member_id nvarchar(50),
@book_id nvarchar(50)
)
as
begin
delete from book_issue_tbl where member_id=@member_id and book_id=@book_id;
update book_master_tbl set current_stock=current_stock+1 where book_id=@book_id;
end
go


-------------
select * from book_issue_tbl

select issue_date,due_date from book_issue_tbl

select DATEDIFF(Day,convert(nvarchar,issue_date,101),convert(nvarchar,due_date,101))AS number_of_days
from book_issue_tbl where book_id=102 and member_id=1004

select DATEDIFF(Day,convert(nvarchar,due_date,101),convert(nvarchar,GETDATE(),101))AS number_of_days
from book_issue_tbl where book_id=102 and member_id=1004


-----------
create procedure sp_GetNumOfdays
(
@book_id nvarchar(50),
@member_id nvarchar(50)
)
as
begin
select DATEDIFF(DAY,CONVERT(NVARCHAR,due_date,101),CONVERT(nvarchar,GETDATE(),101))
as number_of_day from book_issue_tbl where book_id=@book_id and member_id=@member_id
end
go


create table BookFineRecord
(
RecordID int identity(1,1)Primary Key,
book_id nvarchar(50) not null,
member_id nvarchar(50) not null,
member_fullname nvarchar(50) not null,
FineAmount decimal(10,2) not null,
FinePaymentDate date not null,
FineStatus nvarchar(50),
email nvarchar(50),
full_address nvarchar(50),
city nvarchar(50),
state nvarchar(50),
pincode nvarchar(50),
payementoption nvarchar(50),
nameoncard nvarchar(50),
cardnumber nvarchar(50),
expmonth nvarchar(50),
expyear nvarchar(50),
cvv nvarchar(50)
);

-------------------- 

create procedure sp_fine
(
@book_id nvarchar(50) ,
@member_id nvarchar(50),
@member_fullname nvarchar(50) ,
@FineAmount decimal(10,2) ,
@email nvarchar(50),
@full_address nvarchar(50),
@city nvarchar(50),
@state nvarchar(50),
@pincode nvarchar(50),
@payementoption nvarchar(50),
@nameoncard nvarchar(50),
@cardnumber nvarchar(50),
@expmonth nvarchar(50),
@expyear nvarchar(50),
@cvv nvarchar(50)

)
as
begin
Insert into BookFineRecord(book_id ,member_id ,member_fullname ,FineAmount ,FinePaymentDate ,FineStatus ,
email ,full_address ,city ,state ,pincode,payementoption ,nameoncard ,cardnumber ,expmonth ,expyear ,cvv 
)
values(@book_id ,@member_id ,@member_fullname ,@FineAmount ,GETDATE() ,'Paid',@email ,@full_address ,
@city ,@state ,@pincode,@payementoption ,@nameoncard ,@cardnumber ,@expmonth ,@expyear ,@cvv
)
end
go

----------------
create procedure sp_getMemberProfileByID
(
@member_id nvarchar(50)
)
as
begin
select member_id,full_name,dob,contact_no,email,state,city,pincode,full_address,password,account_status from member_master_tbl
where member_id=@member_id and account_status='Active'
end
go


select * from member_master_tbl

------------------
create procedure sp_UpdateMemberProfile
(
@full_name nvarchar(50),
@dob varchar(50),
@contact_no varchar(50),
@email varchar(50),
@state varchar(50),
@city varchar(50),
@pincode varchar(50),
@full_address nvarchar(max),
@member_id varchar(50),
@password nvarchar(50)
)
as
begin
select * from member_master_tbl
update member_master_tbl set full_name=@full_name,dob=@dob,contact_no=@contact_no,email=@email,state=@state,city=@city,pincode=@pincode,full_address=@full_address, password=@password where member_id=@member_id
end
go

-------------
create procedure sp_GetUserIssueBookDetail
(
@mid nvarchar(50)
)
as
begin
set nocount on
select member_id,member_name,book_id,book_name,issue_date,due_date from book_issue_tbl where member_id=@mid
end
go

------------
create procedure sp_FineDetails
(
@member_id nvarchar(50)
)
as
begin
select t1.member_fullname,t1.book_id,t2.book_name,t1.FineAmount,t1.FinePaymentDate,t1.FineStatus from BookFineRecord as t1
inner join book_master_tbl as t2 on t1.book_id=t2.book_id
where member_id=@member_id
end
go

select * from BookFineRecord

select count(*)as TotalMembers from member_master_tbl


select * from member_master_tbl
