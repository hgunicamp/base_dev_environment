FROM docker.io/library/rust:1.88.0-alpine3.21

# Installing ZSH
RUN apk upgrade && apk add vim zsh zsh-syntax-highlighting meld git llvm lld clang19 make