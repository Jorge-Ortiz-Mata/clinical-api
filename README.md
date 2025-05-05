# SimplePractice Programming Test

The goal of the SimplePractice programming test is to evaluate the programming abilities
of candidates. The ideal candidate would know Ruby, JavaScript, or another language with
great proficiency, be familiar with basic database and HTTP API principles, and able to
write clean, maintainable code. This test gives candidates a chance to show these
abilities.

## Getting Your Environment Ready

You'll need a development computer with access to github.com. You'll also need to set up
Docker CE (https://www.docker.com/community-edition), which is free.

### 1. Setup your environment

Sample `Dockerfile` and `docker-compose.yml` files are included in this repo along with a
basic scaffolded Rails application. There is a `Makefile` included for your convenience 
that has sample commands for building and managing your application via the command line.

Please make sure you can bring up your app with `make up` well before the start of the
interview. You should be able to run the tests if the basic setup works.

```bash
$ make
$ make build
$ make dbcreate
$ make test
```

### 2. Populate the seeds file

Before your coding interview, populate the `db/seeds.rb` file according to its 
requirements: 

- There should be 10 doctors with unique names. 
- Each doctor should have 10 patients with unique names
- Each patient should have 10 appointments (5 in the past, 5 in the future)
- Each appointment should be 50 minutes in duration

Seed the database: 

```bash
make dbseed
```

**NOTE:** During the interview, if your seed file is not ready, your interview may have
to be rescheduled in order to provide adequate time for you to complete the other steps
in the coding exercise.

### FAQs

If you need to use generators with docker:

```bash
docker-compose run app bundle exec rails scaffold users
```

Or, alternatively, you can "ssh" into the container (to exit, type `exit` or `ctrl + d`)

```bash
$ make bash
$ bundle exec rails g scaffold users
```

**NOTE** since the generator runs inside of Docker (and this container runs as
the `root` user), you will need to change the permissions of the generated
files. The following command is added as a convenience and should be run after
generated files are created to avoid "write permission" failures.

```bash
sudo chown -R $USER .
```

OR

```bash
make chown
```

## Evaluation Criteria

When evaluating code, the following are among the factors considered:

* Does it run?
* Does it produce the correct output?
* How did _you_ gain confidence your submission is correct?
* Were appropriate algorithms and data structures chosen?
* Was it well written? Are the source code and algorithms implemented cleanly?
  Would we enjoy your code living along side our own?
* Is it slow? For small to medium sized inputs, the processing delay should
  probably not be noticeable.


## Jorge Section

- Update makefile commands from `docker-compose` to `docker compose`
- Add a new make command: `make dbreset`
- Comment first migration that creates the doctors appointment and move the logic to the second migration.
- Fix doctor uniqueness name issue on tests.
- Create service classes and tests for dev preparation.
