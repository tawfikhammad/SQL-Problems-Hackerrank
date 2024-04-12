select a.contest_id,
hacker_id,
name,
sum(tot_s),
sum(tot_a_s),
sum(tot_v),
sum(tot_u_v)
from contests a 
join colleges b on b.contest_id = a.contest_id
join challenges c on c.college_id = b.college_id
left join (select challenge_id,
     sum(total_views) tot_v,
     sum(total_unique_views) tot_u_v
     from view_stats
      group by challenge_id
     ) as x on x.challenge_id = c.challenge_id
left join (select challenge_id,
          sum(total_submissions) tot_s,
           sum(total_accepted_submissions) tot_a_s
           from submission_stats
           group by challenge_id
) as y on y.challenge_id = c.challenge_id
group by  a.contest_id,
hacker_id,
name
having isnull(sum(tot_s),0)+isnull(sum(tot_a_s),0)+isnull(sum(tot_v),0)+isnull(sum(tot_u_v),0) <> 0
order by a.contest_id
