# ngcli-docker
docker container with ng cli and the ability to run e2e tests

General Docker image for executing [ng-cli](https://github.com/angular/angular-cli) tasks including full support for ng e2e using xvfb with headless Google Chrome or Firefox. 

# Usage

## XVFB customizations
- Supports XVFB_DIMENSIONS env variable for configuring the window dimensions of the xvfb window. 
```
XVFB_DIMENSIONS = "1920x1080x24" #Default
```

##### Note: 
This image doesn't contain any project code, but is instead a tooling image to support any ng based project.

#### References
Based off of similar [project by Teracy](https://github.com/teracyhq/docker-files/tree/master/angular-cli)