# README

ArcadeNomad (http://arcadenomad.com) is the sample application used to
illustrate many of the concepts found in the book, "Easy Active Record for Rails
Developers" (http://easyactiverecord.com). It additionally serves double duty as
an application that I've long wanted to exist, providing an online repository
for tracking the location of so-called retro arcade games hidden within
laundromats, restaurants, skating rinks, gas stations, and bars. So if you'd
like to play a game of Space Invaders or Donkey Kong, be sure to check out
ArcadeNomad and browse the arcades near you!

## Installation

ArcadeNomad was built atop Rails 4.1.1 and Ruby 2.0. Because the book introduces
various Rails 4-specific concepts, ArcadeNomad is not backwards-compatible and
will not run on Rails 3.X. You should be using Rails 4 anyway.

Follow these steps to install and configure ArcadeNomad:

1. Install Ruby 2+ and a database such as MySQL, PostgreSQL, or SQLite

2. Unzip the ArcadeNomad zip file using your favorite utility.

3. Install the Project Gems

ArcadeNomad simply would not be possible without taking advantage of the many
fantastic open source gems, libraries and frameworks. To install the gems used
in the project, enter the ArcadeNomad project directory and execute the
following command:

$ bundle install

You'll need Bundler to run this command, so if it fails have a look at
http://bundler.io/.

Additionally, ArcadeNomad uses gmaps.js (http://hpneo.github.io/gmaps/) to ease
integration of Google Maps and Bootswatch (http://bootswatch.com/) to improve my
otherwise terrible design skills. These libraries are both released under the
MIT License, and copies of the license have been included in the files
gmaps_license.txt and bootswatch_license.txt, respectively.

4. Configure the config/database.yml File

Rails applications manage their database connection credentials in a file named
config/database.yml. Open this file and adjust the credentials to suit your
local configuration. If you don't know how to do this, read Chapter 1 and it
will all make sense.

5. Create Database and Load Seed Data

You can create your database and load the seed data I've included in the
download by executing the following command:

$ bundle exec rake db:seed

6. Run the server

Start the application by running the Rails server:

$ rails server

### License and Copyright

ArcadeNomad is the companion project to "Easy Active Record for Rails
Developers", although just for kicks I'll continue maintaining and improving the
ArcadeNomad code well after the book's release, and I'll always strive to make
these changes and improvements available to readers. You are free to use the
code for learning purposes, and certainly may modify it and integrate it into
your own projects, *however* please do not deploy the code base with the
ArcadeNomad name and logo onto a public server. Additionally, please do not post
the entire ArcadeNomad code to a public server such as GitHub. In the near
future I may make the ArcadeNomad repository available to readers in order to
facilitate bug fixes and other improvements, so stay tuned.

Please keep in mind the book, "Easy Active Record for Rails Developers" is
copyright 2014 William Jason Gilmore (me). I've put an extraordinary amount of
time and effort into this book, and plan on continuing to improve it for readers
well into the future.
