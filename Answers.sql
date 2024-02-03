USE CAR_EVALUATION;


#1 What is the distribution of cars based on buying price?
SELECT buying as Buying_Price, count(*) as Number_of_Cars
from car_evaluation
group by buying;

#2 How are the cars distributed in terms of maintenance cost?
SELECT maint as Maintenance_Cost, count(*) as Number_of_Cars
from car_evaluation
group by maint;


#3 How is the safety level distributed among the cars in the dataset?
SELECT Safety as Safety_Level, count(*) as Number_of_Cars
from car_evaluation
group by Safety;


#4 What is the distribution of the capacity of cars in terms of persons these can carry?
SELECT Persons as Passenger_Capacity, count(*) as Number_of_Cars
from car_evaluation
group by Persons;


#5 How does the size of the luggage boot vary across different cars?
SELECT Lug_boot as Luggage_Boot_Size, count(*) as Number_of_Cars
from car_evaluation
group by Lug_boot;

# ---------------------------------------------------------------------------
#6 Are there specific buying price and maintenance cost ranges associated with more favorable evaluation levels?
select buying as Buying_Price, maint as Maintenance_Cost,
avg(case when class = 'good' or class = 'vgood' then 1 else 0 end) as Favorable_Evaluation_Percentage
from car_evaluation
group by buying, maint
order by Favorable_Evaluation_Percentage desc;

# What is the distribution of cars with high safety levels and a passenger capacity of 4, categorized by buying price and maintenance cost?
SELECT Buying AS Buying_Price, Maint AS Maintenance_Cost , count(*) as Number_of_Cars
FROM car_evaluation
WHERE safety = 'high' AND persons = 4
GROUP BY Buying, Maint;

# Which combination of buying price and maintenance cost seem to be most important in determining that a car is 
# evaluated as "unacceptable"?

select buying as Buying_Price, maint as Maintenance_Cost,
avg(CASE WHEN class = 'unacc' THEN 1 ELSE 0 END) as Unacceptable_Rate
from car_evaluation
group by buying,maint;

# How many cars in the dataset meet the following criteria: buying price is medium or low, maintenance cost is medium or low, safety level is high, passenger capacity is 4, number of doors is 4, luggage boot size is medium or big, and evaluation level is very good or good?
select count(*) as Number_of_Cars
from car_evaluation
where
buying in ('med','low')
and maint in ('med','low')
and safety = 'high'
and persons = 4
and Doors = 4
and lug_boot in ('med', 'big')
and class in ('vgood', 'good')

