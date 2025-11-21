# Cyclistic Bike-Share Analysis
An end-to-end analytics project using SQL, R, ggplot2, and R Markdown

## 🎯 Project Objective
This project analyzes Cyclistic's bike-share usage patterns and provides actionable recommendations to help the company convert more casual riders into annual members.
This project is fully following the data analysis process (Ask → Prepare → Process → Analyze → Share → Act).

## 🛠 Tools Used
* SQL
* R / tidyverse
* ggplot2
* R Markdown
* GitHub

## 📂 Project Structure
Cyclistic-Bike-Share-Analysis        
* Data Process & Clean  
  * data_import.sql  
  * data_quality_check.sql  
  * data_clean.sql  
* Visualization Plots  
  * duration_violin.png  
  * monthly_trends_area.png  
  * weekday_barchart.png  
  * hourly_trends_line.png  
  * rideable_type_stack.png  
* HTML & Rmd Report  
  * da_report_cyclistic.rmd  
  * da_report_cyclistic.html  

## 📊 Key Findings
**1. Member vs Nonmember Usage Patterns**  
* Annual members display the significant morning and evening peaks for commuting during the weekdays (7-9AM & 4-6PM).
* Casual riders' usage increases continuously by daylight, especially in the weekends, and rises to peak at 5-6PM.
* Leisure and travel scenarios drive nonmembers' behavior.

**2. Seasonal Trends**
* Highest number of rides in summer.
* Rapidly decreasing in winter.

**3. Rideable Type Preference**
* Traditional biking is most widely chosen.
* Members and nonmembers both prefer to use electric bikes.

## 📌 Business Recommendations
**1. Promoting flexible short-term or experiential membership**  
Targeting high-frequent casual riders, such as "weekend membership package" and "three-day member free trial".

**2. Increasing supply of electric bikes in travelling hot spots and high-traffic areas**  
Users prefer to electric bikes strongly so that increasing supply can improve user experience and conversion.

**3. Optimizing bike scheduling strategy during the peak periods of commuting**  
Ensuring that users can always rent bikes during the peak periods, increasing member retention rate.

## 🏁 Project Outcome
This project demonstrates the ability to:  
* Combining SQL and R to complete a comprehensive process of analysis
* Using tidyverse and ggplot2 for clear visualization
* Extracting executable business insights from data
* Constructing analysis outcomes that can be reproduced and displayed
