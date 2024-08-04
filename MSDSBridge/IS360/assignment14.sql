
----------------------------------
create table Tags
(TagID Serial PRIMARY KEY NOT NULL,
Tag VARCHAR (25) NULL);

Insert into Tags
(Tag)
VALUES
('ACS'),
('Windows'),
('SQL');

select * from Tags;
-------------------------------------
create table Users
(UserID serial PRIMARY KEY NOT NULL, "User" VARCHAR (25) NULL);

Insert into Users
("User")
VALUES
('Tony'),
('Tom'),
('Bob');

select * from users;
-------------------------------------
 create table Posts
 (PostId Serial PRIMARY KEY NOT NULL,
 UserID INT NOT Null 
 References Users(UserID),
Post VARCHAR(100));

 Insert into Posts
 (userid, Post)
 Values
 (1,'ACS report ok'),
 (2,'Bad Answer'),
 (3,'good answer');

 select * from posts;

 ------------------------------------------
 create table Comments
 (UserID INT NOT Null 
 References Users(UserID),
 PostID INT NOT Null
 References Posts(PostID),
 TagID INT NOT Null 
 References Tags(TagID),
 Comment VARCHAR(100));

 Insert into Comments
 (Userid, Postid, Tagid, Comment)
 Values
 ((select userid from users where userid = 1),
 (select postid from posts where postid = 2), 
 (select tagid from tags where tagid = 1),'Good answer'),
 ((select userid from users where userid = 2),
 (select postid from posts where postid = 3), 
 (select tagid from tags where tagid = 2),'Bad answer'),
 ((select userid from users where userid = 3),
 (select postid from posts where postid = 4), 
 (select tagid from tags where tagid = 3),'The answer');

 select * from comments;
--------------------------------
select tag, post, comment from posts p join comments c on p.postid = c.postid
join tags t on t.tagid = c.tagid

select tag, post from tags t join comments c on t.tagid = c.tagid join posts p on c.postid = c.postid


