/* Enter your query here. */
select h.hacker_id, h.name
from hackers h
join submissions s using(hacker_id)
join (
    select c.challenge_id as challenge_id, d.score as max_score
    from difficulty d
    join challenges c using(difficulty_level)
) as sq1 using(challenge_id)
where s.score = sq1.max_score
group by h.hacker_id, h.name
having count(*) > 1
order by count(*) desc, h.hacker_id;

-- mysql version --> 5.7.27-0ubuntu0.18.04.1 doesn't support cte yet