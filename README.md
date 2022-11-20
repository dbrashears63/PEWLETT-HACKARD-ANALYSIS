# PEWLETT HACKARD ANALYSIS

## Overview 
### Purpose
The purpose of this analysis is to prepare Pewlett-Hackard, with thousands of employees, for the “silver-tsunami”. Many employees are nearing retirement age in the next few years and HR has been tasked with preparing an analysis of how many employees are eligible for retirement in the next few years, how many open positions, will need to be filled and which employees are eligible for the mentorship program.  To ensure a smooth transition this analysis will focus on the following:
1.	Identify which employees are nearing retirement by title
2.	List only the most recent title for the employees reaching retirement age
3.	Ascertain how many employees by title are nearing retirement age
4.	Establish which employees are eligible for the mentorship program

## Resources
Software: pgAdmin 6.15, PostgresSQL 15, Visual Studio 1.73.1, Quick Database Diagrams via www.quickdatabasediagrams.com

Data Source: departments.csv, employees.csv, dept_manager.csv, dept_emp.csv, titles.csv; and salaries.csv

Output Data: retirement_titles2.csv, uniqueretirement_titles2, retiring_titles.csv, mentorship_program.csv 

## Results 

Four different tables were created to answer the required questions to complete this analysis. 

### Table 1 Retirement Table by Title
This table identified all the employees who were born between Jan 1, 1952, and Dec 31, 1955. This showed there were 133,776 employees eligible for retirement. However, after reviewing the table it contained duplicate names because the table included all the titles an employee had during their tenure with the company. 

Table 1 Retirement Table by Title

![](/Analysis20%Projects20%Folder/Images/retirement_titles.png)


### Table 2 Retirement Table by Unique Title
This table removed the duplicate employee names with multiple titles and provided a list of only the most recent title for each of the eligible employees. This produced the true number of employees eligible for retirement which is 72,458. 

Table 2 Retirement Table by Unique Title

https://github.com/dbrashears63/PEWLETT-HACKARD-ANALYSIS/blob/main/Analysis%20Projects%20Folder/Images/uniqueretiement_titles2.png

### Table 3 Retiring Titles
This table shows the total number of employees that are nearing retirement age by title. This shows that a little over 70% of the employees nearing retirement age are Senior Staff and Senior Engineers. The reaming 30% of the employees make up all the remaining titles such as Engineer, Staff, Technical Leader, Assistant Engineer, and Manager. Since so many of the employees nearing retirement age are either Senior Staff or a Senior Engineer then the next step is to make sure that there are employees who would be able to take over these roles. 

Table 3 Retiring Titles

https://github.com/dbrashears63/PEWLETT-HACKARD-ANALYSIS/blob/main/Analysis%20Projects%20Folder/Images/retiring_titles.png

### Table 4 Mentorship Program
This table will establish which employees are eligible for the mentorship program put in place by the company to ensure there is a smooth transition as employees start to retire. Employees born between Jan 1, 1965, and Dec 31, 1965, will be eligible for the mentorship program. With these parameters there are 1,549 employees eligible for the mentorship program. 

Table 4 Mentorship Program

https://github.com/dbrashears63/PEWLETT-HACKARD-ANALYSIS/blob/main/Analysis%20Projects%20Folder/Images/metorship_program.png

## Summary
Losing critical knowledge due to retiring has the potential to lead to critical loss in relationships, reputation, regeneration and reduced continuity in the company. 

To begin to prepare for the impending “Silver Tsunami” and the loss of critical knowledge the CEO has a taken a proactive stance by asking HR to determine how many employees will be reaching retirement age in the next few years and what departments will be affected.

There are currently 331, 603 total employees of that number 72,458 that are nearing retirement age in the next few years. This accounts for almost 20% of the workforce. Of the 20% of the workforce that is retiring 70% of them are either Senior Staff or Senior Engineers. 

To help with the large workforce loss the company has implemented a mentoring program to help with the transfer of leadership knowledge.  Currently only 1,549 employees have been identified as eligible for this program. This is significantly fewer numbers than needed to maintain historic company knowledge and continuity.

Several things may be done to ensure the transfer of knowledge and leadership. One of the things the company will need to do is expand the eligibility of existing employees for the mentorship program. In addition, a large-scale increase in the hiring processes. The hiring process will need to be focused on the specific categories of titles.

