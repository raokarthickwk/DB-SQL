-- normal query
 select school_name,sd.school_id ,count(1) as players
 from student_dataset sd 
 join school_dataset sd2 
 on sd.school_id =sd2.school_id 
 group by 1,2

 -- optimized
select school_name,sub.* from (select school_id,count(*) as players from student_dataset sd2 
 group by 1) sub
 join school_dataset sd 
 on sd.school_id = sub.school_id