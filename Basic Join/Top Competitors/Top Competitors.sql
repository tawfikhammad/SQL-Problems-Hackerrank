select h.hacker_id,h.name 
from Submissions s
    JOIN  Challenges c ON c.challenge_id = s.challenge_id
    JOIN Difficulty d  ON d.difficulty_level = c.difficulty_level
    JOIN Hackers h ON h.hacker_id = s.hacker_id 
where d.score = s.score 
GROUP BY h.hacker_id, h.name
HAVING count(c.challenge_id) > 1
ORDER BY count(c.challenge_id) DESC, h.hacker_id ;
