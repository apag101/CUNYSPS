==========================================
IS 210: Software Application Programming I
==========================================
------------
Homework #05
------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Available: 2014-09-22T09:00:00-0400
:Due-Date: 2014-09-29T09:00:00-0400

Overview
========

The following tasks are all Python-related coding tasks related to variable
assignment, numbers, and strings. Use the link provided in the Lesson 03 Course
Materials to access the repository.

If you need a brief refresher on how to get the starter code and save and
submit your work, see the `Workflow Refresher`_ below or skip straight to the
`Instructions`_.

Workflow Refresher
==================

As a brief reminder, to get access to the starter code, you must first *Fork*
the starter repo on `GitHub` and then clone the newly created repository to
your working machine. The link to the starter repository is found in the
Blackboard Lesson 02 Course Materials.

Once you've done this, start Git Bash on your local development workstation.

Virtual Lab (Only)
------------------

If you are using the Virtual Lab, you will need to remind the machine who you
are. Desktop users can skip this step. Virtual Lab users, run the following
commands:

.. code-block:: console

    $ git config --global user.name "FIRST LAST"
    $ git config --global user.email "CUNY_SPS_EMAIL"

Where ``FIRST`` and ``LAST`` are your first and last name, respectively and
``CUNY_SPS_EMAIL`` is your spsmail.cuny.edu e-mail address.

Getting the Starter Code
------------------------

.. code-block:: console

    $ git clone HTTPS_CLONE_URL


Where ``HTTPS_CLONE_URL`` is the HTTPS Clone Url found on your *personal* fork
of the starter repo. Please be cautious and check that you're cloning your
repo and not the parent repository. To check, make sure that your username
is in the Clone URL:

    https://github.com/YOUR-USERNAME/is210_lesson_XX.git


Enter the Newly Created Local Repository
----------------------------------------

Use the ``cd`` command to enter the starter repository directory.

.. code-block:: console

    $ cd is210_lesson_XX

Where XX is the lesson number. This will change with each lesson but is found
in the Clone URL as the part after the last slash (``/``) and before ``.git``.

Use ``ls`` to see the available files:

Example:

.. code-block:: console

    $ ls
    LICENSE new_python.py README.rst

Begin Work
----------

You may now begin work. Use whatever editor your prefer to work on and run
your code. You may also use Git Bash to run python files, eg:

.. code-block:: console

    $ python new_python.py
    Some value


Remember, you can call your program with ``python -i`` to start an interpreter
after the program runs. This will let you investigate the value of variables
which will now be accessible from the python interactive command line. This is
a helpful way to debug your work in progress.

Example ``new_python.py``:

.. code-block:: python

    my_var = 'Some value'
    my_new_var = my_var * 2
    print my_new_var

.. code-block:: console

    $ python -i myprogram.py
    Some valueSome value

.. code-block:: pycon

    >>> print my_var
    Some Value
    >>> print my_new_var
    Some valueSome value

You may also launch the IDLE Python editor, the preferred editor of this
course, from Git Bash.

.. code-block:: console

    $ idle new_python.py

This works the same whether you're accessing an existing Python file or want
to create a new Python file called ``new_python.py``.

Alternately, you may use any other editor such as ``notepad``, ``Notepad++``,
or ``PyCharm`` by using these tools to create and save files in the repository
folder.

Saving your Work
----------------

While you are welcome to use any pattern you wish, I recommend saving your
work after each task by issuing a commit and a push to the upstream repository.
Virtual Lab users, especially, take note of this recommendation as the
Virtual Lab long-term storage options are not-yet available and each Virtual
Lab machine is wiped clean each time you log-off.

To save your work, first check what files have changed in your repository.

.. code-block:: console

    $ git status
    On branch master
    Your branch is ahead of 'origin/master' by 3 commits.
      (use "git push" to publish your local commits)

    Changes not staged for commit:
      (use "git add <file>..." to update what will be committed)
      (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   old_python.py

    Untracked files:
      (use "git add <file>..." to include in what will be committed)

            new_python.py

Now add the files you've recently worked on to staging. The ``add`` command
adds changes, not files, so it must be used to add new and existing files
alike.

.. code-block:: console

    $ git add new_python.py old_python.py

Run ``git status`` again to check that the files have been added.

.. code-block:: console

    $ git status
    On branch master
    Your branch is ahead of 'origin/master' by 3 commits.
      (use "git push" to publish your local commits)

    Changes to be committed:
      (use "git reset HEAD <file>..." to unstage)

            modified:   new_python.py
            modified:   old_python.py

Everything looks good, so commit your changes.

.. code-block:: console

    $ git commit -m "Here's my commit message about what I did."

This saves your work locally. Now lets push it to our remote repository.

.. code-block:: console

    $ git push origin

You may repeat the steps in this section as many times as you need or want as
you iterate your work or respond to test results.

Import Refresher
================

While you've used imports before, we'll be using them a great deal more during
this and future assignments. Here's a little refresher:

To import a module, and thus access its members, you only need to add the word
``import`` followed by the name of the module. Eg,

.. code:: pycon

    >>> import mymodule

This makes all of the properties of ``mymodule`` accessible to the current
environment through use of a dot (``.``). Eg,

.. code:: pycon

    >>> import mymodule
    >>> print mymodule.USERS  # you can print its USERS constant
    'Fester, Esther, Lester, Hesther'
    >>> len(mymodule.USERS)  # or get the length
    31
    >>> NEWUSERS = mymodule.USERS + 'Nester'  # just treat it like a variable

When modules are imported in this manner, their properties are accessed, not
copied in the current environment. In this way, changes to the module
properties are reflected in other all other code accessing the module.

.. code:: pycon

    >>> import mymodule
    >>> print mymodule.USERS
    'Fester, Esther, Lester, Hesther'
    >>> mymodules.USERS = 'Nester'
    >>> print mynewmodule.USERS
    'Nester'

Another form of importing involves *copying* properties from another module
into the current one:

.. code:: pycon

    >>> from mymodule import USERS

When this is done, the copied property (to the right of the ``import``
keyword), is locally accessible:

.. code:: pycon

    >>> from mymodule import USERS
    >>> print USERS
    'Fester, Esther, Lester, Hesther'

This means that changes to the local copy are not replicated in the parent.

.. warning::

    Don't do what you're about to see. This is purely for explanatory purposes.

.. code:: pycon

    >>> import mymodule
    >>> from mymodule import USERS
    >>> USERS = 'Nester'
    >>> mymodule.USERS == USERS
    False

What we see here is that the copy is given a new value while the module
attribute is left unchanged.

There are reasons to use both approaches to importing, however, for the
purposes of your current homework, you'll only need to use the short from
``import modulename``. Never attempt to use both as its both redundant and will
create a lint violation.

Instructions
============

The following tasks will either have you interacting with existing files in
the starter repo or creating new ones on the fly. Don't forget to add your
interpreter directive, utf-8 encoding, and a short docstring with any new files
that you create!

.. important::

    In these exercises, you may, on occasion, come across a task that requres
    you to research or use a function or method not directly covered by the
    course text. Since Python is such a large language it would be impossible
    for the author to have included descriptions of each and every available
    function which would largely duplicate the offical Python documentation.

    A *vital* skill to successful programming is being comfortable searching
    for and using official language documentation sources like the
    `Python String Documentation`_ page. Throughout our coursework we will be
    practicing both the use of the language in practice and the search skills
    necessary to become functional programmers.

Task 01: Defining a Function
----------------------------

Just to get our feet wet, we're going to define a very basic function that has
probably been invented and reinvented for nearly every user-facing application
in the wild. Just because an function is simple does not mean it's only for
beginners. *Helper functions* as these are called, save hours of work and more
importantly, enforce consistency across the broad scope of an application.

Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_01.py``

#.  Within, ``task_01.py``, define a function named ``bool_to_str()``

    #.  ``bool_to_str()`` will convert a boolean value of ``True`` or ``False``
        to the string values of ``Yes`` or ``No``

    #.  Takes 2 arguments:

        #.  The first argument should be named ``bvalue``

        #.  The second argument should be named ``short`` and have a default
            value of ``False``

    #.  Returns a string

    #.  If ``short`` is set to to ``True`` it should only return ``Y`` or ``N``

.. note::

    For the purpose of this document and others, when I refer to function
    names, I will always include the open and close parens "()" to indicate
    that I am speaking about a function.

.. note::

    As we move into functions, what you choose to call your variables will
    have considerably diminished importance. At this point, it's far more
    important to name your arguments correctly and place them in the directed
    order.

Examples
^^^^^^^^

.. code:: pycon

    >>> import task_01
    >>> task_01.bool_to_str(False)
    'No'
    >>> task_01.bool_to_str(True, short=True)
    'Y'

Task 02: Loan Calculator Revisited
----------------------------------

Here we revisit the loan calculator from Homework #3, Task #5. One benefit of
implementing programs within the context of a function is that they become
re-usable in other portions of your system. It's not unreasonable to think of
many points where the ``compound_interest()`` function below could be used.

.. important::

    Do not use ``raw_input()`` to complete this task. All previous calls to
    ``raw_input()`` should be replaced with functions that take arguments as
    input.

.. important::

    In the interest of simplicity, you don't need to convert the
    prequalification variable from the string 'Yes/No' to a boolean. Just
    assume that it is already converted to boolean ``True`` or ``False`` for
    your arguments.

Specifications
^^^^^^^^^^^^^^

#.  Open ``task_02.py``

#.  Re-implement this code as a set of functions:

    #.  ``get_interest_rate()`` returns the interest rate, as a decimal, for
        the passed, ``principal``, ``duration``, and ``prequalification``

        #.  Takes three arguments:
            
            #.  ``principal``, a numeric type, the value of the principal

            #.  ``duration``, a numeric type, the duration of the loan

            #.  ``prequalification`` a boolean, whether or not the loan is
                pre-qualified.

        #.  Returns a decimal form of the interest rate or ``None`` if none
            exists.

    #.  ``compound_interest`` calculates compound interest for a given
        ``principal``, ``duration``, ``rate``, and ``interval``

        #.  Takes four arguments:
            
            #.  ``principal``, a numeric type, the value of principal

            #.  ``duration``, a numeric type, the duration of the loan

            #.  ``rate``, a numeric type, the interest rate

            #.  ``interval``, a numeric type, defaults to 12, the number of
                times that interest is compounded annually

        #.  Returns the compounded interest and principal (combined) as a
            numeric type.

    #.  ``calculate_total()`` returns the total amount owed over the life of
        the loan.

        #.  Takes three arguments:
            
            #.  ``principal``, an integer, the value of the principal

            #.  ``duration``, an integer, the duration of the loan

            #.  ``prequalification`` a boolean, whether or not the loan is
                pre-qualified.

        #.  Finds the rate with ``get_interest_rate()`` and calculates the
            total with ``compound_interest()``.

        #.  Returns the total, rounded to the nearest integer. In the event
            that there is no interest rate for the passed arguments, returns
            ``None``.

#.  In addition, we're going to add one more function:

    #.  ``calculate_interest`` returns just the interest owed over the life
        of the loan (without the principal).

        #.  Takes three arguments:
            
            #.  ``principal``, an integer, the value of the principal

            #.  ``duration``, an integer, the duration of the loan

            #.  ``prequalification`` a boolean, whether or not the loan is
                pre-qualified.

        #.  Finds the rate with ``get_interest_rate()`` and calculates the
            total with ``compound_interest()``.

        #.  Returns just the interest owed over the life of the loan as an
            integer. This may be calculated by calculating the total with
            ``calculate_total()`` and subtracting the ``principal``. In the
            event that there is no interest rate for the passed arguments,
            returns ``None``.

Examples
^^^^^^^^

.. code:: pycon

    >>> import task_02
    >>> task_02.get_interest_rate(100000, 15, True)
    Decimal('0.0363')
    >>> task_02.compound_interest(100000, 15, Decimal('0.0363'))
    Decimal('172233.0130127978509806406311')
    >>> task_02.calculate_total(100000, 15, True)
    172233
    >>> task_02.calculate_interest(100000, 15, True)
    72233
    >>> task_02.calculate_total(1000000, 30, True)
    None
    >>> task_02.calculate_interest(1000000, 20, False)
    None
    
Task 03: Transforming Data
--------------------------

Python functions can be chained together to create powerful suites of
functionality. When combined with the ability to react to arguments, you can
create intelligent tools for reacting to your data.

Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_03.py``

#.  Within ``task_03.py``, create a function named ``celsius_to_fahrenheit()``

    #.  ``celsius_to_fahrenheit()`` converts a temperature given in Celsius to
        Fahrenheit.

    #.  Takes exactly one argument, ``temperature`` which could be a number
        of any type.

    #.  Uses the following equation to calculate the temperature:

        .. math::

            F=\frac{9C}{5}+32

            \text{Where}\\
            &C \text{ is the temperature in Celsius}\\
            &F \text{ is the temperature in Fahrenheit}

    #.  Returns a ``float`` of the temperature converted to Fahrenheit.

#.  Within ``task_03.py``, create a function named ``fahrenheit_to_celsius()``

    #.  ``fahrenheit_to_celsius()`` converts a temperature given in Fahrenheit
        to Celsius.

    #.  Takes exactly one argument, ``temperature`` which could be a number
        of any type.

    #.  Uses the following equation to calculate the temperature:

        .. math::

            C=\frac{5(F-32)}{9}

            \text{Where}\\
            &C \text{ is the temperature in Celsius}\\
            &F \text{ is the temperature in Fahrenheit}

    #.  Returns a ``float`` of the temperature converted to Celsius.

#.  Within ``task_03.py`` create a function named ``convert_temperature()``

    #.  ``convert_temperature()`` detects the type of temperature it is passed
        and outputs it as the specified output type.

    #.  Takes exactly two arguments:

        #.  ``temperature`` a string in the format of ``35C`` or ``45F`` with
            the Celsius or Fahrenheit symbol.

        #.  ``output_format`` a string that accepts either ``'c'`` or ``'f'``
            as valid input. This defaults to ``'c'``.

    #.  Returns a *numeric* type of the temperature in the selected output
        format.

    #.  If ``output_format`` is ``'c'``, the incoming temperature should be
        output as Celsius. If ``output_format`` is ``'f'``, the incoming
        temperature should be output as Fahrenheit.

    #.  ``convert_temperature()`` should use the previous two functions to
        accomplish its respective conversions.

    #.  If passed an incorrect ``output_format`` or ``temperature``, it should
        return ``None``

Examples
^^^^^^^^

.. code:: pycon

    >>> import task_03
    >>> task_03.celsius_to_fahrenheit(42)
    107.6
    >>> task_03.fahrenheit_to_celsius(42)
    18.0
    >>> task_03.convert_temperature('42F', 'c')
    107.6
    >>> task_03.convert_temperature('107.6F', 'f')
    107.6
    >>> task_03.convert_temperature('42C')
    42
    >>> task_03.convert_temperature('42C', 'f')
    18.0
    >>> task_03.convert_temperature('42C', 'p')
    None
    >>> task_03.convert_temperature(42)
    None

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
