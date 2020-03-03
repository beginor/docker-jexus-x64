# Jexus x64 Pro (Standalone) in docker

## Version Info:

- Jexus x64 Pro (Standalone) 6.2.1.12
- debian:buster-slim

## Usage:

1. Get the image with command:

  ```sh
  docker pull beginor/jexus-x64:6.2.1.12
  ```

2. Prepare the directors for volumes:

  ```sh
  mkdir -p "$(pwd)/jexus/conf"
  mkdir -p "$(pwd)/jexus/www"
  mkdir -p "$(pwd)/jexus/log"
  ```

3. Copy your website config file to `$(pwd)/jexus/conf` folder, Copy your websites to `$(pwd)/jexus/www` folder

4. Run the image with command:

  ```sh
  docker run \
      --detach \
      --name jexus \
      --restart unless-stopped \
      --publish 8080:80 \
      --volume $(pwd)/jexus/www:/var/www \
      --volume $(pwd)/jexus/conf:/usr/jexus/siteconf \
      --volume $(pwd)/jexus/log:/usr/jexus/log \
      beginor/jexus-x64:6.2.1.12
  ```

5. Then browse [http://127.0.0.1:8080/info](http://127.0.0.1:8080/info) with your faverite borwser, see what happens.

> You can change the port 8080 as your like.
