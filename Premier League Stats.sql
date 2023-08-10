select B.team_name as team_name, sum(T.mp) as matches_played, sum(T.pts) as points, 
       sum(T.gf) as goal_for, sum(T.ga) as goal_against, sum(T.gf)-sum(T.ga) as goal_diff 
from (select home_team_id as tid, count(*) as mp, sum(home_team_goals) as gf, 
             sum(away_team_goals) as ga,sum(case when home_team_goals>away_team_goals then 3 
                                                 when home_team_goals=away_team_goals then 1 else 0 end ) as pts 
      from Matches
      group by home_team_id
      union
      select away_team_id as tid, count(*) as mp, sum(away_team_goals) as gf, sum(home_team_goals) as ga,
                                        sum(case when away_team_goals>home_team_goals then 3 
                                                 when away_team_goals=home_team_goals then 1 
                                                 else 0 end) as pts 
      from Matches
      group by away_team_id) as T, Teams as B 
where B.team_id=T.tid
group by T.tid, B.team_name
order by points desc, goal_diff desc, team_name; 