# Copy and paste these functions in your ~/.bashrc or ~/.zshrc

aws(){
  docker run --rm --interactive \
    --tty \
    --name aws-cli \
    --volume $HOME/.aws:/.aws \
    --log-driver none \
    --user $(id -u):$(id -g) \
    --volume $PWD:/app \
    nmrony/awscli "$@"
}

eb(){
  docker run --rm --interactive \
    --tty \
    --name aws-eb-cli \
    --volume $HOME/.aws:/.aws \
    --log-driver none \
    --user $(id -u):$(id -g) \
    --volume $PWD:/app \
    nmrony/awscli eb "$@"
}