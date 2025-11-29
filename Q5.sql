select h.hacker_id,
       h.name,
       sum(t.max_score) as total_score
from Hackers h
join (
    select s.hacker_id,
           s.challenge_id,
           max(s.score) as max_score
    from Submissions s
    group by s.hacker_id, s.challenge_id
) as t
  on h.hacker_id = t.hacker_id
group by h.hacker_id, h.name
having SUM(t.max_score) > 0
order by total_score desc, h.hacker_id asc;
