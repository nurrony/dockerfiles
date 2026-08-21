# 🐳 Dockerfiles

A collection of custom and customized Container images maintained by [Nur M. Rony](https://github.com/nurrony).

This repository contains Dockerfiles and supporting configuration used to build development, application, and utility containers.

## Available Images

| Image | Description |
|---|---|
| [`alpine-mongo`](./alpine-mongo) | Lightweight MongoDB image based on Alpine Linux |
| [`awscli`](./awscli) | AWS CLI and AWS Elastic Beanstalk CLI container |
| [`maven`](./maven) | Maven build environment with Amazon Corretto |
| [`php`](./php) | PHP/Apache application images and development variants |

## Repository Structure

```text
.
├── alpine-mongo/
│   ├── Dockerfile
│   ├── entrypoint.sh
│   └── README.md
│
├── awscli/
│   ├── Dockerfile
│   ├── aws-commands.sh
│   ├── docker-entrypoint.sh
│   └── README.md
│
├── maven/
│   └── Dockerfile.maven38-amazoncorreto-17
│
└── php/
    ├── 7-apache/
    │   └── dev/
    ├── 8-apache/
    ├── legacy/
    └── test-app/

## Getting Started

Clone the repository:

```bash
git clone https://github.com/nmrony/dockerfiles.git
cd dockerfiles
```

## 🔧 Building

Each image is independently buildable.

General pattern:

```bash
docker build -t <image-name>:<tag> <directory>
```

Examples:

```bash
docker build -t nmrony/alpine-mongo:latest ./alpine-mongo

docker build -t nmrony/awscli:latest ./awscli
```
## Image Naming

Recommended naming convention:

nmrony/<image>:<tag>


Examples:

- nmrony/alpine-mongo:latest
- nmrony/awscli:latest
- nmrony/php:latest

## Security

Do not hard-code credentials, API keys, passwords, or other secrets into Dockerfiles or image layers.

For AWS credentials, prefer:

- AWS credential files
- Environment variables supplied at runtime
- IAM roles
- Docker or CI secret mechanisms

Avoid committing credentials to this repository.

##  Contributing

Contributions, improvements, fixes, and suggestions are welcome.

When adding a new image:

- Create a dedicated directory.
- Add the relevant Dockerfile.
- Add a README when the image requires special configuration.
- Document required environment variables.
- Include basic usage examples.
- Keep secrets and credentials out of the repository.
- Test the image before submitting changes.

## License

Unless a more specific license is provided in an individual image directory, refer to the repository and individual Dockerfile contents for applicable licensing information.
