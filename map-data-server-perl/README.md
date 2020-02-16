# Map Data Server (Perl)


## Build & Develop
### Build
```
docker build --rm=false -t map_data_servrer_perl .
```

### Develop
This will start the container and drop you at a Bash prompt:
```
docker run -it --rm --name my_map_data_servrer_perl --network host map_data_servrer_perl /bin/bash
```

To get share pertinent files between host and container:

```
docker run -it --rm --name my_map_data_servrer_perl --network host -v $(pwd)/code:/code map_data_servrer_perl /bin/bash
```

## Run
Run the container - it'll emit one record each time a connection is made:

```
docker run -it --rm --name my_map_data_servrer_perl --network host map_data_servrer_perl
```

Run *in* the container. Choose your favorite way from the `Build & Develop` section and once at the command prompt run:

```
perl map_server.pl
```