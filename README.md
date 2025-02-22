# HomeAutomation-config-template

This is a template for the configuration of the [HomeAutomation](https://github.com/JulianKahnert/HomeAutomation) project.
You will find more information about the system and architecture in the main repository.

## Setup

### Prerequisites

- Mac or iPhone/iPad that is turned on and runs the `HomeKitAdapterApp` in the foreground.
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

### Configuration

Use this template on GitHub to create a new (**private** !?) repository which contains your configuration files.
Have a look at the fowllowing files and customize them to your needs:

- `config/Automations.swift`
- `config/Devices.swift`
- `config/System.swift`

### Docker

Navigate to the root directory of your new repository (which contains the `docker-compose.yml`) and run the following commands:

```
# get the latest version of the HomeAutomation image
docker-compose pull

# start database (in background) and apply migrations
docker-compose up db -d
docker-compose run migrate

# start the rest of the system (e.g. HomeAutomation server)
docker-compose up -d

# if you want to stop the whole system, you can run
docker-compose down
```

### HomeKitAdapterApp

The server needs the `HomeKitAdapterApp` to be running in foreground on a Mac or iPhone/iPad.
This ensures that the server gets informed about changes in the HomeKit system.

### Apply configuration

After the system is up and running, you can apply the configuration by running the following command:

```bash
swift run
```
