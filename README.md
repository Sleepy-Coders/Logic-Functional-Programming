Prolog Samples
==============

This project is made for collaborating on Prolog language projects that should be completed during a functional programing course in Lviv National University.

Genealogy
---------

**engine** directory has modules that contain procedures witch should work with data that is located in the data files located at the **genealogy** directory. `engine/main.pl` contains the most common and important procedures, while the other modules have some specific stuff.
To successfully run an app with your own datasource, use `engine/main.pl` and other modules in your datasource file. Make sure to disable some predicates when adding more than one module, because there is a lot of intersecting stuff. 

`demo.pl` and `demo2.pl` have a dummy-data with fictional people.

Monkey Room
-----------

The `monkeyroom` directory contains the solution for the next problem:

>There is a monkey at the door into a room. In the middle of the room a banana is hanging from the ceiling. The monkey is hungry and wants to get the banana, but he cannot stretch high enough from the floor. At the window of the room there is a box the monkey may use.