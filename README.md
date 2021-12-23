# Pwelett-Hackard-Analysis

## Overview of Project
	-  Determine the number of retiring employees per title, and identify employees who are eligible to participate in a mentorship program. Then write a summary report based on our analysis. 

## Results
Here is the link to the SQL code used for this analysis ![Code Base](https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Querries/Employee_Database_challenge.sql)

- First step was to determine the employees retiring by filtering for those born between 1952 and 1955. The output of our query is then stored in the 

![Retirement Titles Table CSV File](https://raw.githubusercontent.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/main/Data/retirement_titles.csv)


- Next step was to use the *Distint ()* to remove duplicates from our retirement_titles table. This will give us unique set of employees retiring, which is then stored in the **unique_titles** table. Note, we have excluded those employees that have left the company filtering on to_date to keep only those dates that are equal to '9999-01-01'

![Here is a snapshot of the code](https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Screenshots/Unique%20Titles%20code.png)

- Next, we need to determine the numbers of employees retiring by title. This gives us a clearer picture of how many employees are retiring by job titles. 

![Here is snapshot of the code used](https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Screenshots/Number%20of%20employees%20retiring%20by%20title%20code.png). 
Our output is stored in the **"Retiring_Titles"** table.
 
- Finally, since we have some employees retiring soon, we needed to determine the employess eligible for mentorship. Whom are those born between 1965-01-01 and 1965-12-31.

![snapshot of code](https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Screenshots/Mentorship%20Eligibility%20code.png). 


# Summary

In summary when we compare the numbers of employees retiring by titles and the numbers of employees eligible for mentorship, there is a huge gap. Take a look at the images below: 

<img src="https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Screenshots/Retiring%20Employees%20by%20Title%20Output.png" width="500"/> <img src="https://github.com/Akin-Olusuyi/Pewlett-Hackard-Analysis/blob/main/Screenshots/Mentorship%20Eligibility%20by%20Title%20Output.png" width="500"/>

The first image is the output of employees retiring while the second image is for employees eligible for mentorship. No doubt there are enough retiring employees to mentor the next generation of employees. However, where the challenge is the huge gap between those retiring and the next generation. For example, from our output there is a **25,703** difference between retiring *Senior Engineers* and the next generation. Same holds for all other titles as well.  This poses a significant business risk and could cripple the business if not addressed. 
