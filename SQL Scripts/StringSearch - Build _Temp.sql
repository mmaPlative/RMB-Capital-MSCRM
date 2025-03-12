use Backup_CuriCapital
go

drop Table _TableWCount
go

CREATE TABLE _TableWCount(
	[TableName] [nvarchar](50) NULL,
	[TableName2] [nvarchar](50) NULL,
	[RecordCount] [int] NULL
) ON [PRIMARY]
GO

insert into _TableWCount ([TableName], [RecordCount]) 

select t.name TableName, i.rows Records
from sysobjects t, sysindexes i
where t.xtype = 'U' and i.id = t.id and i.indid in (0,1)
go



drop Table _Temp
go

CREATE TABLE [dbo].[_Temp](
	[TableName] [nvarchar](50) NULL,
	[SelectSearch] [nvarchar](1000) NULL
) ON [PRIMARY]
GO


/*

select distinct data_Type from  INFORMATION_SCHEMA.COLUMNS

int
decimal
varbinary
varchar
datetime
numeric
uniqueidentifier
float
real
bigint
nvarchar
bit
*/

DECLARE @SearchStr nvarchar(100) = 'XXXXXXXXXX' 

DECLARE File_Cursor CURSOR
FAST_FORWARD
FOR 

	select --top 10
		TABLE_NAME
		, COLUMN_NAME
		, DATA_TYPE
	from  INFORMATION_SCHEMA.COLUMNS
	where DATA_TYPE not in ('INT','decimal','datetime','numeric','float','real','bigint','bit')


--DECLARE @Results TABLE (ColumnName nvarchar(370), ColumnValue nvarchar(3630))

DECLARE @SelectSearch nvarchar(500), @SearchStr2 nvarchar(255)
DECLARE @TABLE_NAME nvarchar(500), @COLUMN_NAME nvarchar(500), @DATA_TYPE nvarchar(500)

SET @SearchStr2 = QUOTENAME('%' + @SearchStr + '%','''')

OPEN File_Cursor
FETCH NEXT FROM File_Cursor INTO @TABLE_NAME, @COLUMN_NAME, @DATA_TYPE
WHILE @@FETCH_STATUS=0
	BEGIN

	Set @SelectSearch = 'SELECT ''' + @TABLE_NAME + '.' + @COLUMN_NAME + ''', LEFT(' + @COLUMN_NAME + ', 3630) 
                FROM ' + @TABLE_NAME + ' (NOLOCK) ' +
                ' WHERE ' + @COLUMN_NAME + ' LIKE ' + @SearchStr2

	print @SelectSearch

    INSERT INTO _temp
		(TableName, SelectSearch) 
		values (@TABLE_NAME, @SelectSearch)

	FETCH NEXT FROM File_Cursor INTO @TABLE_NAME, @COLUMN_NAME, @DATA_TYPE
	END

CLOSE File_Cursor
DEALLOCATE File_Cursor
