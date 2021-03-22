create database DemoCrud

use DemoCrud

create table tbl_Employee(
Sr_no int primary key not null,
Emp_name nvarchar(500) not null,
City nvarchar(500),
STATE nvarchar(500),
Country nvarchar(500),
Department nvarchar(500),
flag nvarchar(500)
)
go

create proc Sp_Employee
@Sr_no int, @Emp_name nvarchar(500),
@City nvarchar(500), @STATE nvarchar(500),
@Country nvarchar(500), @Department nvarchar(500),
@flag nvarchar(500)

as begin 
	if (@flag = 'insert')
	begin 
		insert into dbo.tbl_Employee
		( Emp_name, City, STATE, Country, Department)
		Values
		(@Emp_name, @City, @STATE, @Country, @Department)
	end
	else if (@flag = 'update')
	begin 
		update dbo.tbl_Employee set
			Emp_name=@Emp_name, City=@City,
			STATE=@STATE, Country=@Country,
			Department=@Department
		where Sr_no=@Sr_no
	end	
	else if (@flag = 'delete')
	begin 
		delete from tbl_Employee
		where Sr_no = @Sr_no
	end
	else if (@flag = 'getid')
	begin
		select * from tbl_Employee
		where Sr_no = @Sr_no
	end
	else if (@flag = 'get')
	begin
		select * from tbl_Employee
	end
end

insert into tbl_Employee values(1,N'abc',N'abc',N'abc',N'abc',N'abc',null)