select * from Genre;

insert into Artist (artistname, yearestablished) 
values ("Metallica", 1981);

insert into Album
select null, "Hardwired... To Self-Destruct", 2016, 4652, "Blackened", artist.artistid, genre.genreid
from Artist, Genre
where artist.artistname = "Metallica"
and genre.label = "Heavy Metal";

insert into Song
select null, "ManUNkind", 415, "11/18/2016", Genre.GenreId, artist.artistid, album.albumid
from Artist, Genre, Album
where artist.artistname = "Metallica"
and genre.label = "Heavy Metal"
and album.title = "Hardwired... To Self-Destruct";

select a.title, s.title, ar.artistname 
from Album a left join Song s on s.AlbumId = a.albumid left join Artist ar on ar.artistid = s.artistid
where s.title = "ManUNkind";

select count(album.title) as "# of songs" , album.title as "Album"
from Song
left join Album on song.AlbumId = album.AlbumId
group by album.title;

select count(artist.artistname) as "# of songs" , artist.artistname as "Artist"
from Song
left join Artist on song.artistid = artist.artistId
group by artist.artistname;

select count(genre.GenreId) as "# of songs" , genre.Label as "Genre"
from Song
left join Genre on song.genreid = genre.GenreId
group by genre.genreid;

select album.title as "Longest Album", max(album.albumlength) as "Duration" from album;

select song.title as "Longest Song", max(song.songlength) as "Duration" from song;

select song.title as "Longest Song", max(song.songlength) as "Duration", album.Title as "Album" from song left join Album on song.AlbumId = album.AlbumId;