# BMSTU 3 sem Labs

> Config
> * Ruby version 3.0.2
> * Rails version 7.0.4

<br><br/>
## Labs 1-4 CSS & HTML & JavaScript with DOM

* Lab 1
    > Simple html site

* Lab 2
    > Lab1 with CSS

* Lab 3
    > Javascript code to display page elements with which
this code is running. Indents for display form as
symbol &nbsp. Using DOM

* Lab 4
    > Using JavaScript DOM & HTML & CSS 
    
    > Form for entering goods and their cost, adding to the order with the ability to calculate the total cost. Ability to select from the database of products to add to the cart, with a background change when hovering over the product. 

<br><br/>
## Labs 5-7 Ruby
#### All labs with tests using RSpec or Minitest
* Lab 5 Simple Ruby programs
    * Part 1
        > Calculate: y = cos(x + 3.1 z)/tg(x/r)
    * Part 2
        > Given an array of N numbers. Determine if elements of an array form
before the first negative element in an ascending sequence.
    * Part 3
        > Given a sequence of lines. Each line consists of words, separated
lazy spaces. Write a program that accepts string input and
their correction. If the
in contains characters other than letters of the Latin alphabet and numbers, then
delete it. If the word consists of letters of the Latin alphabet and numbers and
starts with a digit, replace that digit with "_".

* Lab 6 Arrays methods

    * Part 1
        > Calculate: y = cos(x + 3.1 z)/tg(x/r)
    * Part 2
        > Part 1 using Enumerable or Enumerator
    * Part 3
        > Create a minmax method for a function that determines its value with a given precision. Implement passing a function through a lambda expression, proc and block of code

* Lab 7 Files & Objects
    * Part 1
        > Given a string file. It is necessary to return the file of lines in the reverse order, while in each line the word order must be reversed. Tests should check the work with files
    * Part 2
        > Create a circle and point object. The point has the coordinates of the center, the circle is given by the point and the radius. In tests, check the class hierarchy

<br><br/>
## Labs 8-12 Ruby on Rails
#### All laboratory works are aimed at studying the framework. The initial task for them:
> Write a program to determine how many of the numbers are in a range
from 0 to n (n is entered from the keyboard), being themselves palindromes, with
squaring, form palindromes. For example: 222 → 484 

* Lab 8 Simple Rails app
    > It is necessary to develop a Rails application, form
controller, fill it with the appropriate logic and form
representation. Check the results with a functional test of the controller.

* Lab 9 Ajax requests
    > Using Javascript, modify the LR 8 code in such a way that for
display results of the calculation, the browser did not perform a full reload
pages. Generate tests to check the operation of the program using Katalon
Recorder / Selenium Webdriver.

* Lab 10 XML & XSLT transformation on server/client side
    ##### This task requires 2 apps
    * First app - xml_api
        > Modify the LR code 8 so that, upon request with the indicated
parameters, the result was given in XML format (using the standard
serialization of ActiveSupport). Create xslt file transform xml to html. Add xslt binding to xml and write a test to check if the request is issued in xml/rss format

    * Second app - Rails_with_xml_proxy
        > Develop a second application that is an intermediary between the client and
the first application whose task is to convert XML to HTML
or passed unchanged to the browser for display by the browser.
The application must run with a TCP port number other than
port number of the first application

        > The final parameter input form must contain buttons or a selector,
    allowing you to check two conversion options:
        >* Server xml+xslt->html
        >* Client xml+xslt->html

* Lab 11 ORM, models, database
    > Modify the LR 8 code so that requests that were previously
completed, saved in the database and did not require repetition at the next request
computing. Write a test that checks that if there is a result in the database, the application does not recalculate, but retrieves the result from the database.

* Lab 12 User sessions, authorization, integration tests
    > Modify the LR 8 application code so that the calculation is
not possible without user registration and authentication using
login/password.
