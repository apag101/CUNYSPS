==========================================
IS 210: Software Application Programming I
==========================================
------------
Homework #03
------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Available: 2014-09-08T09:00:00-0400
:Due-Date: 2014-09-15T09:00:00-0400

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


Task 01: Collecting User Input
------------------------------

The ``raw_input()`` method is one way to interactively get input from your
users.

#.  Create a file named ``task_01.py``

#.  Use ``raw_input()`` to ask your users a question and assign the resultant
    value to a variable named ``QUESTION_01``.

#.  Use ``raw_input()`` and another function to ask your users a second
    question. This question should ask your users to provide a number and
    the result should be stored **as an integer** in a variable named
    ``QUESTION_02``.

Task 02: Simple Branching
-------------------------

The conditional ``if`` is a building block of any good language construct.

#.  Create a new file called ``task_02.py``

#.  Imagine that you were taking an incredibly difficult programming course. The stress of the course is
    starting to get to you so your doctor tells you to start regularly checking
    your systolic blood pressure. Unfortunately, the numbers are fairly hard to
    remember, you'd much rather know your pressure in common language terms.

    Using a combination of ``raw_input()`` and the conditional ``if``, write a
    program that asks the user their blood pressure. Compare the blood
    pressure against the following chart and assign the Status to a variable
    named ``BP_STATUS``. At the end of the program, print a nice sentence with
    a formatting string to tell you your status and use ``.format()`` to
    replace the formatting string with your ``BP_STATUS``.
    
    .. table:: Blood Pressure Readings
        
        ====== ===== ================
        Start  End   Status
        ====== ===== ================
        --     90    Low
        90     119   Ideal
        120    139   Warning
        140    160   High
        160    --    Emergency
        ====== ===== ================

.. hint::

    ``raw_input()`` only returns a string.

Task #03: Nested Statements
---------------------------

The conditional ``if`` may be nested like many other compound statements. This
can be used to provide branching for decision trees.

#.  Create a file named ``task_03.py``

#.  You're redesigning one of the rooms in your home but are overwhelmed with
    all of the color choices available. You find it much easier to make a
    decision between two colors than having all of them in front of you at the
    same time.

    Using ``raw_input()`` and nested ``if``, write a program to help you
    compare the colors in the chart below. Prompt the user after each color
    is chosen to select from two new colors. Only colors of the same Type and
    with the same Parent Color should be compared against each other (eg, 
    ``Accent`` colors with the parent ``Pumice`` are only compared against
    other ``Accent`` colors with the parent ``Pumice``). Save each result into
    a variable named after the type, (eg, ``BASE``, ``ACCENT``, and 
    ``HIGHLIGHT``).

    Complete the program by printing your color selections using a formatting
    string and ``.format()`` to replace your colors in the string.

    .. table:: Colors

        ================= ============ =======================
        Color             Type         Parent Color
        ================= ============ =======================
        Seattle Gray      Base         None
        Manatee           Base         None
        Ceramic Glaze     Accent       Seattle Gray
        Cumulus Nimbus    Accent       Seattle Gray
        Platinum Mist     Accent       Manatee
        Spartan Sage      Accent       Manatee
        Basically White   Highlight    Ceramic Glaze
        White             Highlight    Ceramic Glaze
        Off-White         Highlight    Cumulus Nimbus
        Paper White       Highlight    Cumulus Nimbus
        Bone White        Highlight    Platinum Mist
        Just White        Highlight    Platinum Mist
        Fractal White     Highlight    Spartan Sage
        Not White         Highlight    Spartan Sage
        ================= ============ =======================

Task 04: Ternary Expressions
----------------------------

When you need to perform a simple either/or assignment, a ternary expression
can be a useful tool in your toolkit.

#.  Open a new file named ``task_04.py``

#.  Ask the user what day it is using ``raw_input()``

#.  Next, use ``raw_input()`` to ask the user the time as a 4-digit number
    without a colon ('eg, ``0605``).

#.  Write a ternary expression to set a value to a variable named ``SNOOZE``

    If the day is ``'sat'`` or ``'sun'`` or the user-submitted time is
    less-than ``600``, set ``SNOOZE`` to ``True``, otherwise set it to
    ``False``

.. hint::

    You can't always pre-edit whether your users will input strings in the
    right case. Since Python is case sensitive it can at times be helpful to
    force user-submitted input into a consistent case like lowercase before
    starting a comparison.

    Similarly, you can't always predict if they'll use common shorthands like
    ``'Sat'`` for ``'Saturday'`` or ``'Sun'`` for ``'Sunday'``. When
    reasonable, also consider shortening user-inputs with slices.

.. note::

    Right now, we're going to skip an in-depth explanation of the Date/Time
    types of Python. This is not a particularly precise way of comparing
    times since it would allow a time like ``0670`` to exist but for our
    simple purposes here, it's enough. Not unlike ``Decimal()``, Python has
    special object types for dates and times.

Task 05: Compound Examples
--------------------------

Combined with Python's significant mathematical capabilities, the conditional
operator can make for a powerful decision-making engine.

#.  Create a new file ``task_05.py``

#.  Consider the following compound interest equation:

    .. math::

        A=P(1+\frac{r}{n})^{nt}

        \text{Where}\\
        &A \text{ is the total amount accumulated, with interest, over the
        duration of the loan}\\
        &P \text{ is the principal amount (the initial amount borrowed)}\\
        &r \text{ is the annual rate of interest represented as a decimal}\\
        &n \text{ is the number of times the interest is compounded each
        year}\\
        &t \text{ is the number of years for which } P \text{ is borrowed}\\

#.  Use this equation and the table below to create a program that calculates
    the total amount owed over the life of a loan. Use ``raw_input()`` to
    ask your users the following questions, in order:

    #.  What is your name?

    #.  What is the amount of your principal (the amount being borrowed)?

    #.  For how many years is this loan being borrowed?

    #.  Are you pre-qualified for this loan?

    .. table:: Interest Rates

        ===================== ============ ============== =============
        Principal             Duration     Pre-qualified?  Interest Rate
        ===================== ============ ============== =============
        $0 - $199,999         1 - 15yrs    Yes            3.63%
        $0 - $199,999         1 - 15yrs    No             4.65%
        $0 - $199,999         15 - 20yrs   Yes            4.04%
        $0 - $199,999         15 - 20yrs   No             4.98%
        $0 - $199,999         20 - 30yrs   Yes            5.77%
        $0 - $199,999         20 - 30yrs   No             6.39%
        $200,000 - $999,999   1 - 15yrs    Yes            3.02%
        $200,000 - $999,999   1 - 15yrs    No             3.98%
        $200,000 - $999,999   15 - 20yrs   Yes            3.27%
        $200,000 - $999,999   15 - 20yrs   No             4.08%
        $200,000 - $999,999   20 - 30yrs   Yes            4.66%
        $1,000,000+           1 - 15yrs    Yes            2.05%
        $1,000,000+           15 - 20yrs   Yes            2.62%
        ===================== ============ ============== =============

#.  Using a series of nested ``if`` statements and comparison operators,
    calculate the total amount owed and store the result in a variable named
    ``TOTAL``.

#.  Next, create a report for this user. The report should include the
    user's name and a summary of the relevant data and resemble the following::

        Loan Report for: Montgomery Burns
        --------------------------------------------------------------------
              Principal:         $173,254
              Duration:             18yrs
              Pre-qualified?:         Yes

              Total:             $263,858

    Replacing the recipient's name, principal amount, duration,
    pre-qualification status, and total as instructed. Note the uses of
    indentation, repetition, newlines (``\n``) and right justification.

#.  Save the completed report to a variable named ``REPORT``.

#.  Print the report.

.. note::

    There are several gaps in the Interest Rates table for pre-qualification
    statuses, durations, or principals that are not allowed. Your program
    should take these into account and set the total to ``None``.


.. hint::

    Use the Decimal() class to achieve the highest precision but ``round()``
    to round the final result to the nearest whole dollar.
    
.. hint::

    The value ``None`` is not the same as the string ``'None'``. How will
    that be represented in your report?

.. hint::

    You can use a variety of methods to build the report including
    concatenation assignment operators (``+=``), string repetition (``*``), 
    multi-line strings (``''''''``), parenthetical concatenation, and
    formatting strings with ``.format()``.

.. hint::

    A fundamental programming principal is DRY which stands for:
    *Don't repeat yourself.* Code that is copy/pasted within the same file or
    files is prone to breakage and can cause considerable clutter. Instead
    of calculating the total owed inside all of your ``if`` statements,
    consider just using the ``if`` to find the interest rate and set it into
    a variable. After the ``if`` block is complete, you can use the variable
    in your calculation.

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
