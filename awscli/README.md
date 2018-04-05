AWS CLI with all Standalone CLI
================================
This Docker image includes AWS CLI and AWS Elastic Beanstalk CLI. It will bundle all available standalone AWS
CLI. If no command is provided then it will fallback to default AWS CLI

Available Commands
==================
- aws
- eb

Available Envrionment Variable
==============================
- AWS_DEFAULT_REGION
- AMAZON_ACCESS_KEY_ID
- AMAZON_SECRET_ACCESS_KEY

How to use it?
==============
To use the AWS CLI run docker container as follows

#### AWS CLI

```sh
docker run --rm --interactive \
  --tty --name aws-cli \
  --volume $HOME/.aws:/root/.aws \
  nmrony/awscli [configure | iam | s3 | ...]
```

#### EB CLI

```sh
docker run --rm --interactive --tty --name eb-cli \
  --volume $HOME/.aws:/root/.aws \
  --volume $PWD:/app \
  nmrony/awscli eb [init | create | ...]
```

By default, `eb` command runs as `root` inside the container. This can lead to permission issues on your host filesystem. You can run `eb` as your local user as follows

```sh
docker run --rm --interactive --tty --name eb-cli \
  --volume $HOME/.aws:/root/.aws \
  --volume $PWD:/app \
  --user $(id -u):$(id -g) \
  nmrony/awscli eb [init | create | ...]
```

**There is a drop in command file `aws-commands.sh`. Copy and paste the contents in your shell configuration file i.e: ~/.bashrc, ~/.zshrc etc