# Base Development Environment

Welcome to the Base Development Environment.
Its intention is to provide a controllable and isolated environment to develop my personal projects, avoiding compromising the machine with several versions of libraries and programs.
It uses the [Kubernetes](https://kubernetes.io/), [Kind](https://kind.sigs.k8s.io/) along with a container driver (Ex. [Podman](https://podman.io/)) to create a fully containerized environment with all necessary tools.

Then, it is possible to create highly customizable applications containers and CLIs.
By default, three containers will be automatically created:
- [Gitea](https://hub.docker.com/r/gitea/gitea): To provide a base tool for project management.
- [SonarQube Community Edition](https://hub.docker.com/_/sonarqube): To analyze the quality of the produced code.
- [Git CLI](https://hub.docker.com/r/alpine/git): Base git shell to host the git configuration for each project.

These container are a good starting point for the majority of my projects. Any extra container might be included/removed based on your needs.

The initial folder structure follows below:

    \> tree 
    .
    ├── bin
    │   ├── .env                            # Default scripts environment variables.
    │   ├── 01-build-images.sh              # Script to build container images to be imported in the Kubernetes cluster.
    │   ├── 02-create-cluster.sh            # Create the main Kubernetes cluster.
    │   ├── connect-cluster.sh              # Access the internal shell inside the Kubernetes cluster.
    │   ├── connect-git-cli.sh              # Access a shell inside the Git CLI.
    │   ├── delete-cluster.sh               # Disable/Delete  a running Kubernetes cluster.
    │   └── delete-images.sh                # Clear the previously container images locally created.
    ├── cli_homes                           # Home for any necessary CLI $HOME directory.
    │   └── git_home                        # Default $HOME to Git CLI. Responsible to host and default ".gitconfig" and SSL keys.
            └── .ssh
    ├── images
    │   ├── build                           # Host the locally created container images.
    │   ├── dockerfiles                     # Host the building files for the images.
    │   │   └── git_cli.dockerfile
    │   └── README.md
    ├── k8s                                 # Host the configuration files responsible for the cluster.
    │   ├── git_cli_pod.yaml
    │   ├── gitea_server_pod.yaml
    │   ├── gitea_server_service.yaml
    │   ├── kind_cluster.yaml
    │   ├── sonarqube_server_pod.yaml
    │   └── sonarqube_server_service.yaml
    ├── Progs                              # Host any necessary third part software.
    ├── projects_home                      # Host individual projects folders
    └── storage_homes                      # Provides storage mounting paths to the Kubernetes cluster.
        ├── gitea
        │   ├── config
        │   └── data
        └── sonarqube
            ├── data
            ├── extensions
            └── logs