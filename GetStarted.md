# Getting started

This is based of [this guide](https://guides.rubyonrails.org/getting_started.html),
and also uses [this](https://guides.rubyonrails.org/install_ruby_on_rails.html).

## Initial setup

First install ```ruby```, ```rails```, ```docker```, ```docker-buildx```, ```docker-compose```, and ```mysql```.

Then, clone the Casino repo.

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

The Docker daemon will need to be running to use Docker. Depending on your operating system, this will be different.

### MacOS

Install docker as a cask using

```sh
brew install --cask docker
```

If docker is installed, but not as a cask, remove it first, then install with the above command.

To run it, launch the docker GUI application, follow the setup steps, and make sure the docker icon is showing in the status bar.

### Linux and WSL

WSL users will need to enable systemd by adding

```txt
[boot]
systemd=true
```

to ```/etc/wsl.conf```, and rebooting.

The Docker daemon can be enabled with Systemd using

```sh
systemctl enable --now docker
```

or as a socket (to be run when needed, instead of at boot) with

```sh
systemctl enable --now docker.socket
```

## Database

To run the database on its own, use

```sh
docker compose up db
```

It can be run in the background using the ```-d``` flag. To stop it, use

```sh
docker compose stop db
```

## Web app

### Setup

Before running rails in development mode for the first time, gems need to be installed and the database needs to be generated. With the database set up and running, run

```sh
bin/bundle install
bin/rails db:create
bin/rails db:migrate
```

This will install all required gems from the Gemfile, create the databases, and run all migrations.

Also, whenever new migrations are added, you will need to apply them to your database (which needs to be running) with

```sh
bin/rails db:migrate
```

### mysql2 on Apple silicone (M1, M2, etc. chips)

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
docker compose build
```

### Running in production

The database and web app can be run together in production mode by running

```sh
docker compose up
```

or the web app can be run independently with

```sh
docker compose up web
```

Either can be run in the background using the ```-d``` flag, and then stopped with

```sh
docker compose stop
```

or

```sh
docker compose stop web
```

respectively.
