# Docker Build
You can build the firmware in a docker container. This keeps the local system clean :)

```
docker build . 
docker run --name site-ffww-build -t -i -v /repo/path/site-ffww:/opt/site-ffww:delegated -v <version_string
docker logs -f site-ffww-build
```

See some build parameters (eg. target and parallel make threads) in [build.sh](build.sh) or ``build.sh --help``
