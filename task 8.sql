use library;
select * from author;
select * from  book;
DELIMITER $$

create procedure add_author (
    in p_authorid int,
    in p_firstname VARCHAR(100),
    in p_lastname VARCHAR(100)
)
begin
    insert into author (authorid, firstname, lastname)
    values (p_authorid, p_firstname, p_lastname);
end$$

DELIMITER ;

call add_author(1007, 'arjun', 'krishna');
select * from author;





DELIMITER $$

create function get_fullname(p_authorid int)
returns varchar(200)
deterministic
begin
    declare fullname varchar(200);

    select CONCAT(firstname, ' ', lastname) into fullname
    from author
    where authorid = p_authorid;

    return fullname;
end$$


DELIMITER ;


select get_fullname(1001);
