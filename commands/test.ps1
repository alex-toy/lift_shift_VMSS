$tag = "mytag2"
$image = "myimage2"
# $test = "mytag2:myimage2"
# docker tag ${DockerImageName}:${DockerImageTag} ${CRName}.azurecr.io/${image}:$tag
docker tag ${DockerImageName}:${DockerImageTag} ${CRName}${container}${image}:${tag}
# docker tag ${DockerImageName}:${DockerImageTag} ${CRName}.azurecr.io/${test}


$container = ".azurecr.io/"
docker tag ${DockerImageName}:${DockerImageTag} ${CRName}${container}${DockerImageName}:${DockerImageTag}