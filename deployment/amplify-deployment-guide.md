# Deployment setup guide

## AWS-exports.js file

### How to get them

The below commands to get `aws-exports.js` file to your local environment. We don't need to run it periodly.

For production environment:
```bash
aws-vault exec Access-Management---Production.Developer -- amplify pull --appId d2velarxxj77y7 --envName main
```

For staging environment:
```bash
amplify pull --appId d29ymkciq0olny --envName staging
```

### How to apply to Amplify pipeline

The frontend application [requires `src/aws-exports.js` configuration file](https://github.com/envato/team-idc-app/blob/70ee26ba2fb85b17043a24674974cad5040f6e13/src/App.js#L8) for code building. In our local environment, we can simply run below commands to pull that file but on AWS Amplify CI/CD pipeline, we cannot do that even if we change the settings as their suggestion: https://docs.aws.amazon.com/amplify/latest/userguide/amplify-config-autogeneration.html

So to allow staging / production to be able to build on Amplify, we must have a workaround for the build step:
1. We get all `aws-exports.js` files of all environments, put into `deployment/` and named them like `aws-exports.<env-name>.js`.
1. When the application is built on Amplify, we can run `cp` command to place it into `src/`. This can be set in Amplify console > Hosting > Build settings (at `frontend.phases.preBuild.commands` in `build.yml`)

    ```bash
    cp deployment/aws-exports.$AWS_BRANCH.js src/aws-exports.js
    ```

    [`AWS_BRANCH`](https://docs.aws.amazon.com/amplify/latest/userguide/environment-variables.html#:~:text=abcd1234-,AWS_BRANCH,-The%20branch%20name) is predefined environment variables supported by AWS Amplify.
