FROM docker.io/library/rust:1.88.0-alpine3.21

# Installing ZSH
RUN apk upgrade && apk add vim zsh zsh-syntax-highlighting bash curl git lld clang19 make