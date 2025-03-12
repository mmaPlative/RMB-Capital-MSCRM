use RMB_Staging
go

select * from Backup_CuriCapital.dbo.stringmap where [value] like '%accre%'

select objecttypecode, attributename, attributevalue, [value] from Backup_CuriCapital.dbo.stringmap where attributename='tamc_contacttype'

select objecttypecode, attributename, attributevalue, [value] from Backup_CuriCapital.dbo.stringmap where attributename='tamc_investorqualification'

select objecttypecode,attributename, attributevalue, [value] from Backup_CuriCapital.dbo.stringmap where attributename='tam_preferredphone'

select objecttypecode, attributename, attributevalue, [value] from Backup_CuriCapital.dbo.stringmap where attributename='familystatuscode'

select * from Backup_CuriCapital.dbo.account where accountid='8FFB5881-04DE-ED11-A7C7-000D3A34140D'



select * from SF_Users where name='Admin RMB'

select top 10 rec.activityid, * from dbo.email rec 

/*
CREATE TABLE [dbo].[_TableWCount](
	[TableName] [nvarchar](50) NULL,
	[TableName2] [nvarchar](50) NULL,
	[RecordCount] [int] NULL
) ON [PRIMARY]
GO


*/

--update _TableWCount set TableName2=concat('[dbo].[',TableName,']')

select * from _TableWCount order by RecordCount Desc

/*
CREATE TABLE [dbo].[_Temp](
	[TableName] [nvarchar](50) NULL,
	[SelectSearch] [nvarchar](1000) NULL
) ON [PRIMARY]
GO

*/


select * from _Temp

select SelectSearch  
		from _Temp rec
	left join _TableWCount c on c.TableName2=rec.TableName
	where c.RecordCount > 1 and
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
		order by rec.TableName, rec.SelectSearch


select distinct TableName from _Temp rec
	where rec.TableName not like '%msdyn%'
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
	order by TableName desc




select rec.contactid, rec.accountid, count(*) from dbo.contact rec group by rec.contactid, rec.accountid
	having count(*) > 2


select rec.primarycontactid, rec.second, rec.accountid, rec.tam_accountguid,  rec.name, * from dbo.account rec where rec.accountid='9A2E9416-8209-49D2-95AF-E76F757C7637'

select subject, * from activitypointer where allparties like '%9A2E9416-8209-49D2-95AF-E76F757C7637%'

select * from activitypointer where activityid in ('E3836504-0FC9-EF11-B8E9-000D3A32C2F2',
'D2E0C259-1C8D-ED11-81AC-000D3A341B5A','3D97F6FE-7EBD-EF11-B8E9-000D3A341B5A')
order by activityid

select * from email where activityid in ('E3836504-0FC9-EF11-B8E9-000D3A32C2F2',
'D2E0C259-1C8D-ED11-81AC-000D3A341B5A','3D97F6FE-7EBD-EF11-B8E9-000D3A341B5A')
order by activityid

select * from email where description like '%9A2E9416-8209-49D2-95AF-E76F757C7637%'

select distinct regardingobjecttypecode from post

select * from postrole where postid='40BBA161-F17B-ED11-81AC-000D3A3411C3'

select * from post where text like '%9A2E9416-8209-49D2-95AF-E76F757C7637%'

select * from postrole where postidname like '%9A2E9416-8209-49D2-95AF-E76F757C7637%'




/* vw_Accounts

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_Accounts'
select * from [_reImport]

delete Error_Log where taskname='vw_Accounts'

select * from vw_Accounts where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Accounts



*/
select * from SF_Users where name like '%Cronlund%'

select * from SF_RecordTypes order by SobjectType, DeveloperName

select rec.tam_currentmailingaddress, rec.tam_currentmailingaddressname, rec.tam_currentmailingaddressidname
	, rec.statecode, rec.statecodename
	, statuscode, statuscodename
	, rec.customertypecode, rec.customertypecodename
	, rec.businesstypecode, rec.businesstypecodename
	, rec.tam_accounttypeid, rec.tam_accounttypeidname
	, rec.preferredcontactmethodcode, rec.preferredcontactmethodcodename, rec.tam_preferredphone, * 
	from [Backup_CuriCapital].dbo.account rec
	--where rec.name like '%emplo%'
	where rec.tam_referredbyid is not null or rec.statuscodename is not null


select * from [Backup_CuriCapital].dbo.contact where contactid
	in (select tam_referredbyid from [Backup_CuriCapital].dbo.account)

select * from [Backup_CuriCapital].dbo.user 

select statuscode, count(*) cnt from [Backup_CuriCapital].dbo.account group by statuscode


select distinct tam_currentmailingaddress from [Backup_CuriCapital].dbo.account rec

--Verify cratedby
select distinct xCreatedByName from vw_Accounts where xCreatedByName is not null and CreatedById ='0055e000006hvhKAAQ' order by xCreatedByName

--Verify Owner
select distinct Legacy_Owner_Name__c from vw_Accounts where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'

--Verify Co_Advisor__c
select distinct xCo_Advisor from vw_Accounts where xCo_Advisor is not null and Co_Advisor__c ='0055e000006hvhKAAQ' order by xCo_Advisor

--Verify Service_Point_Person__c
select distinct xService_Point_Person from vw_Accounts where xService_Point_Person is not null and Service_Point_Person__c ='0055e000006hvhKAAQ' order by xService_Point_Person

--verify contacttype
select  xtamc_contacttype from vw_Accounts where xtamc_contacttype is not null and Type_of_Account__c is null order by xtamc_contacttype

--Verify FinServ__ReferredByUser__c
select distinct xFinServ__ReferredByUser from vw_Accounts where rtrim(ltrim(isnull(xFinServ__ReferredByUser,'')))<>''
	and FinServ__ReferredByUser__c ='0055e000006hvhKAAQ' order by xFinServ__ReferredByUser


select 
	rec.accountid
	, rec.name
	, rec.tam_referredbyid
	, rec.tam_referredbyidname
	, rec.tam_referredbyidyominame
	from Backup_CuriCapital.dbo.account rec
	where rec.tam_accounttypeidname in ('Household','Corporate')
		and rec.tam_referredbyid is not null
		order by rec.tam_referredbyidyominame

--SSIS
select * 
	from vw_Accounts

print dbo.fnParseFMName('J. Lucy Rose')


select * 
	from vw_Accounts
	where xtam_accounttypeidname='Household'


select err.ErrorMessage, rec.Service_Point_Person__c
	, rec.* 
	from Error_Log err
	left join vw_Accounts rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_Accounts'
	order by err.ErrorMessage









/* vw_contacts

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_contacts'
select * from [_reImport]

delete Error_Log where taskname='vw_contacts'

select * from vw_contacts where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Contacts

*/

select * from Backup_CuriCapital.dbo.contact where contactid='d808bc77-ca3d-ed11-9db0-0022480b4485'

select rec.tamc_contacttype, rec.tamc_contacttypename
	, rec.tamc_investorqualification, rec.tamc_investorqualificationname
	, rec.company, rec.tam_company,* 
	from Backup_CuriCapital.dbo.contact rec
	where rec.tamc_contacttypename is not null or rec.tamc_investorqualificationname is not null


select distinct rec.tamc_contacttype
	--, rec.tamc_investorqualification
	from Backup_CuriCapital.dbo.contact rec
	order by rec.tamc_contacttype

select distinct rec.tamc_investorqualification
	--, rec.tamc_investorqualification
	from Backup_CuriCapital.dbo.contact rec
	order by rec.tamc_investorqualification


select familystatuscode, count(*) cnt from Backup_CuriCapital.dbo.contact group by familystatuscode order by familystatuscode

--Verify cratedby
select distinct xCreatedByName from vw_contacts where xCreatedByName is not null and createdbyId is null order by xCreatedByName

--***** Verify Owner
select distinct xOwnerId from vw_contacts where xOwnerId is not null and OwnerId is null order by xOwnerId


--SSIS
select * from vw_contacts

	where Legacy_Id__c='d808bc77-ca3d-ed11-9db0-0022480b4485'



select err.ErrorMessage
	, rec.* 
	from Error_Log err
	left join vw_contacts rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_contacts'
	order by err.ErrorMessage


select * from succ_contacts






/* vw_Account_ReferredByContact

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_Account_ReferredByContact'
select * from [_reImport]

delete Error_Log where taskname='vw_Account_ReferredByContact'

select * from vw_Account_ReferredByContact where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


*/

--***** verify FinServ__ReferredByContact__c
select * from vw_Account_ReferredByContact where FinServ__ReferredByContact__c is null


--SSIS
select * from vw_Account_ReferredByContact



select err.ErrorMessage
	, rec.* 
	from Error_Log err
	left join vw_Account_ReferredByContact rec on rec.Legacy_Id__c = err.Id2
	where TaskName='vw_Account_ReferredByContact'
	order by err.ErrorMessage








/* vw_AccountContactRelation

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_AccountContactRelation'
select * from [_reImport]

delete Error_Log where taskname='vw_AccountContactRelation'

select * from vw_AccountContactRelation where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


*/

select * from sf_accountcontactrelation

select * from vw_AccountContactRelation where accountid 
	in (select AccountId from vw_AccountContactRelation group by AccountId having count(*) > 1)
	order by accountid, roles
	


--***** verify FinServ__ReferredByContact__c
select * from vw_Account_ReferredByContact where FinServ__ReferredByContact__c is null

--
select * from vw_AccountContactRelation
	order by ContactId, seq

--SSIS
select * from vw_AccountContactRelation
	where XId is null
	order by ContactId, seq




select err.ErrorMessage
	, rec.* 
	, acc.name
	from Error_Log err
	left join vw_AccountContactRelation rec on 
		cast(rec.AccountId as nvarchar(60)) = err.Id1 and
		cast(rec.contactid as nvarchar(60)) = err.Id2
	left join Succ_Accounts acc on acc.SalesforceRecordId=rec.AccountId
	where err.TaskName='vw_AccountContactRelation'
	order by err.ErrorMessage









/* vw_leads

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_leads'
select * from [_reImport]

delete Error_Log where taskname='vw_leads'

select * from vw_leads where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Leads

*/
select * from Backup_CuriCapital.dbo.[lead] where firstname like '%joann%'

select tam_leadstage, count(*) cnt from Backup_CuriCapital.dbo.[lead] group by tam_leadstage order by tam_leadstage


--Verify cratedby
select distinct xCreatedByName from vw_leads where xCreatedByName is not null and createdbyId is null order by xCreatedByName

--***** Verify Owner
select distinct xOwnerId from vw_leads where xOwnerId is not null and OwnerId is null order by xOwnerId

select rec.companyname, rec.accountidname from vw_leads rec


--SSIS
select * from vw_leads

	where description is not null


select err.ErrorMessage
	, rec.* 
	from Error_Log err
	left join vw_leads rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_leads'
	--and err.ErrorMessage like '%last%'
	order by err.ErrorMessage

select * from succ_Leads

select * from Error_Log where TaskName='Delete'







/* vw_Opportunities

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_Opportunities'
select * from [_reImport]

delete Error_Log where taskname='vw_Opportunities'

select * from vw_Opportunities where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Opportunities

*/

select tam_opportunitystage, count(*) cnt from Backup_CuriCapital.dbo.opportunity group by tam_opportunitystage order by tam_opportunitystage

select rec.opportunityid
, rec.tam_opportunitystagename
, rec.tam_opportunitystage
, rec.createdbyname
, rec.createdon
, rec.name
, rec.customerid
, rec.customeridname
, rec.estimatedclosedate
, rec.tam_estimatedrevenue
, rec.tam_opportunitysource
, rec.tam_opportunitysourcename
, * from vw_Opportunities rec


--Verify cratedby
select distinct xCreatedByName from vw_Opportunities where xCreatedByName is not null and createdbyId is null order by xCreatedByName

--***** Verify Owner
select distinct xOwnerId from vw_Opportunities where xOwnerId is not null and OwnerId is null order by xOwnerId


--SSIS
select * from vw_Opportunities



select err.ErrorMessage
	, rec.* 
	from Error_Log err
	left join vw_Opportunities rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_Opportunities'
	order by err.ErrorMessage








SELECT activityid, description  INTO Act_Desc FROM Backup_CuriCapital.dbo.activitypointer

/* vw_Tasks

truncate table Act_Desc
insert into Act_Desc (activityid, description) select activityid, description FROM Backup_CuriCapital.dbo.activitypointer

update Act_Desc set [Desc]=dbo.fnStripTags(Description)

truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_Tasks'
	and ErrorMessage not like '%Lead or Person Account%'
select * from [_reImport]

delete Error_Log where taskname='vw_Tasks'

select * from vw_Tasks where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Tasks

*/
select count(*)
	from Backup_CuriCapital.dbo.activitypointer rec

select top 100
	rec.actualend
	, rec.actualstart
	, rec.scheduledstart
	, rec.scheduledend
	, rec.owneridname
	, * 
	from Backup_CuriCapital.dbo.activitypointer rec
	where rec.actualstart is null and rec.actualend is null

select distinct regardingobjecttypecode 
	from Backup_CuriCapital.dbo.activitypointer rec order by regardingobjecttypecode

select distinct statecodename 
	from Backup_CuriCapital.dbo.activitypointer rec order by statecodename

select distinct activitytypecodename 
	from Backup_CuriCapital.dbo.activitypointer rec order by activitytypecodename

select rec.systemuserid, rec.firstname, rec.lastname, * 
	from Backup_CuriCapital.dbo.systemuser rec
	where systemuserid in (select regardingobjectownerid from Backup_CuriCapital.dbo.post )

select count(*)
	from Backup_CuriCapital.dbo.post rec
select rec.regardingobjectid
	, rec.regardingobjectidname
	, rec.postregardingid
	, * 
	from Backup_CuriCapital.dbo.post rec



select distinct regardingobjecttypecode 
	from Backup_CuriCapital.dbo.post rec order by regardingobjecttypecode



--SSIS
select * from vw_Tasks
	where whoid is not null or whatid is not null

select count(*) from vw_Tasks

select count(*)
	from Error_Log err
	
	where TaskName='vw_Tasks'
	and err.ErrorMessage not like '%createddate%'

select err.ErrorMessage, len(description)
	, rec.* 
	from Error_Log err
	left join vw_Tasks rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_Tasks'
	--and err.ErrorMessage not like '%Lead or Person Account%'
	order by err.id1









/* vw_Interactions


truncate table [_reImport]
insert into [dbo].[_reImport] (Legacy_Id__c, ErrorMessage) select Id1, ErrorMessage from Error_Log where taskname='vw_Interactions'
	and ErrorMessage not like '%Lead or Person Account%'
select * from [_reImport]

delete Error_Log where taskname='vw_Interactions'

select * from vw_Tasks where Legacy_Id__c in (select Legacy_Id__c from [_reImport] )


drop table succ_Interactions

*/
select count(*)
	from Backup_CuriCapital.dbo.activitypointer rec

select * from vw_interactions where leadId is not null

--SSIS
select * 
	from vw_Interactions

select count(*) from vw_Interactions


select err.ErrorMessage, len(description)
	, rec.* 
	from Error_Log err
	left join vw_Interactions rec on rec.Legacy_Id__c = err.Id1
	where TaskName='vw_Interactions'
	--and err.ErrorMessage not like '%Lead or Person Account%'
	order by err.id1

An error returned from Salesforce for the service call: We can't save this record because the “Update Meeting Time on Account Record” 
process failed. Give your Salesforce admin these details. This error occurred when the flow tried to update records:
DUPLICATE_VALUE: Maximum number of duplicate updates in one batch (12 allowed). Attempt to update Id more than once in this Api call: 
001bf00000BSQq4. You can look up ExceptionCode values in the SOAP API Developer Guide. Error ID: 1619473565-114595 (58182527)ook up 
ExceptionCode values in the SOAP API Developer Guide. Error ID: 1619473565-114595 (58182527) (StatusCode: CANNOT_EXECUTE_FLOW_TRIGGER)























select 
	rec.regardingobjectid
	, rec.regardingobjectidname
	, ac.activityid
	, ac.regardingobjectid
	, ac.regardingobjectidname
	, * from [Backup_CuriCapital].dbo.post rec
	left join [Backup_CuriCapital].dbo.activitypointer ac on ac.activityid=rec.regardingobjectid
	where rec.RegardingObjectTypeCode<>'lead'
	and ac.activityid is null




select 
	 * from [Backup_CuriCapital].dbo.postrole rec
	 where rec.postid='6BCB66D0-B427-ED11-9DB1-000D3A3031F9'


select 
	 * from [Backup_CuriCapital].dbo.postregarding rec
	 where rec.postregardingid='1D8949B6-9228-ED11-9DB1-000D3A30EBC3'


select * from Backup_CuriCapital.dbo.account where 
	accountid in ('F8C808BC-5C22-ED11-B83E-000D3A37FE21','049303F1-07BC-EC11-983F-000D3A5CA6A8','4CA6B7A2-ADDA-4259-9D0C-CF3AB857157E')
select * from Backup_CuriCapital.dbo.contact where 
	contactid in ('F8C808BC-5C22-ED11-B83E-000D3A37FE21','049303F1-07BC-EC11-983F-000D3A5CA6A8','4CA6B7A2-ADDA-4259-9D0C-CF3AB857157E')
select * from Backup_CuriCapital.dbo.opportunity where 
	opportunityid in ('F8C808BC-5C22-ED11-B83E-000D3A37FE21','049303F1-07BC-EC11-983F-000D3A5CA6A8','4CA6B7A2-ADDA-4259-9D0C-CF3AB857157E')
select * from Backup_CuriCapital.dbo.lead where 
	leadid in ('F8C808BC-5C22-ED11-B83E-000D3A37FE21','049303F1-07BC-EC11-983F-000D3A5CA6A8','4CA6B7A2-ADDA-4259-9D0C-CF3AB857157E')






