# serverless-template

## Introduction

//TBD

As this is a serverless application, the [Serverless Framework](https://serverless.com/) is used to derive and deploy a CloudFormation template based on the specified [serverless.yml](./serverless.yml).

You need to configure `serverless.yml` like setting "vpc", "iam", "s3bucket", and so on infra...to meet your requirement.

## Setup

1. Install [Node.js](https://nodejs.org/) and [Go](https://go.dev/).
2. On first checkout of the repo, you'll need to install and update all packages to ensure your application is initialized successfully.

        $ go mod tidy

        $ npm install

## Build
If you have built a zip file, remember to execute clean command before build to make sure that the build will be the latest version of your code.

    $ make clean

Execute make build command to build a zip file.

    $ make build

## Deploy
```
$ npm run serverless -- deploy --stage <stageName> --region <regionName>
```

### Test Deploy
![截圖 2023-07-09 下午2 26 23](https://github.com/Barney30818/serverless-template/assets/69409373/2c78a4c5-b85b-42ac-a744-a7c72d32b38d)
![截圖 2023-07-09 下午2 25 50](https://github.com/Barney30818/serverless-template/assets/69409373/8bd4564f-6aee-4b58-bc13-dce8b15a1101)
