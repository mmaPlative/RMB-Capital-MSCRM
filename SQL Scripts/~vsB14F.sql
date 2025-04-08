with u as
(select distinct xCreatedByName from vw_Accounts where xCreatedByName is not null and CreatedById ='0055e000006hvhKAAQ'
union all
--Verify Owner
select distinct Legacy_Owner_Name__c from vw_Accounts where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'
union all
--Verify Co_Advisor__c
select distinct xCo_Advisor from vw_Accounts where xCo_Advisor is not null and Co_Advisor__c ='0055e000006hvhKAAQ' 
union all
--Verify Service_Point_Person__c
select distinct xService_Point_Person from vw_Accounts where xService_Point_Person is not null and Service_Point_Person__c ='0055e000006hvhKAAQ'
union all
--Verify cratedby
select distinct xCreatedByName from vw_contacts where xCreatedByName is not null and createdbyId  ='0055e000006hvhKAAQ'
union all
--***** Verify Owner
select distinct Legacy_Owner_Name__c from vw_contacts where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'


union all
--Verify cratedby
select distinct xCreatedByName from vw_Interaction_Summary where xCreatedByName is not null and createdbyId  ='0055e000006hvhKAAQ'
union all
--***** Verify Owner
select distinct Legacy_Owner_Name__c from vw_Interaction_Summary where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'

union all
--Verify cratedby
select distinct xCreatedByName from vw_Tasks where xCreatedByName is not null and createdbyId  ='0055e000006hvhKAAQ'
union all
--***** Verify Owner
select distinct Legacy_Owner_Name__c from vw_Tasks where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'


union all
--Verify cratedby
select distinct xCreatedByName from vw_Leads where xCreatedByName is not null and createdbyId  ='0055e000006hvhKAAQ'
union all
--***** Verify Owner
select distinct Legacy_Owner_Name__c from vw_Leads where Legacy_Owner_Name__c is not null and OwnerId ='0055e000006hvhKAAQ'

)


select distinct * from u order by xCreatedByName