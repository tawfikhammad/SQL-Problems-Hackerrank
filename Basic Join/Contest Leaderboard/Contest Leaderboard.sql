SELECT ct.hacker_id, h.name, sum(ct.max_score) ms
FROM (SELECT hacker_id, challenge_id , max(score) as max_score
   FROM Submissions 
   GROUP BY hacker_id, challenge_id) as ct
join Hackers h on ct.hacker_id = h.hacker_id
group by ct.hacker_id, h.name
having sum(ct.max_score) > 0
ORDER BY ms DESC, hacker_id ASC;
