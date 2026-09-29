# Payroll Management System

A desktop **Payroll Management System** developed in **Java Swing with MySQL** for the fictional **Beta Logistics (Pvt) Ltd** scenario.

The application replaces manual payroll processing with a structured system for managing employee records, calculating salaries and deductions, generating payslip information, and reviewing payroll summaries.

---

## Application Preview

<table>
  <tr>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/dbd3ae80-2d0e-4c83-9d84-b12bbe853b43" />
    </td>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/6c22bc75-0810-49c3-9466-c7657943f0e2" />
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/57424038-91a3-4902-bd8e-21ab7ed20f62" />
    </td>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/0704bad2-c585-485b-ae20-1a2cc8e8837d" />
    </td>
  </tr>
  <tr>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/16531d1d-aed9-4455-bbbc-0c9761fdd23a" />
    </td>
    <td width="50%">
      <img width="100%" alt="Payroll Management System interface" src="https://github.com/user-attachments/assets/ffca20a6-2791-461b-ad6b-b212d6cb0b70" />
    </td>
  </tr>
</table>

---

## Project Overview

Beta Logistics required a computerized payroll solution because its existing manual payroll process was time-consuming and vulnerable to calculation and record-management errors.

The developed application provides a clear workflow:

```text
Login
  ↓
Main Menu
  ↓
Employee Management
  ↓
Salary Calculation
  ↓
Salary Record
  ├── Payslip Management
  └── Payroll Reports
```

Employee information is entered once and stored in the database. The same data is then reused during salary calculation, payslip viewing, and payroll reporting, reducing repeated data entry.

---

## Main Features

### Employee Management

The Employee Management module handles employee profile records.

Users can:

- Add employees
- Search employees
- Update employee details
- Delete employee records
- Clear form fields
- Return to the Main Menu

Employee information includes:

- Employee ID
- Employee Name
- Job Role
- Department
- Basic Salary
- Allowance

Employee data is stored in the MySQL `employee_details` table.

---

### Salary Calculation

The salary-processing interface retrieves an existing employee using the Employee ID instead of requiring their information to be entered again.

The calculation considers:

- Basic Salary
- Allowance
- Overtime Hours
- Overtime Rate
- EPF
- ETF
- Tax
- Loan Deductions

The implemented calculation uses:

```text
Overtime Payment = Overtime Hours × Overtime Rate

EPF = 8% of Basic Salary

ETF = 3% of Basic Salary

Net Salary =
Basic Salary
+ Allowance
+ Overtime Payment
- EPF
- ETF
- Tax
- Loan
```

Once calculated, the complete salary record can be saved to the database.

---

### Payslip Management

The Payslip Management interface retrieves saved payroll information and presents it in a clear payslip-style layout.

It includes information such as:

- Employee details
- Department
- Basic salary
- Allowances
- Overtime
- EPF
- ETF
- Tax
- Loan deductions
- Net salary
- Salary period information

Saved payroll records provide a basis for maintaining salary history without recalculating previous payroll data.

---

### Payroll Reports

The Payroll Reports module processes stored salary records to provide overall payroll information.

The system can display totals such as:

- Total Employees
- Total Basic Salary
- Total Allowances
- Total Net Salary
- Total EPF
- Total ETF
- Total Tax
- Total Loan Deductions

It also supports payroll analysis based on salary period and department.

This provides a foundation for:

- Monthly payroll summaries
- Department-wise salary reports
- Deduction reports

---

## Role-Based Login

The application contains three demonstration user roles.

| Role | Username | Password |
|---|---|---|
| Administrator | `admin` | `111` |
| Payroll Officer | `payroll` | `222` |
| Employee | `employee` | `333` |

The login form checks the username, password, and selected role before opening the Main Menu.

> These are demonstration credentials created for the academic project. A production payroll system should use database-managed accounts, password hashing, and more detailed permission controls.

---

## Database

The application uses **MySQL** for persistent payroll data storage.

The database is:

```text
payroll_system
```

The two main tables are:

```text
employee_details
salary_details
```

### `employee_details`

Stores employee profile information including:

- Employee ID
- Employee Name
- Job Role
- Department
- Basic Salary
- Allowance

### `salary_details`

Stores processed payroll information including:

- Employee ID
- Employee Name
- Department
- Basic Salary
- Allowance
- Overtime Hours
- Overtime Rate
- EPF
- ETF
- Tax
- Loan
- Net Salary

The repository also includes:

```text
payroll_system.sql
```

which can be imported to recreate the project database.

---

## XAMPP & MySQL Connection

The project was developed using a local MySQL environment through **XAMPP**.

The Java application connects to the database using **JDBC** and the MySQL Connector/J driver.

The original local connection used by the project is:

```text
Database: payroll_system
Host: localhost
Username: root
Password: empty
```

The Java connection follows this structure:

```java
jdbc:mysql://localhost/payroll_system
```

The project includes the MySQL Connector/J `.jar` required for Java-to-MySQL communication.

### Database Flow

```text
Java Swing Application
        ↓
      JDBC
        ↓
MySQL Connector/J
        ↓
XAMPP MySQL Server
        ↓
 payroll_system
        ↓
 ┌──────────────────┐
 │ employee_details │
 │ salary_details   │
 └──────────────────┘
```

`PreparedStatement`, `ResultSet`, and `Connection` are used throughout the application for database operations.

---

## CRUD Operations

Employee management demonstrates the main CRUD operations:

| Operation | Implementation |
|---|---|
| Create | Insert new employee |
| Read | Search/retrieve employee |
| Update | Modify employee information |
| Delete | Remove employee record |

Prepared SQL statements are used when interacting with the database.

---

## Object-Oriented Design

The project was also developed to demonstrate Object-Oriented Programming and software design principles.

The desktop application is divided into separate Java classes/forms for areas such as:

```text
LoginPage
MainMenu
EmployeeManagement
SalaryCalculation
PayslipManagement
PayrollReports
```

This separation keeps major responsibilities easier to understand and maintain.

---

## SOLID Principles

The project explored the application of SOLID principles to the payroll system.

### Single Responsibility Principle

Different payroll responsibilities are separated into different interfaces.

For example:

```text
EmployeeManagement → Employee records

SalaryCalculation → Payroll calculations

PayslipManagement → Payslip information

PayrollReports → Payroll summaries
```

### Open/Closed Principle

The structure allows additional functionality, such as new reports or salary-processing features, to be added without rebuilding the entire application.

### Interface Segregation

Payroll functionality is separated into different screens instead of placing every operation into one large interface.

### Maintainability

The project also evaluated where the design could be improved further, including stronger abstraction of database operations and more detailed role-specific permissions.

---

## Clean Coding Practices

Clean coding techniques used throughout the project include:

- Meaningful variable names
- Focused button operations
- Separate interfaces for separate responsibilities
- Consistent database-operation structure
- Reusable stored data
- Comments for important logic
- Input validation
- Exception handling
- User feedback using `JOptionPane`

Names such as:

```text
BasicSalary
Allowance
OvertimeHours
EPF
ETF
NetSalary
```

make payroll calculations easier to understand and maintain.

---

## Design Patterns

The project also explored and applied several software design-pattern concepts.

### Singleton

A Singleton-style approach was considered for managing the shared database connection required by multiple forms.

### Facade

The **Main Menu** acts as a simple facade for accessing the major application modules.

```text
Main Menu
├── Employee Management
├── Salary Calculation
├── Payslip Management
└── Payroll Reports
```

### Strategy

The project examined how salary-processing behaviour could be separated using Strategy-based approaches as the system grows.

These patterns were considered in relation to maintainability, scalability, and reducing unnecessary dependencies.

---

## Testing

Testing was an important part of the project because payroll calculations and stored employee information need to be accurate.

The application was tested across six main areas:

```text
Login
Employee Management
Salary Calculation
Payslip Management
Payroll Reports
Navigation
```

### TestMo

**TestMo** was used to organise and document the testing process.

Each test case contained information such as:

- Test name
- Testing steps
- Expected result
- Priority
- Tags
- Supporting evidence
- Final result

A total of:

```text
28 test cases
28 passed
100% completed
```

were recorded in the final TestMo test run.

The tests covered scenarios including:

- Valid Administrator login
- Valid Payroll Officer login
- Valid Employee login
- Invalid login attempts
- Clearing login fields
- Employee insertion
- Employee searching
- Employee updating
- Employee deletion
- Salary calculations
- Salary saving
- Payslip retrieval
- Payroll summaries
- Navigation between interfaces
- Logout

### Testing Approach

The completed application tests were **performed manually**, while TestMo was used to organise the test cases, steps, screenshots, evidence, and results.

Testing included:

- Functional testing
- Negative testing
- Input validation
- Database testing
- Navigation testing
- Interface/usability testing

The testing process also helped identify issues during development, including salary-saving and payslip-display problems, which were corrected and tested again.

---

## Automated Testing Evaluation

As part of the project, automated testing approaches were also studied for future development.

Suitable technologies considered included:

### JUnit 5

Suitable for automatically testing:

- Salary formulas
- Overtime calculations
- EPF / ETF deductions
- Net salary calculations
- Boundary values
- Regression testing

### Integration Testing

Could automatically verify communication between:

```text
Java Application ↔ MySQL Database
```

### Apache JMeter

Could be used in a larger deployment to test:

- Database response times
- Large payroll datasets
- Repeated database requests
- Performance under increased workload

The current TestMo execution itself was manual rather than an automated Java test suite.

---

## Technologies Used

| Technology | Purpose |
|---|---|
| Java | Main programming language |
| Java Swing | Desktop user interface |
| NetBeans | Development environment |
| MySQL | Payroll database |
| XAMPP | Local MySQL server environment |
| JDBC | Java database connectivity |
| MySQL Connector/J | JDBC driver |
| SQL | Database queries and operations |
| TestMo | Test management and result documentation |

---

## Repository Structure

```text
payroll-management-system/
│
├── PayrollManagementSystem/
│   ├── src/
│   │   └── payroll/
│   │       └── management/
│   │           └── system/
│   │               ├── PayrollManagementSystem.java
│   │               ├── LoginPage.java
│   │               ├── LoginPage.form
│   │               ├── MainMenu.java
│   │               ├── MainMenu.form
│   │               ├── EmployeeManagement.java
│   │               ├── EmployeeManagement.form
│   │               ├── SalaryCalculation.java
│   │               ├── SalaryCalculation.form
│   │               ├── PayslipManagement.java
│   │               ├── PayslipManagement.form
│   │               ├── PayrollReports.java
│   │               └── PayrollReports.form
│   │
│   ├── nbproject/
│   ├── build.xml
│   ├── manifest.mf
│   └── mysql-connector-j-9.7.0.jar
│
├── payroll_system.sql
├── .gitignore
└── README.md
```

The `.form` files are kept together with the Java source because they contain the NetBeans GUI Designer definitions.

---

## Running the Project

### Requirements

You will need:

- Java / JDK
- Apache NetBeans
- XAMPP
- MySQL
- MySQL Connector/J

### 1. Clone the repository

```bash
git clone https://github.com/farshadfazeen/payroll-management-system.git
```

### 2. Start MySQL

Open **XAMPP Control Panel** and start:

```text
MySQL
```

### 3. Create the database

Open:

```text
http://localhost/phpmyadmin
```

Create or import the database using:

```text
payroll_system.sql
```

The database name should be:

```text
payroll_system
```

### 4. Open the NetBeans project

Open:

```text
PayrollManagementSystem
```

in Apache NetBeans.

### 5. Confirm MySQL Connector/J

Ensure the provided MySQL Connector/J `.jar` is available in the project libraries.

### 6. Run the application

Run the project and use one of the demonstration accounts:

```text
Administrator
Username: admin
Password: 111
```

```text
Payroll Officer
Username: payroll
Password: 222
```

```text
Employee
Username: employee
Password: 333
```

---

## Current Scope

This project was developed as an academic desktop payroll application and demonstrates the core workflow of a database-backed payroll system.

The current implementation uses simple hard-coded demonstration credentials.

A production version could be expanded with:

- Database-backed user accounts
- Password hashing
- Detailed permissions for each user role
- Employee-specific access restrictions
- Automated JUnit test suites
- Centralised database/repository classes
- Connection pooling
- PDF payslip generation
- Email payslip distribution
- Additional payroll rules
- Annual payroll reports
- Audit logging

---

## What I Learned

This project strengthened my practical experience with:

- Java desktop application development
- Java Swing
- NetBeans GUI development
- MySQL
- XAMPP
- JDBC
- SQL queries
- Database-driven applications
- CRUD operations
- Payroll calculations
- Data processing
- OOP
- SOLID principles
- Clean coding
- Software design patterns
- Input validation
- Exception handling
- Functional testing
- Database testing
- Test case design
- TestMo
- Software maintainability and scalability

---

## Academic Context

This project was developed for **Unit 20: Applied Programming & Design Principles** as part of a **Higher National Diploma in Computing**.

The project combined practical application development with:

- Object-Oriented Programming
- SOLID development principles
- Clean coding
- Design patterns
- Data processing
- Software testing
- Evaluation of automated testing methods

---

## Developer

**M Farshad**

Software Developer  
Colombo, Sri Lanka

GitHub: [@farshadfazeen](https://github.com/farshadfazeen)

---

## Note

This repository is maintained as part of my software-development portfolio and demonstrates practical experience in developing a complete Java/MySQL desktop application from interface design and database integration through payroll processing and structured software testing.
