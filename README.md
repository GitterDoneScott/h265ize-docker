# h265ize

A [Docker](http://docker.com) image for [h265ize](https://github.com/FallingSnow/h265ize), to make it easy to convert videos to h.265.

## Getting Started

```sh
docker run \
  --name h265ize \
  --rm
  -u <UID> \
  -v </location/to/video/files/input>:/input \
  -v </location/to/video/files/output>:/output \
  gitterdone/h265ize
```

Replace `<UID>` with your user's ID, you can get this by running `id -u`, e.g. `-u 1002 `.

This is to make sure the container can read/write your input and output directories.

#### How does it work?

It will convert to h.265 any files already in the input folder (recursively) when the docker container is started.

## Optional parameters

-e SOURCE_FILE="Welcome.mp4" to encode a single file

You can add your own parameters to the end of the run statement.

#### Set quality

For example, you may want to change the default quality from 19 to 25 (higher number = lower quality/smaller file)

```sh
docker run \
  --name h265ize \
  --rm
  -u <UID> \
  -v </location/to/video/files/input>:/input \
  -v </location/to/video/files/output>:/output \
  gitterdone/h265ize -25
```
Note the `-q 25` added after `gitterdonescott/h265ize`.

You can add any of the options mentioned on the [official h265ize GitHub page](https://github.com/FallingSnow/h265ize#options) after the image name.

#### Paths in container

Note: They can be the same

Directory where video files are you want to convert to h.265: `/input`

Directory where converted h.265 videos will be created: `/output`


#### Versions

11/30/2018 - initial build.

----

Please feel free to leave a comment if you have any questions.
