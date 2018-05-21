### README

# BattleShift

This project was a brownfield project where we were given a codebase that included a lot of dead and useless code intermixed into still useful classes and methods.  Our job, given a spec harness was to add functionality and begin refactoring the parts of the code necessary to make the spec harness pass within the time allocated by the project deadline.

For Information on the SPEC HARNESS, please visit:<br>
[Turing School BattleShift Spec Harness](https://github.com/turingschool-examples/battleshift_spec_harness)

For Information on the Technical Specifications for the Project:<br>
[Turing School BattleShift Project](http://backend.turing.io/module3/projects/battleshift)

### Table Of Contents
- [Versions/Prerequisites](#versions-prerequisites)
- [Setup](#setup)
- [Database](#database)
- [The Test Suite](#the-test-suite)
- [Spinning Up A Server](#spinning-up-a-server)
- [Authors](#authors)

### Versions/Prerequisites
---
##### Main:
To Install and run this application please be aware of the following versions and requirements:
- PostgreSQL 10+
- Rails 5+
- Ruby 2.4+

###### Secondary:
- ActiveRecord
- ActiveModelSerializers
- PG
- Puma

### Setup
---
- First clone down this repository and change directory into the project directory:
```
git clone https://github.com/nergdnvlt/battleshift.git
cd battleshift
```
- Then in your command line run bundle to install the gem dependencies:
```
bundle
```
- Now setup your database and run the migrations to properly set up your database tables:
```
rake db:create
rake db:migrate
```
- It's now time to seed the database with the supplied Etsy-like data:
```
rake build:users
```
- At this point the project is set up. From here you have several options.

- This will give you access to two users. You will have to store their email and api_key attributes to run the spec harness.

- In the command line, enter rails console
```
rails c
```
And find the two users:
```
User.all
```
Take the api_keys for each user and substitute them in for the <API-KEY> values here:
```
export BATTLESHIFT_API_KEY=<API-KEY>
export BATTLESHIFT_EMAIL=test1@test.com
export BATTLESHIFT_OPPONENT_API_KEY=<API-KEY>
export BATTLESHIFT_OPPONENT_EMAIL=test2@test.com
```
Keep these values close by, you will need them to run the spec harness.


<br>

### The Test Suite
---

#### Test Information

##### Test Suite Components:

###### Gems

- DatabaseCleaner
- FactoryBot
- Rspec
- ShouldaMatchers

###### Approaches

- Doubles
- Factories

#### Test Documentation and Tweaks

- For additional documentation and the individual tests as the suite runs:
```
--format=documentation
```
- Additional Useful Flags:
```
--order=random
--color
```

##### About The Tests:
 The test suite includes test for the following:
- Model Level Testing<br>
These tests can be found in the following folder:
```
spec/models/
```
- Request Testing<br>
These tests can be found in the following folders:
```
spec/requests/api/v1/games
```
These test test the following categories of endpoints: Model, Relationship, and Business Intelligence.

##### Running The Suite:
- In order to run the test suite, from the root project folder simply run:
```
rspec
```

<br>

### Running the Spec Harness
---

#### Spin up a Server:
- First in the root project folder, spin up your server:
```
rails s
```
<br>

#### Clone down the Spec Harness:

- First open another tab in your command line tool.

- Git clone the spec harness into a folder at the same level as the root of the BattleShift project folder:
```
git clone https://github.com/turingschool-examples/battleshift_spec_harness
```
```
- Main Project Folder
  |_ battleshift
      |_app
      |_bin
      |_config
      |_...
  |_ battleshift_spec_harness
      |_spec
      |_...
```

- Change directory into the battleshift_spec_harness folder

```
cd battleshift_spec_harness
```

#### Export the environment variables:

- In the command line tab copy and paste the export variables.
```
export BATTLESHIFT_API_KEY=<API-KEY>
export BATTLESHIFT_EMAIL=test1@test.com
export BATTLESHIFT_OPPONENT_API_KEY=<API-KEY>
export BATTLESHIFT_OPPONENT_EMAIL=test2@test.com
```

#### Running the harness:

- With the server still running in the tab at the root of the project folder, in the other tab (where you're at the root of the spec harness) run:
```
rspec
```


<br>

### Authors
- [Kelly Schroeder](https://github.com/anubiskhan)
- [Tyler Lundgren](https://github.com/nergdnvlt)
