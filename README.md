# README

This application is a University Style Website. It has a general section for pure information, an application form and finally blackboard which is only accessible to registered students. Lecturers are assigned to subjects by the admin. the admin or lecturers must permit the enrollment of students to their classes to access resources such as lessons, tutorials or tests.

* Program Software
  * Ruby version: 3.1.4
  * Rails version: 7.0.6
  * Database: MySQL
  * OS: Linux Mint 21.1

* Configuration

  1. Clone file from Github

  2. Create Admin User in rails console
  * (User.create(email:'admin@admin.com', password:'password', password_confirmation:'password', student_no: 4023000001, role: "ADMIN") )
  
  3. Create A regular student (2023000000) and lecturer (3023000000) to get the student_no's started 
  
  4. Run Rails Server

  5. Access Program from http://localhost:3000

  6. Enjoy
