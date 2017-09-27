# ngcli-docker
docker container with ng cli and the ability to run e2e tests

# Usage

## XVFB customizations
- Supports XVFB_DIMENSIONS env variable for configuring the window dimensions of the xvfb window. 
```
XVFB_DIMENSIONS = "1920x1080x24" #Default
```

## References
Based off of similar [project by Teracy](https://github.com/teracyhq/docker-files/tree/master/angular-cli)