# Docker Build
You can build the firmware in a docker container. This keeps the local system clean :)

```
docker build -t site-ffww-build --build-arg uid=$UID .
docker run --name site-ffww-build --rm -v /path/to/site-ffww:/opt/site-ffww:delegated site-ffww-build -v <version_string>
docker logs -f site-ffww-build
```

See some build parameters (eg. target and parallel make threads) in [build.sh](build.sh) or ``build.sh --help``  
Remove --rm to persist the container after exit to review logs.