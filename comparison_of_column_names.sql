#look at the column names in each table
SELECT table_name, column_name
FROM information_schema.columns 
where table_name like 'sgua_cl%' or table_name like 'erasmus_cl%' or table_name like 'sgup_cl%' or table_name like 'sgur_cl%' or table_name like 'ulmu_cl%'

#nested query to only show column names that appear more than once
SELECT column_name from (select table_name, column_name FROM information_schema.columns where table_name like 'sgua_cl%' or table_name like 'erasmus_cl%' or table_name like 'sgup_cl%' or table_name like 'sgur_cl%' or table_name like 'ulmu_cl%') columns  group by column_name having count(column_name)>1

#check if each table had the same number of columns
SELECT count(column_name), table_name
FROM information_schema.columns 
where table_name like 'sgua_cl%' or table_name like 'erasmus_cl%' or table_name like 'sgup_cl%' or table_name like 'sgur_cl%' or table_name like 'ulmu_cl%'
group by table_name
