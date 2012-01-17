This project is made for collaboration on logical and functional programing projects that should be completed during a course of **Logical and Functional Programming** in Lviv National University.

Prolog
==============

Directory containing some solutions in Prolog logical programing language for different tasks: 

Genealogy
---------

**engine** directory has modules that contain procedures witch should work with data that is located in the data files located at the **genealogy** directory. `engine/main.pl` contains the most common and important procedures, while the other modules have some specific stuff.
To successfully run an app with your own datasource, use `engine/main.pl` and other modules in your datasource file. Make sure to disable some predicates when adding more than one module, because there is a lot of intersecting stuff. 

`demo.pl` and `demo2.pl` have a dummy-data with fictional people.

State Tasks
-----------

The `stateTasks` directory contains the solution for the state puzzles like **Monkey & banana** and **Wolf, goat, cabbage**.

Database
--------

**dataBase** directory contains tasks that have some data written in prolog relations, and some functions to interact with it. Data-files themselves are stored in subdirectory **db**.

featsOfStrength
---------------

Contains some special stuff that's almost impossible to accolplish ;)

**nonogram** directory contains a nonogram (japanese cross-word) solver.
You can read more about how the nonogram solver works on the Sleepy Coders blog:

 * [Part 1](http://sleepycoders.blogspot.com/2011/10/nonogram-solver-in-prolog-generating.html)
 * [Part 2](http://sleepycoders.blogspot.com/2011/10/nonogram-solver-in-prolog-combinations.html)

Lisp
====

This dir contains some basik tasks for getting a hand on lisp. 

binarySearchTree
----------------

An implementation of a tree data structure with search functions.

simpleTasks
-----------

Contains some basic tasks solutions. Name of the file is the number of the task. The task itself is at the begining of the file with code as the comment *(in ukrainian)*. 

Files ending with `.TestData.txt` are the data files needed by the `.lisp` files with the same name.

Erlang
======

Directory has some basic stuff coded in Erlang. The tasks are the same as for lisp and the implementation has some API that solves a task itself as well as client-server support.