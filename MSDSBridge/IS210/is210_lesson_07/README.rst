==========================================
IS 210: Software Application Programming I
==========================================
------------
Homework #07
------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Available: 2014-10-06T09:00:00-0400
:Due-Date: 2014-10-14T09:00:00-0400

Overview
========

The following tasks will either have you interacting with existing files in
the starter repo or creating new ones on the fly. Don't forget to add your
interpreter directive, utf-8 encoding, and a short docstring with any new files
that you create!

Warmup Tasks
============

Task 01: Creating a Dictionary
------------------------------

Dictionaries can often be thought of as tabular data which is why they're so
commonly used to represent database data. For this task, we'll be creating
a dictionary from a table of data.

Specifications
^^^^^^^^^^^^^^

#.  Create a file, ``task_01.py``.

#   In ``task_01.py``, create a constant called ``GRADE_DATA`` that stores the
    following table, *Grades*,  as a **nested** dictionary.

    #.  The first level key of the dictionary is ``student`` which represents
        the student's name.

    #.  Second level keys of this dictionary should map to the subjects.

    #.  Do not use functions that convert data of other types to instantiate
        the dictionary. You should use some form of the ``{}`` syntax to
        construct the dictionary.

    #.  Your dictionary construction should be clean and well-indented to make
        it easy to read.

Data
^^^^
    
.. table:: Grades

    ====================== ================ =====
    student                subject          grade
    ====================== ================ =====
    Luke Skywalker         math             B
    Luke Skywalker         etiquette        B+
    Luke Skywalker         grammar          B
    Luke Skywalker         gym              A
    Han Solo               math             A-
    Han Solo               etiquette        C-
    Han Solo               grammar          B
    Han Solo               gym              B
    C-3PO                  math             C
    C-3PO                  etiquette        A+
    C-3PO                  grammar          A
    C-3PO                  gym              F
    ====================== ================ =====

Task 02: Dictionary Access
--------------------------

There are a number of ways to access data from dictionaries. Here we'll
practice a few of the most common ones.

Specifications
^^^^^^^^^^^^^^

#.  Start off by opening ``data.py`` and just taking a look at the structure of
    the ``BANDS`` dictionary.

#.  Create a file named ``task_02.py``.

#.  In ``task_02.py``, import the ``data`` module.

#.  In one line, create a new constant named ``NIGEL`` and use dictionary keys
    to assign its value value from the ``'Nigel Tufnel'`` entry of the
    ``data.BANDS`` dictionary.

#.  Create a new constant named ``BANDS_NAMES`` and use a built-in dictionary
    function to fill it with a list of band-names from ``data.BANDS``.

Usage
^^^^^

.. code:: pycon

    >>> import task_02
    >>> task_02.NIGEL
    ['guitar', 'vocals', 'bass', 'violin', 'harmonica', 'clarinet',
     'keyboards', 'piano']
    >>> task_02.BAND_NAMES
    ['The Rolling Stones', 'Van Halen', 'Spinal Tap', 'Queen', 'The Beatles',
     'The Who', 'Fleetwood Mac']

Task 03: Adding and Removing Keys
---------------------------------

There are a number of ways to add or remove keys to Python dictionaries. Here,
we'll cover the most common types.

Specifications
^^^^^^^^^^^^^^

#.  Create a new file named, ``task_03.py``

#.  Import the ``data`` module.

#.  With ``task_03.py``, copy ``data.BANDS`` into a new constant named
    ``CORRECTED``.

    .. tip::

        Keep in mind that the assignment operator (``=``), doesn't a
        dictionary, it just creates a new reference to it. There is a built-in
        dictionary function that creates a new copy of a dictionary.

#.  Using the assignment syntax (``[]``) add a new entry to ``CORRECTED``
    with a key value of ``Dylan`` and the following value:

    .. code:: python

        {'Bob Dylan': ['vocals', 'guitar', 'harmonica']}

#.  Remove the ``'David Lee Roth'`` entry from the ``'Van Halen'`` entry of
    ``CORRECTED`` with the ``del`` statement.

#.  Using the assignment syntax (``[]``), add a new entry to
    ``CORRECTED['Van Halen']`` with key ``'Sammy Hagar'`` and value
    ``['vocals']``.

Example
^^^^^^^

.. code:: pycon

    >>> CORRECTED['Van Halen'].keys()
    ['Eddie Van Halen', 'Sammy Hagar', 'Michael Anthony', 'Alex Van Halen']

Task 04: Merging Two Dictionaries
---------------------------------

The ``.update()`` method is a powerful tool for merging dictionary data as
you'll see below.

Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_04.py``.

#.  With ``task_04.py``, create a new top-level band entry in ``data.BANDS``
    with the key, ``'Buckingham Nicks``. The key:values of ``Buckingham Nicks``
    are:

    .. code:: python

        'Lindsey Buckingham': ['guitar', 'vocals'],
        'Stevie Nicks': ['vocals', 'tambourine']

#.  Use a built-in dictionary function to merge 
    ``data.BANDS['Buckingham Nicks']`` into 
    ``data.BANDS['Fleewood Mac']`` so that there are now five keys in
    ``data.BANDS['Fleetwood Mac']``.

Task 05: Changing the Value of a Key
------------------------------------

Changing dictionary values is nearly identical to assigning them.

Specifications
^^^^^^^^^^^^^^

#.  Create a file named ``task_05.py``.

#.  With ``task_05.py``, import the ``data`` module.

#.  Change the value of ``data.SUPERHEROES['Logan']['alias']`` to
    ``'Wolverine'`` without altering ``data.py`` and without creating a new
    dictionary or variable.

Task 06: Getting Values with a Default
--------------------------------------

The ``.get()`` function has surprising utility when traversing data that
could be incomplete.

Specifications
^^^^^^^^^^^^^^

#.  Start by taking a peek inside ``data.SUPERHEROES`` to get a sense of its
    structure.

#.  Open ``task_06.py``

#.  Complete line 10 of ``task_06.py`` so that the ``'pet'`` key of the
    ``HERO_DATA`` dictionary is added to the new ``SUPER_SIDEKICKS``
    dictionary.

#.  If no pet data exists, the returned value should be ``None``

#.  Use a built-in dictionary function to achieve this objective.

#.  Restrict your edits to just line 10.


Task 07: Iterating Dictionaries
================================

It is often very useful to iterate through a dictionary object separating the
iteration into key and value pairs. In this task you will need to use your new
knowledge of dictionary iteration using the ``iteritems()`` method.

Specifications
--------------

#.  Create a file named ``task_07.py``

#.  Declare a variable named ``DATA`` as a dictionary object. Assign it a set
    of key/value pairs. This is example data for you to work with but you may
    create any dictionary of data provided it is at least 10 items long and
    both keys and values are integers.

#.  Create a function named ``iter_dict_funky_sum()`` that takes one
    dictionary argument.

    #.  Declare a running total integer variable.

    #.  Extract the key/value pairs from ``DATA`` simultaneously in a loop. Do
        this with just one ``for`` loop and no additional forms of looping.

    #.  Assign and append the product of the value minus the key to the running
        total variable.

    #.  Return the funky total.

Example ``Data``
----------------

.. code:: python

    DATA = {
        2: 7493945,
        76: 4654320,
        3: 4091979,
        90: 1824881,
        82: 714422,
        45: 1137701,
        10: 374362,
        0: 326226,
        -15: 417203,
        -56: 333525,
        67: 323451,
        99: 321696,
        21: 336753,
        -100: 361237,
        55: 1209714,
        5150: 1771800,
        42: 4714011,
        888: 14817667,
        3500: 13760234,
        712: 10903322,
        7: 10443792,
        842: 11716264,
        18584: 10559923,
        666: 9275602,
        70: 11901200,
        153: 12074784,
        8: 4337229
    }

Output Example
--------------

.. code:: pycon

    >>> import task_07
    >>> task_07.iter_dict_funky_sum(task_07.DATA)
    140166242
    >>>

Task 08: Dictionary Comprehensions
==================================

Comprehensions are powerful tools for processing data quickly, efficiently,
and with a minimum of developer effort. Here we'll use one to go shopping!

Specifications
--------------

#.  Create a file named ``task_08.py``.

#.  Copy ``data.FRUIT`` into the global namespace via
    ``from data import FRUIT``.

#.  Create a function named ``get_cost_per_item()``.
    
    #.  Takes exactly one argument: a dictionary called ``shoplist``.

        #.  The key of ``shoplist``  should be the item name as found in
            ``FRUIT``

        #.  The value of ``shoplist`` should be an integer indicating the
            number of units to purchase.

    #.  In one line, use a *dictionary comprehension* to:

        #.  Iterate over the ``shoplist``

        #.  Filter results for ``shoplist`` to only return keys found in
            ``FRUIT``

        #.  Multiply the number of units from ``shoplist`` by the price of
            the units found in ``FRUIT``. (These are the respective
            values of each dictionary).

        #.  Return a new dictionary keyed by the name of the fruit with the
            total cost per-item reflected.

#.  Create a function named ``get_total_cost()``.

    #.  Takes exactly one argument: a dictionary called ``shoplist``.

        #.  The key of ``shoplist``  should be the item name as found in
            ``FRUIT``

        #.  The value of ``shoplist`` should be an integer indicating the
            number of units to purchase.

    #.  In a single-line:

        #.  Uses ``get_cost_per_item()`` to retrieve the per-item costs.

        #.  Sums the values of the resultant dictionary together.

            .. tip::

                Check out the ``sum()`` function to help with this. There's
                also a helpful dictionary built-in function you might want to
                use.

        #.  Returns the total cost.

Examples
--------

shoplist
^^^^^^^^

.. code:: pycon

    >>> print shoplist
    {'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1}
        
get_cost_per_item()
^^^^^^^^^^^^^^^^^^^

.. code:: pycon

    >>> get_cost_per_item({'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1})
    {'Lime': 7.08, 'Peach': 95.76, 'Red Pear': 9.96}

get_total_cost()
^^^^^^^^^^^^^^^^

.. code:: pycon

    >>> get_total_cost({'Lime': 12, 'Red Pear': 4, 'Peach': 24, 'Beet': 1})
    112.80000000000001

get_total()
^^^^^^^^^^^

Task 09: Merging Data Using a Dictionary Key
============================================

As a Python programmer, you may at some point face a situation where you are
tasked with merging data from multiple data sources. This is usually done with
some kind of key values shared between the data sets.

For this task you will be working to merge Internet bandwidth data collected
from three of the routers used by SPS at our main campus. The Chief Information
Officer (CIO) wants a report showing hourly average download traffic for each
router between 9/15/2014 and 9/20/2014. The network administrator has dumped
the data for each router into a CSV file.

Since we have yet to cover file IO operations in class, a
``task_09_utility.py`` module has been provided. It includes a helper function
for retrieving data from the CSV files in the form as a list of dictionary
objects. A second helper function provides a way to convert a dictionary into a
sorted list.

Specifications
--------------

#.  Create a file named ``task_09.py``

#.  Import the ``task_09_utility.py`` file.

#.  Instantiate a list variable named ``DATA_FILES`` and assign it three
    dictionary objects each with a key value ``data`` and values of:

    -   ``'task_09_data/router_01.csv'``
    -   ``'task_09_data/router_02.csv'``
    -   ``'task_09_data/router_03.csv'``

    These values are paths to a set of files on the filesystem. You can
    see them in your repository folder even though, right now, they're just
    strings.

#.  Create a function named ``load_data()`` that accepts the ``DATA_FILES``
    list object as a parameter and returns a dictionary.

    #.  Loop through the list to begin filling your return dictionary.
    
    #.  The key for your return dictionary will be an integer. Set a counter
        within your loop that can be used as the key of your dictionary.
        Example (1, 2, 3, ...)
    
    #.  Get the value to be associated with your key/counter by calling the
        ``task_09_utility.get_data()`` function and passing it the file path
        associated with the ``data`` key of your loop value (eg, see
        ``DATA_FILES`` construction.
            
    #.  Return a dictionary object.
    
#.  Create a function named ``merge_data()`` that accepts a dictionary object.
    This function should be capable of accepting the output of ``load_data()``
    as its input argument.

    #.  Declare an empty dictionary variable to hold your merged data.

    #.  Use a loop that extracts the key and value pair of log data passed into
        ``merge_data()`` using the dictionary object ``iteritems()`` method.
    
    #.  Use string slicing to extract the day of the month and the hour of
        each log entry to create a candidate key for the merged data.
    
    #.  Use an ``if`` conditional to check if the candidate key is already
        present in the declared container dictionary variable.

    #.  Assign the key a value of a list containing the ``clock`` and
        ``value_avg`` keys from the input dictionary.
    
    #.  Make sure to handle situations where dates are missing from any of the
        data sources. Assign a value of zero for any missing data.

    #.  Convert the container dictionary to a sorted list using
        ``task_09_utility.sort_dict()``.

    #.  Return the sorted list.

Output Example
--------------

.. note::

    This is only example output. It has been truncated for brevity.

.. code:: pycon

    >>> loaded_data = load_data(DATA_FILES)
    >>> merge_data(loaded_data)
    [['2014-09-15 00:00:00', 0, '137640', '141366'],
     ['2014-09-15 01:00:00', 0, '123755', '115611'],
     ['2014-09-15 02:00:00', 0, '135569', '114956'],
     ['2014-09-15 03:00:00', 0, '303295', '288066'],
     ['2014-09-15 04:00:00', 0, '140800', '110984'],
     ['2014-09-15 05:00:00', 0, '132150', '126002'],
     ...
     ['2014-09-18 04:00:00', '174456', '108466', '131256'],
     ['2014-09-18 05:00:00', '819066', '111762', '124666'],
     ['2014-09-18 06:00:00', '2118101', '505801', '803900'],
     ['2014-09-18 07:00:00', '767654', '943558', '1816370'],
     ['2014-09-18 08:00:00', '14522464', '5843934', '5233635'],
     ['2014-09-18 09:00:00', '23170931', '10404840', '11715033'],
     ['2014-09-18 10:00:00', '24114328', '14417230', '9235289'],
     ['2014-09-18 11:00:00', '23617824', '10295080', '7452332'],
     ['2014-09-18 12:00:00', '19077509', '13409772', '10086040'],
     ['2014-09-18 13:00:00', '25239127', '12299642', '11995444'],
     ['2014-09-18 14:00:00', '11978037', '8246122', '11055365'],
     ['2014-09-18 15:00:00', '31212115', '14750547', '11313491'],
     ['2014-09-18 16:00:00', '6526768', '6700765', '10439742'],
     ['2014-09-18 17:00:00', '11898908', '8920453', '3764985'],
     ['2014-09-18 18:00:00', '3044609', '2299610', '888989'],
     ['2014-09-18 19:00:00', '1978930', '2880184', '284551'],
     ['2014-09-18 20:00:00', '1662631', '1355832', '863157'],
     ['2014-09-18 21:00:00', '559190', '1358866', '384384'],
     ['2014-09-18 22:00:00', '155978', '177637', '190171'],
     ['2014-09-18 23:00:00', '128770', '114094', '167008'],
     ['2014-09-19 00:00:00', '277428', '198593', 0],
     ['2014-09-19 01:00:00', '120651', '124192', 0],
     ...
     ['2014-09-19 21:00:00', '132568', '129424', 0],
     ['2014-09-19 22:00:00', '357205', '107939', 0],
     ['2014-09-19 23:00:00', '141285', '107529', 0]]
    
Example of DATA_FILES
---------------------

Note how this is a list of dictionary objects.

.. code:: pycon

    >>> import task_09
    >>> task_09.DATA_FILES
    [{'data': 'task_09_data/router_01.csv'}, {'data': 'task_09_data/router_02.csv'}, {'data': 'task_09_data/router_03.csv'}]
    >>> 

Example of using ``task_09_utility.get_data()``
-----------------------------------------------

.. code-block::

    >>> import task_09_utility
    >>> task_09_utility.get_data('task_09_data/router_01.csv')
    [{'value_min': '106288', 'value_avg': '143334', 'num': '9', 'value_max': '280576', 'clock': '2014-09-15 22:00:00'}, {'value_min': '93728', 'value_avg': '111313', 'num': '9', 'value_max': '124728', 'clock': '2014-09-15 23:00:00'}, {'value_min': '100056', 'value_avg': '135149', 'num': '11', 'value_max': '310760', 'clock': '2014-09-16 00:00:00'}, ....

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
