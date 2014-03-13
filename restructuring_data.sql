'''comparison of column names'''
SELECT table_name, column_name
FROM information_schema.columns 
where table_name like 'sgua_cl%' or table_name like 'erasmus_cl%' or table_name like 'sgup_cl%' or table_name like 'sgur_cl%' or table_name like 'ulmu_cl%'

'''Updating project name'''
SELECT substring(Project_name, 1,5) Project_name
    FROM `g-b (test)`.`sgup_clinicaldata` where Project_name like '%.';

update `g-b (test)`.`sgup_clinicaldata` set  Project_name= concat(substring(Project_name, 1,2), substring(Project_name, 4, 2),
            substring(Project_name, 7, 2)) 

update `g-b (test)`.`sgup_clinicaldata` set  Project_name= substring(Project_name, 1,5) where Project_name like '%.'

'''like vlookup in excel where FAB column in sgup_clinicaldata is being populated with sgup_fab data when the project name matches'''
update sgup_clinicaldata
        inner join
    sgup_fab ON sgup_clinicaldata.Project_name = substring(sgup_fab.Project_name, 1, 8) 
set 
    sgup_clinicaldata.FAB = sgup_fab.FAB

'''removing duplicate rows and adding a new column where mutations	coded in binary'''
create table cleaned_sgup_clinical_data as (select distinct * from sgup_clinical_data)

update `cleaned: sgup_clinical_data` set Mutation_status_relapse_binary=null
Update `cleaned: sgup_clinical_data` set Mutation_status_relapse_binary=1 where Mutation_status_at_relapse="FLT3+" 
update `cleaned: sgup_clinical_data` set Mutation_status_relapse_binary=0 where Mutation_status_at_relapse="FLT 3 neg"

