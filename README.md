Buddysystem
===========

Software to bring local and foreign students together and create friendships
all over the world.

This system is used by some Erasmus Student Union (ESN) Sections to let local
and incoming foreign students sign up and be mixed together to so-called buddy
groups. All user interaction happens through the web interface and by email
notifications.

License: not yet decided.

Authors: Martijn Sack, Michael May

Maintainer: Claudio Harringer <claudio@buddynetwork.at>

Disclaimer: Here, maintainer is defined as someone who is running this system,
but not involved in development. I just put it here on github
hoping that someone sees it and starts developing :)

Roadmap
-------

Where to find configuration? -> ./config.php

Where to find text templates? -> ./actions/templates/\*.tpl

Which libraries are used?

* Smarty (template lib)
* some DAO (database abstraction)

What patterns are in the code?

* MVC. M is in ./dao/, V is ./actions/templates/, C is ./actions/

What's all not yet in this repository?
-> All personal stuff like templates and configs. See .gitignore.

How to start developing? -> Well, that's not 100% easy:

* Setup a mysql database.
* Copy ./config.php.example to ./config.php and set your local config,
  same for ./email/Mailer.php and js/calendar/calendar\_eu.js and all the
  templates, i.e. ./actions/templates/\*.tpl
* Have a look for the word "example" in each template and replace it.
* Fill some data in your database. Or just ask the maintainer for help.
* Setup a small email server.
* Use test email addresses or code yourself some development mode.
* Yeah, now start playing around and developing!

Feature requests
----------------
(as user stories)

User Alice wants to create, **modify** and safe a group assignment set
in order to take care of individual whishes
and optimize the assignment manually.

* IN: move a person to another group
* IN: remove a person from the match proposal
* IN: see the name, date and some info about each person
* OUT: eye-candy and nice interface; maybe text-only, just has to do the job

User Alice wants to list incomings ordered by arrival date
in order to get an overview when they arrive.

User Steve wants to database in the background to be Sqlite
in order to copy and modify the database more easily
and to easily develop the software further.

User Spambot wants a captcha that prevents him from registration
in order to keep spam away from Alice.

User Steve wants to check whether sending emails works
so that he can make sure whether the emailing works.

User Louis and Ida want to receive all chat messages by email per default
in order to never miss anything even without checking the website.

User Alice wants to add comments to buddies
and wants to see these comments when creating groups
in order to be able to consider individual whishes of buddies.

Personas
---

Alice ... admin user

Steve ... sysadmin

Louis ... local buddy

Ida ... incoming exchange student

Spambot ... un-desirable guest
