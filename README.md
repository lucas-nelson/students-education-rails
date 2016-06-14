# students-education-rails

A coding challenge to model students, teachers, lessons and students completing lessons in parts.

Solution is a web site backed by a Rails server.

## Running example

https://students-education-rails.herokuapp.com/

## Setup

### Prerequsites

A version of Ruby supported by Rails 5.0.0rc1. Ruby `2.3.1` during development.

### Installation

1. clone this repository, then chang into the new directory
2. install the required gems:

       bundle

3. create and seed the database

       bundle exec rails db:setup

### Run the server

    bundle exec rails s

The site will be available at http://localhost:3000

### Test suite

    bundle exec spec

### Static code analysis

    bundle exec rubocop

## The challenge

### Coding Project

_Company X_ is developing a new app for student education. Students complete lessons and their progress is recorded.
Each lesson has 3 parts - 1, 2 and 3. There are 100 lessons in total.

#### Part 1

Generate a rails app that persists students and their progress.

Define routes for:

1.  setting a student's progress - progress should consist of a lesson and part number.
2.  returning a JSON representation of a student and their associated progress.

#### Part 2

Teachers have classes containing number of students.

1.  Add a teacher model that is related to students
2.  Create a reports page for a teacher to view progress all of their students.

#### Part 3

Calculating progress

1. add a method for updating student progress - this should verify that the student is only able to complete the next
   part number in sequence e.g.
   L1 P1, L1 P2, L1 P3, L2 P1, L2 P2 etc

## The result

### Part 1 / (1.)

1. Tap `Students` in the top nav
2. Tap a student in the list
3. Tap `Set progress`
4. You can enter a lesson number between 1 and 100 and a part between 1 and 3
5. Tap Save
6. Observe the student's progress has been updated

### Part 1 / (2.)

1. Request using curl:

       curl https://students-education-rails.herokuapp.com/students/1.json

2. Observe the result:

>     {"student":{"id":1,
>                 "email":"bart_simpson@example.net",
>                 "name":"Bart Simpson",
>                 "created_at":"2016-06-14T05:46:44.581Z",
>                 "updated_at":"2016-06-14T05:46:44.581Z",
>                 "school_class_id":1},
>      "progress":{}}

And for a student with progress:

       curl https://students-education-rails.herokuapp.com/students/2.json

>     {"student":{"id":2,
>                 "email":"lisa_simpson@example.net",
>                 "name":"Lisa Simpson",
>                 "created_at":"2016-06-14T05:46:48.045Z",
>                 "updated_at":"2016-06-14T05:46:48.045Z",
>                 "school_class_id":2},
>      "progress":{"lesson":100,
>                  "part":3}}

### Part 2 / (1.)

1. Tap `Teachers` in the top nav
2. Tap a teacher in the list
3. Tap `Students taught`
4. Observe a list of students being taught by this teacher

### Part 2 / (2.)

(Solution is on the same page as the prior section)

1. Tap `Teachers` in the top nav
2. Tap a teacher in the list
3. Tap `Students taught`
4. Observe the progress of those students (down the right-hand-side)

### Part 3 / (1.)

(Solution is at the same place as Part 1 / (1.))

1. Tap `Students` in the top nav
2. Tap a student in the list
3. Tap `Set progress`
4. Enter a lesson or part number
5. Tap Save
6. Observe an error message

## Further discussion

My first pass at this exercise was to create a Rails 5 API app that communicated _json-api_ messages back and forth.
The API side is complete and available on [github](https://github.com/lucas-nelson/students-education-api) as another
example of my work. Building the new API stuff took longer than I expected and I ran short of time to implement an
Ember front-end to it. Hence this repository (I started here by copying the models and schema from the v0.3 tag of
the API repo).

More detail of the process I went through in the
[README.md](https://github.com/lucas-nelson/students-education-api/blob/master/README.md#interpretation-of-the-problem)
in that repository.
