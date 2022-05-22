Final Project - CSCI 232 - Suyeon Lee - Martin Taddey - May 22, 2022

# Project Writeup:
* **1. Information about your data**

	* a. Why did you choose the data set you working with?

		We chose this dataset because car accidents are common in NYC. We believe it is important to analyze the data to understand what measures can be taken to reduce car accidents.
 
	* b. What was your dataset about?

		What were some of the important columns in your data and why are they important? 
		Our dataset details the information of motor vehicle collisions in New York City from 2016 to 2021. One of the important columns is “collision id,” as it assigns an unique ID to each accident that occurred. Other important columns are crash date and number of pedestrians, cyclists, motorists injured and killed. These columns show the number of injuries and fatalities from car accidents. At the same time, they show why it is important to prevent car accidents from happening.

	* c. What kind of things did you want to explore about your data? 

		First, we wanted to explore the dataset to understand why, when, and how the motor vehicle collisions are happening. Then, we analyzed the data obtained to identify the dates and places where they occurred the most, and the amount of people who got injured or killed classified by transportation, among other things.

* **2. For each of the questions you asked, please answer the following: Please also write the question text. If you had multiple authors, kindly indicate which author answered which questions.**
	* a. Why did you ask this question? Was there any information you wanted to learn? 
	* b. Did you succeed in answering the question? If you did succeed, what did you learn? If you weren’t successful, can you propose a method which might help solve the question (i.e. different data, or using a different tool than SQL etc.)?
	* c. Which SQL tool(s) did you use to solve the question (i.e. aggregates, joins, cases etc.)? 

In order to create the questions, we met and had a brainstorm session. There is no single author. In order to find the answer to the questions, we divided the data set in 2. Suyeon worked on the dataset from 2016 to 2018 and Martin worked on the dataset from 2019 to 2021. This way we both had to work on creating queries for every question, while both working in tandem. Finally, we had another meeting where we gathered all the information and proceeded to answer the following questions together.
 
**1. Has the number of car accidents increased or decreased from 2016 to 2021?**
	* a) We wanted to learn if the number of motor vehicle collisions increased or decreased from 2016 to 2021.
	* b) Yes, we succeeded. We learned that the numbers of accidents have been decreasing in recent years, with a pronounced fall in 2020 and 2021.
	* c) We used the table location_time. Aggregate function COUNT().

**2. What is the number one combination of factors that caused the motor vehicle collisions during the years analyzed?**
	* a) We wanted to learn which combination of factors caused the most motor vehicle collisions. This information could be useful to the government, as they could find a solution to these factors.
	* b) Yes, we succeeded. We learned that of the specified reasons, the number one reason why motor vehicle collisions occurred in the years analyzed is the motorist driver inattention or distraction.
	* c) Inner join between the tables contributing_factor and location_time. Aggregate function COUNT().

**3. Who suffered the most number of casualties? Pedestrians, cyclists, or motorists?**
	* a) We wanted to learn about who suffered the most number of casualties.
	* b) Yes, we succeeded. As expected, we learned that pedestrians suffered the most number of deaths from 2016 and 2019, but in 2020 and 2021 the motorists experienced slightly more deaths than pedestrians. From this query we learned that cyclists experienced the least amount of accidents.
	* c) Inner join between the tables number_victims and location_time. Aggregate function SUM() and functions TO_CHAR and DATE_TRUNC.

**4. Which group had the most number of injured people? Pedestrians, cyclists, or motorists?**
	* a) We wanted to know which group had the highest number of injured people. 
	* b) Yes, we succeeded. Surprisingly, we learned that the motorist group suffered the most number of injured people during the years analyzed.
	* c) We used the inner join number_victims between location_time. Aggregate function SUM() and functions TO_CHAR and DATE_TRUNC. 

**5. During what months of the year do most accident occur?**
	* a) We wanted to find out if there was a specific time of the year where accidents were more common.
	* b) Yes, we succeeded. We learned that May and June are usually the months where the most motor vehicle collisions happen every year.
	* c) We used the table location_time. Aggregate function COUNT(), and functions TO_CHAR and DATE_TRUNC.
    
**6. What is the number one combination of vehicle types involved in motor vehicle collisions?**
	* a) We wanted to learn what was the combination of motor vehicles most commonly involved in collisions.
	* b) We learned that the most number of motor vehicle collisions happened when a single sedan was involved, followed by two Sedan cars involved, and then when station wagon/sport utility vehicles were involved.
	* c) Inner join between the tables vehicle_type and location_time. Aggregate function COUNT().

**7. Which borough has the highest number of motor vehicles collisions?**
	* a) We wanted to see if the number of car accidents are similar or drastically different between different boroughs. 
	* b) Yes, we succeeded. We learned that Brooklyn has the highest number of accidents among the five boroughs. However, because there were many rows that missed the borough information, it is unclear where those accidents occurred. 
	* c) We used the table location_time. Aggregate function COUNT(). Functions TO_CHAR and DATE_TRUNC.


* **3. What if anything, did the project teach you? Do you have any suggestions to improve this project? What issues did you face when trying to answer your questions/copying the data (or any other issues)?**

For this project we put into practice our knowledge of extracting a dataset from the internet and importing it on psql. To extract the information needed from the database, we used different SQL tools. Our project can be improved by choosing a bigger timeframe and using a system that can handle larger data. We are happy we were able to work on a dataset of our choice.

Issues we faced:
•	One issue we faced was that the database was extremely large. Excel wouldn’t load all the information, so we had to divide it in two parts to work with it. The time frame chosen was (01/01/2016 - 12/31/2021). 
•	One of our NON-NULL constraints failed one time because there was one line in a column that was empty when it wasn’t supposed to be. Clearly it was an omission on the part of the person who wrote down the report.
•	There was information missing on the dataset. For example, sometimes boroughs were not identified. This is clearly a mistake of the person writing down the reports.

* **4. If you had unlimited time and resources (i.e. you can collect your own dataset and use tools other than SQL) what project would you pursue?**

Suyeon: I would work with people who collects data about the car accidents because I would like to expand on this database and project. I would like to know the severity of the person’s injury and the exact reason for it. For example, the injury or death could have been from the fire that was created from the car accident. It would also be interesting to collect the information of the driver, for example, different age groups, gender, driver experience, and mental health problems. This information could be used to see if there are any relationships between the driver and the accident. 

Martin: I think having unlimited time and resources is not something realistic. I rather focus on things I could actually do. There is a large population of homeless people in New York. I would work with social work researchers to assess the homeless population and to determine the services that they need. Having all this information in a database could be important on understanding and finding a solution to their problems. A comprehensive assessment would assist policy makers in developing the services and solutions needed.

* **5. Did you enjoy this class? What did you like? What did you dislike? Do you have any advice for improvements or other suggestions? If you have multiple authors, please separate by author)**

Martin: I’m happy I took this class. I enjoyed when we had to work with different tables and make complex queries. My advice is to review the homework more often, ideally, during the following class it’s due. This way we can learn from our previous mistakes.

Suyeon: Yes, I enjoyed the class. I liked that we learned about the different functions of postgres and how to design a database on Figma. I wish we could have more practice. 

[Link to Dataset](https://data.cityofnewyork.us/Public-Safety/Motor-Vehicle-Collisions-Crashes/h9gi-nx95/data)