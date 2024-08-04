==========================================
IS 210: Software Application Programming I
==========================================
------------
Homework #06
------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Available: 2014-09-29T09:00:00-0400
:Due-Date: 2014-10-06T09:00:00-0400


Instructions
============

The following tasks will either have you interacting with existing files in
the starter repo or creating new ones on the fly. Don't forget to add your
interpreter directive, utf-8 encoding, and a short docstring with any new files
that you create!

.. important::

    In these exercises, you may, on occasion, come across a task that requires
    you to research or use a function or method not directly covered by the
    course text. Since Python is such a large language it would be impossible
    for the author to have included descriptions of each and every available
    function which would largely duplicate the official Python documentation.

    A *vital* skill to successful programming is being comfortable searching
    for and using official language documentation sources like the
    `Python String Documentation`_ page. Throughout our coursework we will be
    practicing both the use of the language in practice and the search skills
    necessary to become functional programmers.

Task 01: Even and Odds Function
-------------------------------

Iterating through large amounts of data is a very common task for computer
programs. In this assignment, you are going to create a function that accepts
a list object variable as a parameter and return all of the even or odd values.


Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_01.py``

#.  Import the ``data.py`` file. You will use the TASK_01 list object as your data source.

#.  Within, ``task_01.py``, define a function named ``evens_and_odds()``

    #.  ``evens_and_odds()`` will accept ``numbers`` as a list object and ``show_even`` as a boolean value of ``True`` or ``False``

    #.  Takes 2 arguments:

        #.  The first argument should be named ``numbers``

        #.  The second argument should be named ``show_even`` and have a default
            value of ``True``
            
    #. Uses a condition to determine if a number value is even or odd
    
    #. Uses a condition to return either even or odd values

    #.  Returns a new list object 


.. note::

    For the purpose of this document and others, when I refer to function
    names, I will always include the open and close parens "()" to indicate
    that I am speaking about a function.

.. note::

    As we move into functions, what you choose to call your variables will
    have considerably diminished importance. At this point, it's far more
    important to name your arguments correctly and place them in the directed
    order.

.. tip::

    Review how to add sub objects to a list object from this week's reading assignment.

.. note::

    This assignment requires you perform an import of the data.py file.


Task 02: Average of a List
--------------------------

This task builds on the work done for task_01. Now you will need to import your task_01
and use the ``evens_and_odds()`` function to further analyze the data. Create an additional function
named ``get_average()`` that returns the average value of a list of positive integers.


Specifications
^^^^^^^^^^^^^^

#.  Open ``task_02.py``

#.  Import your ``task_01.py`` file

#.  Import the ``data.py`` file

#.  Create a function named ``get_average()`` that accepts a list object of integers as its only parameter.

    #. Use a loop to total the sum of the individual list values

    #. return the average as a ``float`` object

#.  Assign the returned value ``get_average(data.TASK_01)`` to a variable named ``TOTAL_AVG``

#.  Assign ``EVEN_AVG`` the average of only the even numbers using your ``task_01.events_and_odds()`` function

#. Assign ``ODD_AVG`` the average of only the odd numbers using your ``task_01.events_and_odds()`` function

#.  Produce a report of the data. Display formatted representations with commas separating thousands and only two decimals of accuracy.


Example Report Output
^^^^^^^^^^^^^^^^^^^^^

.. code-block::

    Task 02 Report
    -------------------------------
    Total AVG: 2,833,713.08
    Even AVG:  966,486.12
    Odd AVG:   4,715,937.84



Task 03: Sorting Data
---------------------

It is often helpful to sort lists of numbers for analysis or to prepare the data for
further manipulation. We see this any many places within software today but how do
you program it? For this assignment you are going to create a simple bubble sorting function.
We'll cover more complicated sorting algorithms later on in this course.

For now consider a list of integers ``[5, 7, 2, 1, 0, 9, 3]`` that you might want to sort.
Now imagine these numbers listed vertically and you want the lowest numbers to float to the
top. This is called a "Bubble Sort".

Create a function that accepts a list of integers and then evaluates each element to see if
it is less than the previous number it has already evaluated. If it is, the function will
need to swap the values and continue looping through the rest of the list. You will need to
take advantage of the mutability of list objects using the index of the list items.

The bubble sorting pattern looks like this:

.. code-block::

    [5, 7, 2, 1, 0, 9, 3]

    [5, 7, 1, 2, 0, 3, 9]

    [5, 1, 7, 0, 2, 3, 9]

    [1, 5, 0, 7, 2, 3, 9]

    [1, 0, 5, 2, 7, 3, 9]

    [0, 1, 2, 5, 3, 7, 9]

    [0, 1, 2, 3, 5, 7, 9]


.. tip::

    Work with a short list of integers like shown above while you are working out the proper
    looping and conditional logic. Once you feel your function is working properly, use the
    ``data.TASK_01`` large list of integers.

.. note::

    You'll need to use the ``len()`` function to dynamically identify how many values
    are in any given list.

.. note::

    Make use of the ``range()`` function. Review the details of the ``range()`` funtion from
    the reading material. Using it will provide you with a handy means of manipulating the
    list object indexes.

.. tip::

    You can use ``+`` and ``-`` operators to access the previous and next list values.

Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_03.py``

#.  Import the ``data.py`` file.

#.  Create a function named ``bubble_sort()`` which accepts a list object as a parameter.

#.  The ``bubble_sort()`` function must return a new list of integers sorted least to greatest.


Example
^^^^^^^

.. code-block::

    >>> import task_03
    >>> foo = [5, 7, 2, 1, 0, 9, 3]
    >>> task_03.bubble_sort(foo)
    [0, 1, 2, 3, 5, 7, 9]
    >>>


Task 04: Cracking Passwords
---------------------------

Using a strong password is a necessity in our modern world. One of the biggest reasons
is that computers are now so computationally powerful they can be programmed to test
millions of password combinations a second. For this assignment you are going don your security
analyst hat and write a program that attempts to test the security of fictional user passwords
from an equally fictional UNIX server.

The assignment is to create three functions. One will read list object containing user account
data. A second function will use a list of common words used in passwords to see if it can find
a match using a custom ``crypt()`` function. The third function produces a report of users
you found to be using insecure passwords.


Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_04.py``

#.  Import the ``data.py`` file.

#.  Instantiate a variable named ``SALT`` and assign it a value of ``'monosodium-glutamate'``.

#.  Create a function named ``test_passwords()`` that accepts a list object parameter.

    #.  Separate the user account data list items by the ``:`` into a temporary list of field values

    #.  Call the ``crack_it()`` function on the second field item and assign the return value to a variable

    #.  Use the stored return value to determine if the password was cracked

    #.  Append any cracked passwords to a new list using a tuple object that includes the matched password
        and the user's name.

    #.  Return the new list to the calling statement.

#.  Create a function named ``crack_it()`` that accepts a string object.

    #.  The input of this function will be the string of hashed password characters collected
        by the calling ``test_passwords()`` function

    #.  Loop through the ``data.WORDS`` list

    #.  Call the ``data.crypt()`` function with each word and the ``SALT`` variable. Compare
        the result of the string returned by ``data.crypt()`` with that passed as the input parameter.
        Return the word if if a match is found.

#.  Create a function named ``report()`` that accepts a list of tuples

    #.  Display a report of each user your with a weak password as shown in the example output.

#.  Call the ``test_passwords()`` function with ``data.PASSWD`` as the input parameter. Assign the
    returned list of tuples to a variable or nest the ``test_passwords()`` within you ``report()``
    function to display your results.

Output Example
^^^^^^^^^^^^^^

.. note::

    This is only example output and not the real passwords in the assignment.

.. code-block::

    $ python task_04.py

        Cracked passwords
        -------------------------------
        Jill Lawrence	password
        Timmothy Hanks	monkey
        Ronda Rihanna	shadow
        Donny Johnson	princess

data.crypt() Function Usage Example
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Note how the second "salt" parameter changes the output. This is called a salted hash.

.. code-block::

    >>> import data
    >>> data.crypt('myweakpassword', 'RockSalt')
    'V4pbI2d55lfZvSnstgv8L+uaFyg='
    >>> data.crypt('myweakpassword', 'monosodium-glutamate')
    'XcuEJjmciLaD9enxYJ4IGatgnD4='
    >>>




Submission
==========

Code should be submitted to `GitHub`_ by means of opening a pull request.

As-of Lesson 02, each student will have a branch named after his or her
`GitHub`_ username. Pull requests should be made against the branch that
matches your `GitHub`_ username. Pull requests made against other branches will
be closed.  This work flow mimics the steps you took to open a pull request
against the ``pull`` branch in Lesson 01.

For a refresher on how to open a pull request, please see homework instructions
in Lesson 01. It is recommended that you run PyLint locally after each file
is edited in order to reduce the number of errors found in testing.

In order to receive full credit you must complete the assignment as-instructed
and without any violations (reported in the build status). There will be
automated tests for this assignment to provide early feedback on program code.

When you have completed this assignment, please post the link to your
pull request in the body of the assignment on Blackboard in order to receive
credit.

.. _GitHub: https://github.com/
.. _Python String Documentation: https://docs.python.org/2/library/stdtypes.html
