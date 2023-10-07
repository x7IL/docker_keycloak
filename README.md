```
██╗  ██╗███████╗██╗   ██╗ ██████╗██╗      ██████╗  █████╗ ██╗  ██╗    ██████╗  ██████╗  ██████╗██╗  ██╗███████╗██████╗ 
██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔════╝██║     ██╔═══██╗██╔══██╗██║ ██╔╝    ██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗
█████╔╝ █████╗   ╚████╔╝ ██║     ██║     ██║   ██║███████║█████╔╝     ██║  ██║██║   ██║██║     █████╔╝ █████╗  ██████╔╝
██╔═██╗ ██╔══╝    ╚██╔╝  ██║     ██║     ██║   ██║██╔══██║██╔═██╗     ██║  ██║██║   ██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗
██║  ██╗███████╗   ██║   ╚██████╗███████╗╚██████╔╝██║  ██║██║  ██╗    ██████╔╝╚██████╔╝╚██████╗██║  ██╗███████╗██║  ██║
╚═╝  ╚═╝╚══════╝   ╚═╝    ╚═════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝                                                                                                                       
```

# Docker Setup Instructions

Follow these steps to build and run the Docker container for the application.
## Prerequisites:

- **Docker**:Ensure Docker is installed on your system. If not, follow the official installation instructions [here](https://docs.docker.com/engine/install/).
- A terminal or command-line interface

## Building the Docker Image:

Navigate to the scripts directory:

```
cd scripts/
```

Make the build script executable:
```
chmod +x build_dev.sh
```

Run the build script:
```
./build_dev.sh
```
## Running the Docker Container:

Make the run script executable:
```
chmod +x run_dev.sh
```

Run the script:
```
./run_dev.sh
```

_**Note**: If you want to modify the default settings (URL, username, and password), you can do so by editing the appropriate variables or arguments within the .env._
## Accessing the Application:

Once the Docker container is running, you can access the application via your web browser:

> URL: http://localhost:8080
> 
> Username: admin
> 
> Password: admin