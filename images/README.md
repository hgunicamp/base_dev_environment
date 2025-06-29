# Create Image:
```
podman -f <dockerfile_path> -t <image_name:version>
```
# Export Image:
```
podman save --format oci-archive -o <image_file.tar> <localhost/image_name:version>
```
# Import Image:
```
kind --name <cluster_name> load image-archive <path_to_oci_image_archive>
```
