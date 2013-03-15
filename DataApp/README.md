This app has the following components:
======================================
    Models:
      User: This is the default devise user for future use.
      YelpUser: This is the user object imported from the Yelp dataset.
      Review: This is the review object imported from Yelp dataset.
      Business: See above.
      Vote: This is a vote object which basically contains three numbers corresponding to the number of times the user/review was voted to be cool/funny/useful.
    Relationships:
      User has one vote, has many reviews
      Review has one vote, belongs to users and businesses
      Business has many reviews
    Database:
      Currently using an instance of MySQL5.5 running on Amazon RDS.
Installation: Two ways
======================
    RVM is much better if you ever want to work with ruby in the future, but the installation process might cause problems, so the second way is a lot shorter time-wise.

    1. Install rvm at https://rvm.io/rvm/install/
       and then run 
        `$ rvm install 1.9.2
        $ rvm use 1.9.2
        $ sudo apt-get install mysql-client libmysql-ruby1.9.1 libmysqlclient-dev libsqlite3-dev libsqlite3-ruby1.9.1 
        $ gem install rails --include-dependencies --no-ri --no-rdoc
        $ cd DataApp && bundle install`
    2. If you have ruby1.8 installed, 
        `$ sudo apt-get purge ruby1.8
        $ sudo apt-get install ruby1.9.3
        $ sudo apt-get install mysql-client libmysql-ruby1.9.1 libmysqlclient-dev libsqlite3-dev libsqlite3-ruby1.9.1 
        $ gem install rails --include-dependencies --no-ri --no-rdoc
        $cd DataApp && bundle install`
