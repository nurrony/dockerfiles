# Copy and paste these functions in your ~/.bashrc or ~/.zshrc

aws() {
  docker run --rm \
  -it \
  --name aws-cli \
  --volume $HOME/.aws:/root/.aws \
  --user $(id -u):$(id -g) \
  nmrony/awscli "$@"
}

eb() {
  docker run --rm \
    -t $(tty &>/dev/null && echo "-i") \
    --user $(id -u):$(id -g) \
    -v "$(pwd):/app" \
    -v "${HOME}/.aws:/root/.aws" \
    -v "${HOME}/.ssh:/root/.ssh" \
    nmrony/awscli eb "$@"
}