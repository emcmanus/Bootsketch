Bootsketch
================

Clone this repository to quickly start sketching with bootstrap.

Includes jquery and bootstrap with the [lumen](http://bootswatch.com/lumen/) theme.

Run `grunt` to spin up a static web server. Changes to `src` propagate to the browser using livereload.

#### Setup (Fish Shell)

    set -x YourProjectName ChangeMe
    git clone git@github.com:emcmanus/Bootsketch.git $YourProjectName
    cd $YourProjectName
    npm install
    bower install
    grunt
    open http://localhost:8000
    rm README.md
    git remote rm origin

#### Files

    /src/index.html
    /src/js/index.coffee
