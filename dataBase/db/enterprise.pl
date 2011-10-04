/**
 *	department(<deparment name>, <department chief>, [<department worker1>,<department worker2>,...]).
 *	<department chief>,<department worker> := worker(<worker name>, <date of birth>, <worker gender>,
 *	                                                 <worker post>, <worker profession>, 
 *	                                                 <family state>, <amount of children>, 
 *	                                                 <disablement>, <military rank>, <work conditions>)
 *	<date of birth> := date(<day>,<month>,<year>)
 *	<worker profession> := profession(<specialty>, <level>)
 *	
 *	below is shortened version of this syntax
 */
:-module(enterprise,[department/3]).

department(vodopostachannya, 
           worker('Bohdan Yarskyy', male, date(23,8,1956), 'main engineer', profession('engineer-electrician', 5), 3),
           [worker('Dmytro Kibets', male, date(12,4,1984), locksmith, profession(locksmith, 4), 2),
            worker('Artem Kit', male, date(15,8,1968), 'excavator operator', profession(driver, 5), 0),
            worker('Maryana Yuzerska', female, date(12,7,1976), craftsman, profession(blacksmith, 4), 1),
            worker('Halyna Kolomiyets', female, date(10,3,1953), welder, profession(welder, 4), 6),
            worker('Ihor Olevskyy', male, date(12,1,1973), driver, profession(driver, 3), 2),
            worker('Yaryna Voloshyn', female, date(11,6,1967), security, profession(boxer, 5), 3)]).

department(vodovidvedennia, 
           worker('Andriy Spaskyy', male, date(13,7,1985), 'energy engineer', profession('engineer-electrician', 5), 0),
           [worker('Oleksiy Ryba', male, date(7,12,1974), 'pumping instalations driver', profession(engineer, 4), 1),
            worker('Yaroslav Buchatskyy', male, date(8,5,1965), driver, profession(driver, 4), 1),
            worker('Oleksandr Kaharlytskyy', male, date(3,9,1982), electrician, profession(electrician, 3), 2),
            worker('Yevhen Koretskyy', male, date(17,10,1967), 'purificatory plant operator', profession(programmer, 3), 2),
            worker('Roman Yatsevych', male, date(9,11,1964), 'excavator operator', profession('excavator operator', 5), 2)]).

department(marketing, 
           worker('Kateryna Zinkevych', female, date(13,5,1976), 'marketing department chief', profession(marketer, 5), 2),
           [worker('Natalia Yezerska', female, date(3,3,1987), inspector, profession(accountant, 4), 2),
            worker('Marta Hrynevych', female, date(28,2,1975), secretary, profession(economist, 3), 3),
            worker('Oksana Hlukhovets', female, date(1,12,1987), inspector, profession(economist, 3), 2)]).

department(administration, 
           worker('Ivan Vyrvyhvist', male, date(1,2,1986), chief, profession('marketing director', 6), 3),
           [worker('Mykola Biloshtan', male, date(12,7,1978), accountant, profession(accountant, 5), 2),
            worker('Khrystyna Artemovych', female, date(25,8,1979), 'human resources inspector', profession('managment director', 5), 2),
            worker('Inna Tolochko', female, date(17,9,1985), secretary, profession(librarian, 5), 0),
            worker('Olha Turenko', female, date(18,3,1970), lawyer, profession(lawyer, 6), 2),
            worker('Martyn Lyutyy', male, date(9,7,1972), programmer, profession(programmer, 4), 2),
            worker('Klym Yasynets', male, date(3,1,1987), security, profession(boxer, 6), 1)]).
