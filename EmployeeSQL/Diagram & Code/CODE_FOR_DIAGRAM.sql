"departments"
-
dept_no PK varchar(30) FK >- dept_manager.emp_no
dept_name string

"dept_emp"
-
emp_no PK int
dept_no varchar(30)
from_date varchar(30)
to_date varchar(30)

"titles"
-
title PK string FK >- employees.emp_no
emp_no int
from_date varchar(30)
to_date varchar(30)

"dept_manager"
-
dept_no varchar(30) FK >- dept_emp.emp_no
emp_no int PK
from_date varchar(30)
to_date varchar(30)

"employees"
-
emp_no PK int FK >- dept_emp.dept_no
birth_date varchar(30)
first_name string
last_name string
gender string
hire_date varchar(30)

"salaries"
-
salary serial FK >- employees.emp_no
emp_no PK int
from_date varchar(30)
to_date varchar(30)








