with student_grade as(
    select s.* , g.grade
    from students s
    join grades g
    on s.marks between g.min_mark and g.max_mark
)
select 
        case
            when grade < 8 then null
            else name 
        end as name,
        grade,
        marks
from student_grade
order by grade desc,
        case 
            when grade >= 8 then name
        end asc,
        case 
            when grade < 8 then marks
        end asc;
