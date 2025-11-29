SET NOCOUNT ON;
with ranked_wands as (
    select 
        w.id,
        wp.age,
        w.coins_needed,
        w.power,
        min(w.coins_needed) OVER (
            partition by wp.age, w.power
        ) as min_coins
    from wands w
    join wands_property wp on w.code = wp.code
    where wp.is_evil = 0
)
select id, age, coins_needed, power
from ranked_wands
where coins_needed = min_coins
order by power desc, age desc;
go