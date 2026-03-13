create database Vehicles;

use Vehicles;

show tables;


select * from vehicle_info;

select * from vehicle_sales;


# Q1. Show all vehicles that use Diesel fuel. 


select * from vehicle_info
where fuel = "Diesel";



# Q2. Display vehicle name, year, and brand for all vehicles. 

select name as `vehicle name`,year,brand from vehicle_info;


# Q3. Find all sales where selling price is below 5,00,000. 

select * from vehicle_sales
where selling_price < 500000;


# Q4. Find fuel types where average selling price is greater than 6,00,000. 

select vi.fuel, avg(vs.selling_price) as avg_price
from vehicle_info vi
join vehicle_sales vs 
on vi.vehicle_uid = vs.vehicle_uid
group by vi.fuel
having avg(vs.selling_price) > 600000;


#Q5. Find brands that have more than 50 vehicles listed. 

select brand, count(*) as total_vehicles
from vehicle_info
group by brand
having count(*) > 50;


#Q6. Show transmission types where the average selling price is greater than 7,00,000 AND the total number of vehicles is at least 30. 


select vi.transmission,avg(vs.selling_price) AS avg_price,count(*) AS total_vehicles
from vehicle_info vi
join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid
group by vi.transmission
having avg(vs.selling_price) > 700000
and count(*) >= 30;



# Q7. Find price categories where the average km driven is above 75,000, but only include categories that have more than 20 vehicles AND only count Diesel vehicles. 

select vs.price_category,avg(vs.km_driven) AS avg_km,count(*) AS total
from vehicle_sales vs
join vehicle_info vi
on vs.vehicle_uid = vi.vehicle_uid
where vi.fuel = 'Diesel'
group by vs.price_category
having avg(vs.km_driven) > 75000
and count(*) > 20;



# Q8. Find vehicles whose selling price is higher than the overall average selling price. 


select *
from vehicle_sales
where selling_price >(select avg(selling_price)from vehicle_sales);



# Q9. Find brands whose average selling price is greater than the average selling price of Toyota vehicles. 

select vi.brand, avg(vs.selling_price) as avg_price
from vehicle_info vi
join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid
group by vi.brand
having avg(vs.selling_price) >
(
select avg(vs.selling_price)
from vehicle_info vi
join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid
where vi.brand = 'Toyota'
);




# Q10. Find fuel types where total selling price is higher than total selling price of Petrol vehicles. 

select vi.fuel, sum(vs.selling_price) as total_price
from vehicle_info vi
join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid
group by vi.fuel
having sum(vs.selling_price) >
(
select sum(vs.selling_price)
from vehicle_info vi
join vehicle_sales vs
on vi.vehicle_uid = vs.vehicle_uid
where vi.fuel = 'Petrol'
);












