FROM docker.io/alpine/git:v2.49.0

# Installing ZSH
RUN apk upgrade && apk add vim zsh zsh-syntax-highlighting meld
RUN addgroup gitremote && adduser -D gitremote -G gitremote
