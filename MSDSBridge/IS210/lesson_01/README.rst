==========================================
IS 210: Software Application Programming I
==========================================
---------------------
Lesson 01: Assignment
---------------------

:College: CUNY School of Professional Studies
:Course-Name: Software Application Programming I
:Course-Code: IS 210
:Lesson: 01
:Points: 20
:Available: 2014-08-28T00:00:00-0400
:Due-Date: 2014-09-02T09:00:00-0400
:Authors: - Chad Heuschober
          - Clayton Kramer


Overview
========

This week's assignment serves to introduce you to the workflow you'll use to
submit the majority of your homework in class. It should take somewhere between
thirty-minutes and one-hour to complete, however, as this will be your first
experience with many new tools and technologies, I highly recommend that you
start work early in the event that you need to ask for assistance.

Prerequisites
=============

You should have completed all of the readings for this week before attempting
this assignment. Additionally, you should have already installed `Python 2.7`_
and `Git`_ on your machine. This assignment will require a stable internet
connection as much of this work will interact with external resources.

Conventions
===========

Terminal
--------

Use of the term *terminal* can be ambiguous depending upon the operating
system in use. For users of Microsoft Windows operating systems, this
specifically refers to the ``git bash`` shell that is available after the
installation of `Git`_. To use the ``git bash`` shell, right click the
contents of a folder in Windows explorer and select ``git bash``. This
should bring up a compatible terminal window. Users of OSX or other Linux
distributions will find that that their default terminals already come equipped
with the correct tools after the installation of `Git`_ and `Python 2.7`_.

Console Commands
----------------

For the purpose of this exercise, console commands will be preceded with a
dollar sign ($), to indicate the presence of a shell. Do not include this
symbol in any commands you type or copy yourself.

Instructions
============

Task 1: Sign-Up for GitHub
--------------------------

#.  Create a `GitHub`_ account.

    #.  Visit the `GitHub`_ website.

    #.  If you do not already have an account, create one.

        #.  Enter a new  username, your CUNY SPS-issued e-mail address,
            and a password, then click **Sign-Up**.

            .. image:: http://is210-faculty.github.io/images/github-create-account.png
                :align: center

        #.  The next screen will ask if you wish to upgrade to a paid plain. A
            paid plan is not necessary for this course and will offer you no
            advantages or benefits to coursework. Unless you have a personal
            reason to choose otherwise, leave the *Free* tier selected and 
            click **Finish sign-up**.

            .. image:: http://is210-faculty.github.io/images/github-account-tier.png
                :align: center

        #.  This will take you to your `GitHub`_ landing page. If you'd like
            to edit your profile further but including a picture or other
            details about yourself, you can visit your `GitHub Profile`_ page
            by clicking the little gear icon in the upper right corner of the
            header.

            .. image:: http://is210-faculty.github.io/images/github-settings-icon.png
                :align: center

        #.  Check your e-mail address from a verification e-mail from
            `GitHub`_.

        #.  If you didn't yet receive one, visit your `GitHub E-Mail Settings`_
            page and request another e-mail verification.

    #.  If you already have a `GitHub`_ account, please make you you have added
        your official CUNY SPS e-mail address to the account.

        #.  Visit your `GitHub E-Mail Settings`_ page and add your CUNY SPS
            e-mail address.

        #.  Be sure to verify this address, checking your e-mail for a
            verification e-mail sent from `GitHub`_ or using the
            `GitHub E-Mail Settings`_ page to send another verification e-mail.

    #.  Post your `GitHub`_ username into the assignment body on BlackBoard.

Task 2: Submit your first Python Code
-------------------------------------

#.  Visit the `assignment repository`_ page.

    .. image:: http://is210-faculty.github.io/images/github-assignment-repository.png
        :align: center

#.  Use the **Fork** button in the upper-right hand corner of the screen to
    *fork* this repository, which, effectively, makes a copy of it on your
    personal `GitHub`_ account.

    .. image:: http://is210-faculty.github.io/images/github-fork-icon.png
        :align: center

#.  Double check that you are now on your own personal fork of the `assignment
    repository`_ and not the `assignment repository`_ page itself.  You can
    differentiate the two because the title of the repository at the top of the
    screen should now start with your `GitHub`_ user account name, not the
    account name of your instructor.

    .. image:: http://is210-faculty.github.io/images/github-repository-landing.png
        :align: center

#.  Now that you're on your personal fork of the `assignment repository`_ copy
    the **HTTPS Clone Url** in the lower right-hand corner of the screen.

    .. image:: http://is210-faculty.github.io/images/github-https-clone-url.png
        :align: center

#.  Open a terminal on your local machine.

#.  If this is your first time using `Git`_ on this machine, you must first
    set-up `Git`_ to recognize your contributions.

    Type the following two commands:

    .. code-block:: console

        $ git config user.name "FIRST LAST"
        $ git config user.email "MY@EMAIL"

    Replace ``FIRST`` and ``LAST`` with your first name and last name as you
    would like them to appear on your contributions. Replace ``MY@EMAIL`` with
    the same e-mail address you registered with `GitHub`_. This should be your
    CUNY SPS e-mail address.

#.  Once `Git`_ is properly configured, type the following into the terminal in
    order to take a copy of the repository.

    .. code-block:: console

         $ git clone HTTPS_CLONE_URL lesson_01

    Replace  HTTPS_CLONE_URL with the **HTTPS Clone URL** you copied from
    `GitHub`_. This will copy your *personal* fork from `GitHub`_ to your local
    machine and into a directory called ``lesson_01``

#.  Next type:

    .. code-block:: console

        $ cd lesson_01

    This command will ``cd`` or *change directory* from the current one you're
    in to the ``lesson_01`` directory.

#.  To *list* all the files and folders in this directory, type:

    .. code-block:: console

        $ ls

    Which should return the following:

    .. code-block:: console

        hello_world.py LICENSE README.rst

    ``hello_world.py`` is a Python file.

    ``LICENSE`` is a standard license file. In this case, all of the code in
    this repository is covered under the *Mozilla Public License (v2)* which is
    an open-source license that permits you to distribute, share, and alter
    this code without fear of legal retribution provided that you follow the
    guidelines stated in the license file.

    ``README.rst`` is a README, a special type of documentation file about this
    project. The ``.rst`` extension indicates that it's written in
    `reStructuredText`_, the official language of Python documentation. If you
    were to peer inside that file you would the directions you're reading right
    now. Each assignment's instructions will be distributed with the assignment
    source code.

#.  We'll start by running our first python program. Type the following at
    the command line:

    .. code-block:: console

        $ python hello_world.py

    This will call the Python interpreter to start (``python``), and feed it a
    file to read and execute (``hello_world.py``). It should have printed
    the following:

    .. code-block:: console

        Hello World!

#.  Now, open hello_world.py in your text editor.

    #.  If you don't already have a favorite text editor, you can open the file
        with ``idle`` the basic text editor that comes bundled with Python. To
        open the file with ``idle``, just type:

        .. code-block:: console

            $ idle hello_world.py

    #.  You should now see the contents of the file which look like:

        .. code-block:: python

            #!/usr/bin/env python
            # -*- coding: utf-8 -*-
            """Prints a ``Hello World`` statement."""


            print "Hello World!"


    #.  Alter the file in such a way that instead of printing:

        .. code-block:: console

            Hello World!

        Have it print:

        .. code-block:: console

           Hello USERNAME!

        Where ``USERNAME`` is your `GitHub`_ username.

    #. Save your changes and exit the text editor

#.  To see if you were successful, try running the code again:

    .. code-block:: console

        $ python hello_world.py

    It should now print ``Hello YOUR-GITHUB-USERNAME!``.

#.  Once you're satisfied with the changes, let's take a look at what we've
    done in the repository. Type the ``git status`` command and receive output
    similar to the following:

    .. code-block:: console

        $ git status
        On branch master
        Your branch is up-to-date with 'origin/master'.

        Changes not staged for commit:
            (use "git add <file>..." to update what will be committed)
            (use "git checkout -- <file>..." to discard changes in working directory)

                modified:   hello_world.py

        no changes added to commit (use "git add" and/or "git commit -a")

    The ``git status`` command returns the status of your current repository.
    In this case it's telling us a few things:

    .. code-block:: console

        On branch master
        Your branch is up-to-date with 'origin/master'.


    This sections tells us which working branch we're using. We're not going to
    use branches very often so you can skip this part, however the next line is
    interesting because it's told us that it knows this code is up-to-date with
    what you have in the your personal fork on `GitHub`_. If you or someone
    else had made changes to the repository on `GitHub`_ after you had clone'ed
    the source, then this would report how far ahead your remote branch was.
    You could then choose to use a command like ``git pull`` to pick up the
    most recent changes from `GitHub`_. This is helpful if you spread your
    work across several machines.

    .. code-block:: console

        Changes not staged for commit:
        (use "git add <file>..." to update what will be committed)
        (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   hello_world.py

        no changes added to commit (use "git add" and/or "git commit -a")

    This section is more relevant for us. The first section it lists are files
    that it knows exist but that you have not told it to save in the next
    revision. When you closed you text editor you saved the file itself but
    a repository revision can be thought of like a snapshot in time of a whole
    folder full of files. Right now, though you've changed the file inside you
    haven't *saved* or *committed* the changes.

    Here it tells us that it knows that ``hello_world.py``, specifically, was
    modified and it reminds us of the command we need to execute to save it.

#.  Before we do that, however, there's one more git command that's useful for
    seeing changes. Let's say it's not enough that the file was changed. Let's
    say we want to know exactly what was changed from the last time the file
    was commited in the repository. Try the following command:

    .. code-block:: console

        $ git diff

    You should receive some pretty dense output that looks like:

    .. code-block:: diff

         diff --git a/hello_world.py b/hello_world.py
         index dfd137d..2eb4936 100644
         --- a/hello_world.py
         +++ b/hello_world.py
         @@ -3,4 +3,4 @@
          """Prints a ``Hello World`` statement."""
           
           
          -print "Hello World!"
          +print "Hello zoezebra!"

    The above output is a machine-readable diff format. It's sometimes used
    to create patch files and has a long history in the computer industry.
    While it's not amazingly legible, with practice it is possible to
    understand the output. On the first few line it tells us what's being
    compared and at what line numbers the comparison is happening. Then it
    shows us the difference. The line prefixed with a dash (``-``) is being
    removed and replaced with the line prefixed by a plus sign (``+``).

    I don't expect you'll use this every day but it can be helpful for
    checking your changes.

#.  Now that we've reviewed our changes let's stage them for the commit. Type:

    .. code-block:: console

        $ git add hello_world.py

    This will tell git to add ``hello_world.py`` in its next revision. This
    does not actually commit the change but it will be included.

    To check that it is staged, you can use ``git status`` again which should
    produce output similar to the following:

    .. code-block:: console

         On branch master
         Your branch is up-to-date with 'origin/master'.

         Changes to be committed:
            (use "git reset HEAD <file>..." to unstage)

                modified:   hello_world.py


    Compared to our earlier ``git status`` the ``hello_world.py`` file has
    changed from being listed under *Changes not staged for commit* to being
    listed under *Changes to be committed*. We now are ready for our first
    commit.

#.  As I said earlier, a *commit* is like saving the folder at a particular
    point in time. With `Git`_ we can not only save the folder as of a specific
    commit but we can go back to earlier states or merge changes with future
    states. For now, we just want to save our change to ``hello_world.py``.

    Type the following:

    .. code-block:: console

        $ git commit -m "Changed hello world to include my github username."

    Congratulations! You've taken a snapshot of your work! You should receive
    a few lines of output like:

    .. code-block:: console

        [master dbe34f4] Changed hello world to include my github username.
        1 file changed, 1 insertion(+), 1 deletion(-)

    The first is your commit ID and the second is just a summary of the
    changes.

    We include the ``-m "..."`` portion to automatically include the portion
    between the double quotes as our *commit message*. A commit message is an
    important part of every commit as it should inform someone why you made the
    changes you made in this particular commit. While not intended to be books,
    they should be complete enough to glean an understanding of the intention
    behind the changes in the files. Since a very large commit with many file
    changes would have a large commit message, we generally encourage commits
    to be small and often each representing a single change in function or
    output. If you do not include the ``-m "..."`` portion then a window should
    pop-up allowing you to write your commit messages in an alternative text
    editor.
  
    .. note::

        If you'd ever like to see the history of commits in a particular
        repository, use the ``git log`` command.

#.  The work is now saved on your local machine, but is not yet be *pushed* to
    your repository on `GitHub`_. To do that, type the following:

    .. code-block:: console

        $ git push origin

    This will ``push`` the contents of your current repository to the remote
    ``origin`` repository (in this case, the one you cloned from: your personal
    fork of the original branch).

#.  Now it's time to go back to `GitHub`_ to see our changes.

    #.  Click your username to be taking to your user landing page.

        .. image:: http://is210-faculty.github.io/images/github-user-home.png
            :align: center

    #.  On the center, near the top, click the tab called **Repositories**

    #.  You should have been presented with a list of repositories including
        the one you were just working on: **is210_2014_fall...**

        .. image:: http://is210-faculty.github.io/images/github-list-of-repositories.png
            :align: center

    #.  Click the repository link to see the repository and the changes you
        made. You can click individual files to see how they look now or
        use the commits tab above to see all of the commits (including your
        own).

        .. image:: http://is210-faculty.github.io/images/github-repository-commits.png
            :align: center

#.  Once you've confirmed that you're happy with the changes, you must open
    a pull request in order submit changes for grading.

    #.  Go back to the main page for the Lesson 01 repository on `GitHub`_ and
        click the green icon with two arrows in a circle to the left of the
        **branch** dropdown. The tooltip for this icon is "Compare, review,
        create pull request" which is exactly what we're going to do.

        .. image:: http://is210-faculty.github.io/images/github-pull-request-square-icon.png
            :align: center

    #.  The next page will outline the available changes for this pull request,
        there's only one thing we need to fix: right now it will send this
        pull request against the master branch and we don't want that. In the
        future, each student will have his or her own branches on the parent
        repository but, for now, we'll all use a different branch, the ``pull``
        branch.

        .. image:: http://is210-faculty.github.io/images/github-pull-request-initial-screen.png
            :align: center

        #.  Click the **Edit** button in the pull request header.

            .. image:: http://is210-faculty.github.io/images/github-pull-request-branch-target-edit.png
                :align: center

        #.  Select the ``pull`` branch from the **Base:** branch drop down.

            .. image:: http://is210-faculty.github.io/images/github-pull-request-branch-dropdown.png
                :align: center

        #.  The base branch should now point to ``pull``

            .. image:: http://is210-faculty.github.io/images/github-pull-request-branch-targets.png
                :align: center

    #.  Now that you're pointing to the correct branch, it's time to pull the
        big green **Create Pull Request** button!
        
        .. image:: http://is210-faculty.github.io/images/github-pull-request-green-button.png
            :align: center

    #.  You'll be taken to a screen where you can add your first comment in a
        pull request. Think of this as your message to me, your instructor,
        for when you want me to look at something. The title defaults to that
        of the most recent commit and often that's O.K. but you also might
        want to include a description of why you made certain choices or
        questions you might have. Once you're done adding details about why
        you want to merge this code into my repository, click the big green
        **Create Pull Request** button in the righthand corner.

        .. image:: http://is210-faculty.github.io/images/github-create-pull-request-comment.png
            :align: center

        You will now be redirected to your pull request page. Congratulations,
        at this point you have officially submitted your first code for review.
        Copy the link to your pull request and paste it into the body of the
        assignment.

        .. image:: http://is210-faculty.github.io/images/github-open-pull-request.png
            :align: center

Task 3: Use Jenkins to Review Test Results
------------------------------------------

#.  The next page you will see after submitting a pull request is the pull
    request comment page. This is where I can view your work and where we'll
    converse about your successes or questions such as they may arise. You can
    also use it to send additional comments to me with direct references to
    line numbers or test results. Please keep in mind that all `GitHub`_
    communications are public.

    .. image:: http://is210-faculty.github.io/images/github-open-pull-request.png
        :align: center

    .. note::

        I have sometimes found it difficult to rediscover this page when I've
        submitted my own pull requests. It's important to remember that a pull
        request happens on the "origin" repository, in this case, your
        instructor's official `assignment repository`_. To find this page
        again, you must first visit the `assignment repository`_ and then click
        the **Pull Requests** link in the right-hand navigation. 

#.  Within a few minutes of submitting your pull request, the IS-Faculty-CI
    robot will start automated testing. You should see its chatter in the
    comments of your pull request. The bot will notify you at 4 points in time:

        - When a build has been triggered (think of this as queued, it doesn't
          mean the tests have started).

        - When a build has actually started.

        - When the test results have been analyzed.

        - When the build has finished.

    Our build robot is rather pessimistic so I wouldn't worry too much if it
    marks the first two steps as being *FAILed* since it hasn't analyzed the
    results quite yet.

    .. image:: http://is210-faculty.github.io/images/github-ci-comments.png
        :align: center

#.  Once the test results are available, the bot will give you a link to more
    details on the build in one of the comments. For this exercise, please
    follow that link (it will begin with https://128.228.53.195/).

    You've now reached Jenkins, the heart of our continuous integration
    platform that allows us to provide you with automated results. The page
    you have been taken to is one that shows the results that are directly
    related to the round of tests you kicked off with your pull request.

    .. image:: http://is210-faculty.github.io/images/jenkins-build-result.png
        :align: center

    There are three links of interest here on the leftnav, two of which are
    necessary for the completion of the assignment. For this assignment we're
    going to ignore the **Console** link which provides detailed output from
    all of the testing.

#.  The first link of interest to us is the **Test Result** link which will
    take you to a page that summarizes your test results. If you followed the
    directions above, you should have just one failed test listed under **All
    Failed Tests**:

    .. image:: http://is210-faculty.github.io/images/jenkins-test-result.png
        :align: center

    ``lesson_01.test_hello.HelloWorldTestCase.test_jenkins_access``

    If you click the plus (+) sign beside its name you'll be given the
    **Error Details** that were reported. If you followed the directions
    thus far your error message should read:

        ``Good Job! This test is EXPECTED to fail. Your code is: XXXX``

    Where ``XXXX`` is a long string of characters.
    
    Copy and paste this code into your homework reply.

Task 4: Use the Violations Report to Affect a Change
----------------------------------------------------

#.  Now that you've seen the test results, we're going to take a look at
    another Jenkins feature, **Violations**. Click on the violations link on
    the left and you'll be brought to a page that shows coding and syntax
    violations.

    .. image:: http://is210-faculty.github.io/images/jenkins-violations.png
        :align: center

#.  Under the **pylint** heading is a list of files. If you followed directions
    exactly, at least one file should be present and reporting a violation.
    Click the filename to view the file with the offending line highlighted.

#.  If you hover your mouse over the little violations icon, you'll be given
    the type of coding violation this file has incurred.

#.  Now, for your final task, apply what you learned in the *Concepts and
    Terms* reading.
    
    #.  Decipher the meaning of the violation and how to fix it.

    #.  Use your local repository to make one more change to the offending
        file.

    #.  ``add`` and ``commit`` that file to your local repository.

    #.  ``push`` your changes upstream to your personal `GitHub`_ fork

    .. note::

        A fun fact about GitHub is that you don't need to subit another pull
        request at this point. GitHub senses that you've made some more changes
        and automatically adds them to the original pull request which is
        still open. This, in turn, will trigger another round of automated
        tests.

        Use this to get into the habbit of making incremental changes in
        response to test results. You only need to go through the trouble of
        forking a repository and submitting a pull request once; everything
        else can happen locally with git commands.

Summary
=======

To summarize, you must complete the following tasks for full credit:

#.  Create a `GitHub`_ account and paste your `GitHub`_ account name into
    the body of the assignment.

#.  Fork the lesson repository, make changes, and submit a pull request. Paste
    the link to the pull request into the body of the assignment.

#.  View the test results from the Jenkins testing server. Copy the code hidden
    in a failed test result and paste it in the body of the assignment.

#.  View the coding violations in Jenkins for the initial pull request.
    Identify the problem in the code using details given in the *Concepts
    and Terms* guide. Make corrections locally, ``add``, ``commit``, and
    ``push`` those changes to your upstream repository.

.. _Python 2.7: https://www.python.org/download/releases/2.7/
.. _Git: http://git-scm.com/
.. _GitHub: https://github.com/
.. _GitHub Profile: https://github.com/settings/profile
.. _GitHub E-Mail Settings: https://github.com/settings/emails
.. _assignment repository: https://github.com/is210-2014-fall-02/lesson_01
.. _reStructuredText: http://docutils.sourceforge.net/rst.html
