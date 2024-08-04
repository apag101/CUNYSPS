==========================================
IS 210: Software Application Programming I
==========================================
------------
Homework #04
------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Available: 2014-09-15T09:00:00-0400
:Due-Date: 2014-09-22T09:00:00-0400

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

Import Refresher
----------------

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

Task 01: Analyze a String
-------------------------

Loops enable you to process huge amounts of data in a methodical and logical
manner. We'll start by analyzing a string, in particular Shakespeare's famous
*Crispin's Day* speech from Act IV, Scene III of *Henry V*.

#.  Start by creating a new file named ``task_01.py``

#.  In ``task_01.py``, import the data module.

#.  Print data.SHAKESPEARE (isn't it a beautiful speech?).

#.  Using ``for`` and all of the various tools we've previously encountered:

    #.  Find the maximum number of words **per line** in data.SHAKESPEARE and
        save it to a variable named ``MAXIMUM_WORDS`` (eg, between any two
        lines where one has 5 words and one has 6, save the number 6).

    #.  Find the minimum number of words **per line** in data.SHAKESPEARE and
        save it to a variable named ``MINIMUM_WORDS``.

    #.  Find the average number of words **per line** in data.SHAKESPEARE and
        save it to a variable named ``AVERAGE_WORDS``. Use a ``float()`` for
        precision.

    #.  Find the total number of **lines** in data.SHAKESPEARE containing the
        word ``Crispian`` and save the result to a variable named 
        ``NUM_CRISPIAN``.

.. hint::

    You'll have to ``split()`` this string twice to accomplish the first three
    objectives. The first time, you'll be splitting it on the newline (``\n``),
    and the second will use the default setting (without any arguments) to
    split on all whitespace.

    Remember that ``split()`` returns a list which is iterable and thus may be
    used as the data object for a `for` loop. Lists also have measurable
    length with ``len()``. To count the number of members of a list, just use
    ``len(listname)`` the same way you would count the number of characters in
    a string.

.. hint::

    Averages are tough because you'll have to keep a count of both the number
    of lines as well as the total words. Alternately, consider measuring
    the *total words* of the entire speech by using ``split()`` without any
    arguments to split the string on all whitespace (including newlines).

    Don't forget to use your loop counter to count the number of lines.

.. hint::

    To force an integer as a float, use the builtin float constructor,
    ``float()`` which is functionally similar to our old standbys, ``int()``
    and ``str()``

.. hint::

    The `in` operator can be very helpful for testing if one string is found
    within another string. Other methods such as ``.search()`` and
    ``.index()`` can also perform this feat if a little differently.

Task 02: Prompting inside a Loop
--------------------------------

Unlike ``for`` loops, which perform an operation or series of operations for
each member in the iterable object, a ``while`` loop may run indefinitely or at
least until certain conditions change and are met. A common scenario for this
type of loop is checking user input such as comparing a password against a
known database.

.. code:: console

    $ python task_02.py
    What is your password (3 attempts left)? Not correct
    What is your password (2 attempts left)? Umm Yes?
    What is your password (1 attempts left)? I do not remember!
    Access is denied, please try again later.

#.  Create a new file named ``task_02.py``.

#.  In ``task_02.py``, import the ``data`` module.

#.  Instantiate a variable named, ``ACCESS`` and set its initial value to False.
    This is a good practice called *pessimistic behavior* to always assume
    the most defensive stance until you have a reason to do otherwise.

#.  Begin a ``while`` loop and use ``raw_input()`` to ask your users to input
    the password.

    #.  The while loop should depend upon the value of ``ACCESS`` to know
        whether to stop or continue looping.

    #.  Compare the password entered by the user to ``data.PASSWORD``. If the
        user-entered string is the equivalent to ``data.PASSWORD`` set
        ``ACCESS`` to ``True`` and print a message indicating that access was
        granted.

    #.  The user has at most three tries. Keep a counter of the number of loops
        and inform them each time of how many tries they have left.

    #.  If the user has used up all of their tries, exit the loop and print
        a message that they try again some other time.

.. hint::

    You can use ``.format()`` with your raw_input message to change the number
    of attempts on the fly.

.. hint::

    This is a great use-case for the ``break`` statement.

.. hint::

    Instantiate your counter before the loop begins.

Task 03: Looping Mathematical Calculations
------------------------------------------

Both lists and loops may be nested. Here, you'll loop through what is
essentially two lists, the outer list represents the days of a particular
month, while the inner list represents the positive and negative transactions
occurring on that particular day. Eg,

.. csv-table:: Transactions
    :header: "Day", "Daily Transactions"
    :widths: 5, 33

    1, "-$257, -$1918, $2304"
    2, "-$1753"
    3, "-$2993, -$2156"

As the relevant data is already sorted into two lists, it is sequenced data
that may be looped. You will provide insight into the goings on of this
particular account holder.

#.  Import the ``data`` module

#.  Take a moment to examine ``data.TRANSACTIONS`` just to see the structure and
    how it compares to the visual representation above.

#.  Using nested ``for`` loops, calculate the following:

    #.  Provide a running total of all transactions across all days and save
        the result to a variable named ``TOTAL``.
    
    #.  Calculate the minimum **daily** transaction total and store the result
        in a variable named ``MINIMUM``. Considering the example above, this
        would be -$5149, accrued on the third day of transactions.

        For the purpose of this question, use an absolute minimum; do **not**
        calculate *minimum change* (which would be represented as $129
        accrued on the first day).

    #.  Calculate the maximum **daily** transaction total and store the result
        in a variable named ``MAXIMUM``. Considering the example above, this
        would be $129, accrued on the first day of transactions.

        For the purpose of this question, use an absolute maximum; do **not**
        calculate *maximum change*.

Task 04: Create 4-person Multiplayer Teams
------------------------------------------

Inspired by an inventive student discovery of Python use in the netcode of
major AAA games, our final two questions will seek to emulate matchmaking or
pairing players.

Our general approach will be to ``split()``, slice, and loops to parse data that
is roughly organized in a similar manner to a fixed-width text file. For those
who've worked with CSV's or particularly old data systems, this should be
familiar.  For others, a fixed width text file uses a set number of characters
(aka columns) for each data point with whitespace in between. In this way, new
data is guaranteed to always appear at the same point in each line and, as a
result, it is very friendly to our string slicing!

Example::

    Name        Connection
    Ralph       1
    Rachel      1
    Diana       0
    Matthew     1
    Beverly     1
    Frances     1
    Martha      1


The goal is to assign each of our players to a different team until the teams
are filled. Players who cannot play due to a bad connection (found in column
12), should be skipped.


#.  Create a new file ``task_04.py``

#.  In ``task_04.py``, import the ``data`` module

#.  Write a program to evenly assign players in ``data.MULTIPLAYERS``` to one
    of three teams.

    #.  Start by instantiating the teams as empty strings variables ``TEAM1``,
        ``TEAM2``, and ``TEAM3``. Players will be included as comma-separated
        names, eg:

        .. code:: pycon

            >>> print TEAM1
            'Ralph,Beverly'

    #.  Also initialize a counter

    #.  Use ``split()`` and newline (``\n``), to split the string on newlines

    #.  To avoid processing the header, slice the result of the ``split()`` to
        include everything except the header.

    #.  Begin processing your ``for`` loop. Players should be distributed in a
        round-robin fashion meaning that, as in the above example, your first
        few assigned players look like:

        .. code:: pycon

            >>> print TEAM1
            'Ralph,Beverly'
            >>> print TEAM2
            'Rachel,Frances'
            >>> print TEAM3
            'Matthew,Martha'

        Note how the last player does not have a trailing comma!

    #.  Once each team has 4 players, stop processing.

    #.  Print your team makeups!

.. hint::

    Don't forget to ``.strip()`` the whitespace off your slices.

.. hint::

    Use modulus (``%``) on your counter in order to tell to which team a certain
    player should be assigned.

.. hint::

    There are more players than there are spots on the team. Know when to use
    ``break``. Also pay attention to *where* you increment your counter. Should
    it increment before or after you determine whether the player has a good
    connection?

Task 05: Create versus Matchups
-------------------------------

Our final task is similar to the last. We'll be using a list of players and
setting up a full tournament of 1-on-1 matchups. Take note all basketball
enthusiasts, this is the start of how you win next year's office pool.

To achieve this, we must loop the same data structure over itself. This type of
operation is know as creating a *cartesian product* for the curious. In our
case, we won't be creating a full cartesian product but a half-one.

Consider the following table:

.. table:: Full Cartesian

    ======== ======== ======== ======== ========
    Players  Player 1 Player 2 Player 3 Player 4
    ======== ======== ======== ======== ========
    Player 1 No       No       No       No
    Player 2 Yes      No       No       No
    Player 3 Yes      Yes      No       No
    Player 4 Yes      Yes      Yes      No
    ======== ======== ======== ======== ========

We don't want the same pair to face each other twice and obviously, the
same player can't face himself/herself. So how can you achieve this?

The answer is surprisingly simple. If each player is given a number, players
in the rows may only play players in the columns whose numbers are lower
than (``<``) their own.

Programming this solution turns out to be fairly painless but requires the use
of the ``enumerate()`` function. If you haven't watched this week's video, be
sure to do so as I'll go over ``enumerate()`` in considerable more detail than
is found in the course text.

#.  Create a new file named ``task_05.py``

#.  In ``task_05.py``, import ``data``

#.  Create a new variable named ``MATCHUPS`` to store our completed matchups.
    Instantiate it as an empty string (``''``).

#.  Instantiate a variable to act as your counter.

#.  Enumerate ``data.VERSUS`` and start a for loop. Just to give you a little
    boost it should look something like:

    .. code:: python

        for ROW_INDEX, ROW_NAME in enumerate(data.VERSUS):

    Here we create two variables accessible within the loop. The first is the
    index (the order number) associate with the player currently being
    accessed. The other variable is the player's name, now accessible as
    ``ROW_NAME``.

#.  Now, enumerate and loop ``data.VERSUS`` again, this time creating
    ``COLUMN_INDEX`` and ``COLUMN_NAME``.

#.  Compare the two indicies using a simple greater-than (``>``) or less-than
    (``<``) to avoid the duplication described above. If the result passes a
    test, increment your counter and add a new line to ``MATCHUPS`` using and
    (you guessed it), .format(), so that ``MATCHUPS`` starts to look like
    the following::

        1,"Fandral","Hogan"
        2,"Volstagg","Sif"

    This represents the counter, the ``ROW_NAME``, and the ``COLUMN_NAME`` for
    each match-up on each line.

    Note the double quotes around the names. You'll need to add those in your
    formatting strings (eg ``"{0}"``) to ensure they appear in the final
    result
    
#.  Don't forget to strip any extra whitespace off your final output!

#.  Print your amazing exclusive half-cartesion and take a break; you deserved
    it!

.. note::

    A fun fact: the data-format of your result is syntactically compatible with
    the comma-separated value (.csv) data-type. In fact, if you'd like to see
    your result in another program like Excel, type the following in git-bash:

    .. code:: console

        $ python task_05.py > matchups.csv

    This will redirect the output from printing on the screen to instead print
    into a new file named matchups.csv. You can then open matchups.csv in
    excel or any other csv-compatible reader to see the data in all its glory.

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
