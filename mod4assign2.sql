use modassign2;
select * from games;
select * from game_sales;

/*TASK-1. Insert a new game with the title "Future Racing", genre "Racing", release date
"2024-10-01", and developer "Speed Studios".*/

insert into games(GameTitle, Genre, ReleaseDate, Developer)
values ('Future Racing','Racing', '2024-10-01', 'Speed Studios');

/*TASK-2.  Update the price of the game with GameID 2 on the PlayStation platform to 60.*/

update game_sales
set Price = 60
where GameID=2 and Platform = 'PlayStation';

/*TASK-3. . Delete the record of the game with GameID 5 from the Game Sales table. */

delete from game_sales
where GameID = 5;

/*TASK-4. Calculate the total number of units sold for each game across all platforms and regions */

select GameID, sum(UnitsSold) as TotalUnitsSold 
from game_sales 
group by GameID

/*TASK-5. Identify the game with the highest number of units sold in North America.*/

select GameID, max(UnitsSold) as HighestUnitsSold
from game_sales
where SalesRegion = 'North America'
group by GameID
order by HighestUnitsSold desc
limit 1;

/*TASK-6. Get the game titles, platforms, and sales regions along with the units sold for each game.*/

select g.GameTitle, gs.Platform, gs.SalesRegion, gs.UnitsSold
from games g
join game_sales gs on g.GameID = gs.GameID;

/*TASK-7. Find all games, including those that have no sales data in the Game Sales table.*/

select g.GameTitle
from games g 
left join game_sales gs on g.GameID = gs.GameID
where gs.GameID is null;

/*TASK-8. Retrieve sales records where the game details are missing in the Games table.*/

select gs.GameID, gs.Platform, gs.SalesRegion, gs.UnitsSold, gs.price
from game_sales gs
left join games g on gs.GameID = g.GameID
where g.GameID is null

/*TASK-9.  Retrieve game sales data for North America and Europe removing duplicate records*/

select distinct gs.GameID, gs.Platform, gs.SalesRegion, gs.UnitsSold, gs.price
from game_sales gs
where gs.SalesRegion in ('north America', 'Europe');

/*TASK-10. . Retrieve all game sales data from North America and Europe without removing duplicate records.*/

select gs.GameID, gs.Platform, gs.SalesRegion, gs.UnitsSold, gs.price
from game_sales gs
where gs.SalesRegion in ('North America','Europe');

