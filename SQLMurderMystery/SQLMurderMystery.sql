/* crime was a murder that happened sometime on Jan.15, 2018 in SQL City*/
select * 
from crime_scene_report
where type = 'murder' and city = 'SQL City' and date = '20180115';

/* from the crime_scene_report shows Security footage that there were 2 witnesses. The first witness 
lives at the last house on "Northwestern Dr". The second witness, named Annabel, l
ives somewhere on "Franklin Ave".*/
/*lets find this two wintness*/
select * 
from person
where (address_street_name = 'Northwestern Dr') or (address_street_name = 'Franklin Ave' and name like '%Annabel%')
order by address_number desc;

/*we got id : 14887  name : Morty Schapiro and id :16371 name: Annabel Miller*/
/*use this two ids to look for people in interview table */
select * 
from interview
where person_id IN (14887, 16371);

/*transcript of id : 14887 I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" 
bag. The membership number on the bag started with "48Z". Only gold members have those bags. 
The man got into a car with a plate that included "H42W". */

/*transcript of second id : saw the murder happen, and I recognized the killer from my gym when
 I was working out last week on January the 9th.*/
select *
from get_fit_now_member
join get_fit_now_check_in
on get_fit_now_member.id = get_fit_now_check_in.membership_id
where id like '48Z%' and membership_status = 'gold' and check_in_date = '20180109';

/*now check who has car with licence plate # 'H42W'*/
select *
 from person
 join drivers_license
 on person.license_id = drivers_license.id
 where plate_number like '%H42W%';
 
 /* and we got the killer It is id : 67318 name: Jeremy Bowers*/
 
 /*================================scond part : try querying the interview transcript of the murderer 
 to find the real villain behind this crime=====================================
/** transcrit of killer*/
select *
 from interview
 where person_id = 67318;
 

/*I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.*/
select count(*),name, event_name
  from drivers_license
  join person
  on person.license_id=drivers_license.id
  join facebook_event_checkin
  on person.id = facebook_event_checkin.person_id
  where car_make = 'Tesla' and gender = 'female' and hair_color = 'red' and event_name = 'SQL Symphony Concert'
  group by event_name

/*======== Real villain behind this crime is:  Miranda Priestly:=============*/
   

