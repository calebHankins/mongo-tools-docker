# Docker Files To Build calebHankins's mongo-tools Fork

![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/calebhankins/mongo-tools.svg?style=flat-square)
![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/calebhankins/mongo-tools.svg?style=flat-square)

This repo builds the [calebHankins/mongo-tools](https://github.com/calebHankins/mongo-tools) fork that implements these changes:
- [TOOLS-1954 enhanced csv array notation](https://github.com/mongodb/mongo-tools/pull/110)
- [TOOLS-1956 Add Bulk Upsert and Remove Modes and increase batch size limit](https://github.com/mongodb/mongo-tools/pull/111)

## Build

Run these commands from the same folder as this readme. Tweak the Dockerfile to meet your needs.

```bash
docker build --rm -f "Dockerfile" -t mongo-tools:latest .
```

## Using The Mongo Tool Suite From Docker

```bash
# Start the container 
docker run --rm -it mongo-tools:latest

# Default behavior will put you in a dir with the bin mongo-tools
/mongo-tools # ls
bsondump      mongodump     mongoexport   mongofiles    mongoimport   mongorestore  mongostat     mongotop

```

If you know which tool you want, you can override the default entry point and run that tool directly

```bash
# Run mongoimport --help
docker run --entrypoint "/mongo-tools/mongoimport" mongo-tools:latest --help
```