use Backup_CuriCapital
go
DECLARE @Results TABLE (ColumnName nvarchar(370), ColumnValue nvarchar(3630))

/*
select * from _temp 

select top 1 * from _temp

SELECT '[dbo].[_Temp].[SelectSearch]', LEFT([SelectSearch], 3630)                   FROM [dbo].[_Temp] (NOLOCK)  WHERE [SelectSearch] LIKE '%9A2E9416-8209-49D2-95AF-E76F757C7637%'

update _Temp set SelectSearch=
	replace(SelectSearch,'AA4EFBFE-238D-ED11-81AC-000D3A3411C3','XXXXXXXXXX')

*/


Declare @str as nvarchar(200)
set @str = 'Accredit'

DECLARE File_Cursor CURSOR
FAST_FORWARD
FOR 
	select SelectSearch  
		from _Temp rec
	left join _TableWCount c on c.TableName=rec.TableName
	where  c.RecordCount > 1 and
		rec.TableName not like '%msdyn%'
	and rec.TableName not like '%mspp_%'
	and rec.TableName not like '%msfp_%'
	and rec.TableName not like '%tam_%'
	and rec.TableName not like '%system%'
	and rec.TableName not like '%sdk%'
	and rec.TableName not like '%power%'
	and rec.TableName not like '%work%'
	and rec.TableName not like '%timezone%'
	and rec.TableName not like 'template%'
	and rec.TableName not like '%team%'
	and rec.TableName not like '%import%'
	and rec.TableName not like '%flow%'
	and rec.TableName not like '%bulk%'
	and rec.TableName not like '%_temp%'
	and rec.TableName not like '%_table%'

	and rec.TableName not like '%account%'
	and rec.TableName not like '%contact%'
	and rec.TableName not like '%lead%'

	and rec.SelectSearch not like '%id%'

		order by rec.TableName, rec.SelectSearch

DECLARE @SelectSearch nvarchar(500)

OPEN File_Cursor
FETCH NEXT FROM File_Cursor INTO @SelectSearch
WHILE @@FETCH_STATUS=0
	BEGIN

	set @SelectSearch=replace(@SelectSearch,'XXXXXXXXXX',@str)

	INSERT INTO @Results
    EXEC
    (
        @SelectSearch
    )	
	
	FETCH NEXT FROM File_Cursor INTO @SelectSearch
	END

CLOSE File_Cursor
DEALLOCATE File_Cursor

SELECT ColumnName, ColumnValue FROM @Results order by ColumnValue, ColumnName