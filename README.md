# Docker Image Transfer Action

This GitHub Action pulls a Docker image from a source registry and pushes it to a destination registry.

## Usage

Add the following step to your GitHub Actions workflow:

> [!NOTE]
> If you need to login to the registry first set these inputs:
> source_registry_username/destination_registry_username
> source_registry_password/destination_registry_password

```yml
- name: Transfer Docker image
  uses: alex289/docker-image-transfer-action
  with:
    source: 'docker.io/user/source-repo:tag'
    destination: 'docker.io/user/destination-repo:tag'
```

Replace `docker.io/user/source-repo:tag` and `docker.io/user/destination-repo:tag` with your source and destination Docker image repositories, respectively.

## Inputs

- `source`: The source Docker image repository (e.g.: `docker.io/user/source-repo:tag`). This input is required.
- `destination`: The destination Docker image repository (e.g.: `docker.io/user/destination-repo:tag`). This input is required.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/alex289/docker-image-transfer-action/blob/main/LICENSE) file for details.
