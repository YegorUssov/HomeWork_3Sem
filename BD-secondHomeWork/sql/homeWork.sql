drop table library;

create table library (
                            id number,
                            pid number,
                            title varchar(256),
                            year_of_creation number

);

insert into library values (1, null, 'Россия', null),
                                (2, 1, 'Москва', null),
                                (3, 1, 'Cанкт-Петербург', null)
                                (4, 1, 'Казань', null)
                                (6, 3, 'Императорская Публичная библиотека', 1795
                                (7, 3, 'Российская национальная библиотека', 1917)
                                (8, 2, 'Центральная библиотека имени Добролюбова', 1848)
                                (9, 2, 'Библотека имени Некрасова', 1919)
                                (10, 4, 'Научная библиотека имени Лобачевского', 1809)
                                (11, 4, 'Науиональная библиотка РТ', 1965)
                                (12, 6, 'Зал-1', 1795)
                                (13, 7, 'Зал-1', 1917)
                                (14, 8, 'Зал-1', 1848)
                                (15, 9, 'Зал-1', 1919)
                                (16, 10, 'Зал-1', 1809)
                                (17, 11, 'Зал-1', 1965)
                                (18, 6, 'Зал-2', 1967)
                                (18, 8, 'Зал-2', 1850)
                                (18, 9, 'Зал-2', 1923)
;


select id, pid, title, author, year_of_creation, level,
       CONNECT_BY_ISLEAF as IsLeaf,
    prior title as Parent,
    CONNECT_BY_ROOT title as Root
from library
start with pid is null
connect by prior id = pid
order SIBLINGS by title;