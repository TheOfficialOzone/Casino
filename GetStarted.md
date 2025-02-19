# Getting started

This is based of [this guide](https://guides.rubyonrails.org/getting_started.html),
and also uses [this](https://guides.rubyonrails.org/install_ruby_on_rails.html).

## Initial setup

First, clone the Casino repo. Then install the dependencies below.

### WSL

For WSL, install Docker Desktop on Windows, and run it. Ensure docker is available in WSL by running

```sh
docker --version
```

Then run

```sh
sudo apt install ruby libmysqlclient-dev
```

in a WSL terminal.

### Mac

On Mac, docker must be installed as a cask using:

```sh
brew install --cask docker
```

If docker is installed, but not as a cask, remove it first, then install with the above command.

Then install Ruby and MySQL with brew or a downloadable installer.

### Linux

On Linux (not WSL), install ```docker```, ```docker-buildx```, ```docker-compose```, ```ruby```, and ```mysql``` (or whatever packages provide them) with your system's package manager, and enable/start the Docker daemon.

### Environment

Inside the Casino folder, create a ```.env``` file with the following contents:

```sh
DB_DIR=/path/to/database
CASINO_DB_ROOT_PASSWORD=root_password
CASINO_DB_PASSWORD=prod_password
```

Change these values to something useful/secure.

```DB_DIR``` is a path to a folder that will contain the database files.

```CASINO_DB_ROOT_PASSWORD``` is the root password of the database.

```CASINO_DB_PASSWORD``` is the password used by the ```casino``` user in the production environment.

WARNING: You need these passwords to access your local database. Back up this file somewhere, just in case.

Also don't commit these passwords anywhere, they are meant to be secure.

## Running Docker

The Docker daemon will need to be running to use Docker. Ensure Docker is running, and confirm in the command line using:

```sh
docker --version
```

In WSL and Linux, docker needs to be run with ```sudo``` by default. If you don't want to use ```sudo``` every time, add your username to the ```docker``` group with:

```sh
sudo gpasswd -a <username> docker
```

## Database

To run the database on its own, use

```sh
docker-compose up db
```

It can be run in the background using the ```-d``` flag. To stop it, use

```sh
docker-compose stop db
```

## Web app

### Setup

Before running rails in development mode for the first time, gems need to be installed and the database needs to be generated. With the database set up and running, run

```sh
gem install rails
bin/bundle install
bin/rails db:create
bin/rails db:migrate
```

This will install all required gems from the Gemfile, create the databases, and run all migrations.

Also, whenever new migrations are added, you will need to apply them to your database (which needs to be running) with

```sh
bin/rails db:migrate
```

### If you get gem install errors (WSL/Linux)

If you get write permission errors, you might have to manually set the gem home with

```sh
export GEM_HOME=$HOME/.gem
```

This will need to be re-run every time a new terminal is opened.

If gems fail to build, you might need to install ```ruby-dev```, ```libyaml-dev```, and ```make``` with your system's package manager, and then install ```mail```, ```xpath``` and any other missing gems manually with ```gem```.

### If mysql2 fails to build on Apple silicone (M1, M2, etc. chips)

The ```mysql2``` gem is complicated to install on Apple hardware, and might cause the bundle install to fail. If that happens, first install ```openssl``` with brew, then install ```mysql2``` with this command:

```sh
gem install mysql2  -- --with-opt-dir=$(brew --prefix openssl) --with-ldflags=-L/opt/homebrew/opt/zstd/lib
```

Then try using bundle again. You may need to restart your system.

### Running the web app

To run the app in development mode, use

```sh
bin/rails server
```

Note that the database must be running for this to work properly.

## Production

### Building

To build the web app, run

```sh
docker-compose build
```

### Running in production

The database and web app can be run together in production mode by running

```sh
docker-compose up
```

or the web app can be run independently with

```sh
docker-compose up web
```

Either can be run in the background using the ```-d``` flag, and then stopped with

```sh
docker-compose stop
```

or

```sh
docker-compose stop web
```

respectively.
