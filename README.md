# ngcli-docker
docker container with ng cli and the ability to run e2e tests

General Docker image for executing [ng-cli](https://github.com/angular/angular-cli) tasks including full support for running tests (ng test or ng e2e) using [headless Google Chrome](https://developers.google.com/web/updates/2017/04/headless-chrome).

# Usage
## Karma
To use this with Karma update your karma.conf.js file as below.  Ensure you use the --no-sandbox flag for chrome as it's required when running in a docker container.  Make sure you are using karma-chrome-launcher > 2.1.0

karma.conf.js
```
module.exports = function(config) {
  ...
  config.set({
    plugins: [
        require('karma-chrome-launcher'),
    ],
    browsers: ['MyHeadlessChrome'],
    customLaunchers: {
        MyHeadlessChrome: {
            base: 'ChromeHeadless',
            flags: ['--no-sandbox']
        }
    },
  }
};
```

Reference:
- https://developers.google.com/web/updates/2017/06/headless-karma-mocha-chai

## Protractor
To use this with protractor update your protractor.conf.js as below.


```
exports.config = {
    ...
    capabilities: {
        'browserName': 'chrome',
        chromeOptions: {
            args: ["--headless", "--disable-gpu", "--window-size=1920,1080", "--no-sandbox"]
        }
    },
    ...

```

---
### Note: 
This image doesn't contain any project code, but is instead a tooling image to support any ng based project.

### Versions:
- Chrome:
- ng-cli: 1.7.4
- node: 10


### References
- https://developers.google.com/web/updates/2017/06/headless-karma-mocha-chai
