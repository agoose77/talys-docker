# TALYS docker image

TALYS is a nuclear reaction code developed by A. Koning et al. 

This is a Docker container for TALYS 1.95: 
https://tendl.web.psi.ch/tendl_2019/talys.html

## Getting started
To create the Docker image: 
1. Download [TALYS](https://tendl.web.psi.ch/tendl_2021/talys.html) in the working directory
2. Build from the Dockerfile
   ```
   git build -t talys .
   ```

To run the container interactively run: 
```
docker run -it talys
```

This will load the container, placed inside the `~/test` folder. To run the test calculation run: 
```
talys <input> output
```
This calculation should take <5 seconds. To confirm the calculation has run correctly, the output file's last line will say `The TALYS team congratulates you with this successful calculation.`

## Future alterations 
The container image is currently in a primitive state. Volumes will be added to enable data transfer between the container and the host. 
