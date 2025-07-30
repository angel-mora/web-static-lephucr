---
title: Docker service failed.
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary: "\U0001F64B **You:**  Job for docker.service failed because the control process
  exited with error code."
draft: false
---

# Docker service failed.

## ✅ TODOs
- [ ] ?

## 🧠 Full Chat

🙋 **You:**

Job for docker.service failed because the control process exited with error code.
See "systemctl status docker.service" and "journalctl -xeu docker.service" for details.

---

🤖 **Assistant:**

This error message suggests that the Docker service failed to start, and provides two commands you can use to investigate the issue further:

1. `systemctl status docker.service`: This command will display the status of the Docker service, including any error messages or log information. It may also provide suggestions for how to resolve the issue.

2. `journalctl -xeu docker.service`: This command will display the system log for the Docker service, including any error messages or stack traces. This can provide more detailed information about the issue and help you diagnose the problem.

Once you have identified the cause of the error, you can take appropriate steps to resolve it. Common causes of this error include misconfiguration of Docker settings, problems with the Docker daemon, or issues with the host system.

---

🙋 **You:**

Mar 05 15:37:33 sea systemd[1]: Failed to start Docker Application Container Engine.

---

🤖 **Assistant:**

This error message indicates that the Docker service was not able to start properly. There can be several reasons why this happened, and you'll need to investigate further to determine the root cause. Here are some things you can try:

1. Check the logs: Use the `journalctl` command to view the logs for the Docker service. You can use the following command to display the most recent logs:

   ```
   journalctl -xeu docker.service
   ```

   Look for any error messages or stack traces that might indicate what went wrong.

2. Check the Docker configuration: Make sure that the Docker configuration files are correct and that there are no syntax errors. You can use the `docker config` command to view and edit the Docker configuration.

3. Check for conflicting services: Make sure that there are no other services running on the same ports that Docker needs to use. Use the `lsof` command to see which processes are listening on which ports.

4. Check for resource constraints: Make sure that the host system has enough resources (CPU, memory, disk space) to run Docker. Use the `top` command to monitor system resource usage.

5. Restart Docker: Sometimes, simply restarting the Docker service can resolve the issue. Use the following command to restart the Docker service:

   ```
   systemctl restart docker.service
   ```

If none of these steps help you resolve the issue, you may need to seek additional help from the Docker community or a technical support team.

---

🙋 **You:**

░░ The job identifier is 2896 and the job result is failed.

---

🤖 **Assistant:**

This message indicates that a job with the identifier 2896 failed to complete successfully. The specific reason for the failure should be indicated elsewhere in the output, such as in a log file or error message. 

Depending on the type of job and the system where it was run, there may be different steps you can take to troubleshoot the issue. Here are some general tips:

1. Check the logs: Look for any error messages or stack traces that might indicate what went wrong. Depending on the system and job type, the logs may be located in different places, such as in a log file or displayed in the terminal output.

2. Check the job configuration: Make sure that the job is configured correctly and that there are no syntax errors or missing dependencies. Check the documentation for the job or system to make sure you're using the correct configuration options.

3. Check for resource constraints: Make sure that the host system has enough resources (CPU, memory, disk space) to run the job. Use the appropriate tools for your system to monitor resource usage.

4. Retry the job: Depending on the type of job, it may be possible to simply retry it to see if it completes successfully. Make sure to address any issues that caused the failure before retrying the job.

If you're still having trouble, you may need to seek additional help from the system administrator, technical support team, or online community.

---

🙋 **You:**

❯ systemctl status docker.service                                                                                                             ─╯
× docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; preset: disabled)
     Active: failed (Result: exit-code) since Sun 2023-03-05 15:39:38 CST; 3s ago
TriggeredBy: × docker.socket
       Docs: https://docs.docker.com
    Process: 121067 ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock (code=exited, status=1/FAILURE)
   Main PID: 121067 (code=exited, status=1/FAILURE)
        CPU: 351ms

Mar 05 15:39:38 sea systemd[1]: docker.service: Scheduled restart job, restart counter is at 3.
Mar 05 15:39:38 sea systemd[1]: Stopped Docker Application Container Engine.
Mar 05 15:39:38 sea systemd[1]: docker.service: Start request repeated too quickly.
Mar 05 15:39:38 sea systemd[1]: docker.service: Failed with result 'exit-code'.
Mar 05 15:39:38 sea systemd[1]: Failed to start Docker Application Container Engine.

---

🤖 **Assistant:**

Based on the output of `systemctl status docker.service`, it appears that the Docker service failed to start. The status shows that the service is "failed" with an "exit-code" result, and the log indicates that the `dockerd` process exited with a status of 1 (FAILURE).

Here are some steps you can try to resolve this issue:

1. Check the logs: Use the `journalctl` command to view the logs for the Docker service. You can use the following command to display the most recent logs:

   ```
   journalctl -xeu docker.service
   ```

   Look for any error messages or stack traces that might indicate what went wrong.

2. Check for conflicting services: Make sure that there are no other services running on the same ports that Docker needs to use. Use the `lsof` command to see which processes are listening on which ports.

3. Restart Docker: Sometimes, simply restarting the Docker service can resolve the issue. Use the following command to restart the Docker service:

   ```
   systemctl restart docker.service
   ```

4. Check the Docker configuration: Make sure that the Docker configuration files are correct and that there are no syntax errors. You can use the `docker config` command to view and edit the Docker configuration.

5. Update Docker: Make sure that you have the latest version of Docker installed. Use the appropriate package manager or installer for your system to update Docker to the latest version.

If none of these steps help you resolve the issue, you may need to seek additional help from the Docker community or a technical support team.

---

🙋 **You:**

ERRO[2023-03-05T15:48:24.097615413-06:00] [graphdriver] prior storage driver devicemapper is deprecated and will be removed in a future release; update the the daemon configuration and explicitly choose this storage driver to continue using it; visit https://docs.docker.com/go/storage-driver/ for more information

---

🤖 **Assistant:**

The error message indicates that the `devicemapper` storage driver, which was used by the Docker daemon, has been deprecated and will be removed in a future release. The message suggests updating the Docker daemon configuration to explicitly choose another storage driver.

To resolve this issue, you can follow these steps:

1. Edit the Docker daemon configuration file: You can use a text editor to open the Docker daemon configuration file. On most systems, the file is located at `/etc/docker/daemon.json`. If the file doesn't exist, you can create it.

2. Update the storage driver: In the configuration file, add a `"storage-driver"` key with the name of a supported storage driver. For example, you can use `"overlay2"` as the storage driver. The configuration file should look like this:

   ```
   {
       "storage-driver": "overlay2"
   }
   ```

3. Save and close the configuration file: After you've updated the configuration file, save it and close the text editor.

4. Restart the Docker daemon: Use the following command to restart the Docker daemon:

   ```
   sudo systemctl restart docker
   ```

   This will apply the new configuration and start the Docker daemon with the updated storage driver.

After following these steps, the `devicemapper` storage driver should no longer be used, and the error message should disappear. Note that if you're using Docker on a shared system or with other users, you may want to check with other users before making changes to the Docker daemon configuration.

---

🙋 **You:**

What is the fastest way to deploy a rails app with multiple docker containers within a docker-compose file? What is the cheapest one?

---

🤖 **Assistant:**

The fastest way to deploy a Rails app with multiple Docker containers within a Docker Compose file would be to use a cloud provider that offers a managed Kubernetes service such as Google Kubernetes Engine, Amazon Elastic Kubernetes Service or Microsoft Azure Kubernetes Service. These managed services provide a streamlined way to deploy containers in a clustered environment.

To deploy a Rails app with multiple containers using Docker Compose, you would need to:

1. Create a Docker Compose file that specifies the services for your Rails app and any supporting services such as a database, web server, and cache.

2. Build the Docker images for each service and push them to a container registry.

3. Deploy the containers using Docker Compose up.

4. Use a load balancer to distribute traffic to the containers.

The cheapest way to deploy a Rails app with multiple Docker containers would be to use a cloud provider such as DigitalOcean or Linode that offers a simple and affordable container hosting service. These providers allow you to create a Kubernetes cluster with a few clicks, and deploy containers using Kubernetes or Docker Compose.

Another option would be to use a Virtual Private Server (VPS) provider such as Vultr or OVH to create a server and deploy containers using Docker Compose. This approach is more hands-on but provides more control over the environment and can be more cost-effective than using a managed Kubernetes service.

---

🙋 **You:**

Give me a tutorial to deploy my docker-compose to digital ocean

---

🤖 **Assistant:**

Sure, here's a tutorial on how to deploy a Docker Compose project to DigitalOcean:

1. Create a DigitalOcean account: If you don't already have one, sign up for a DigitalOcean account at https://www.digitalocean.com/.

2. Create a Droplet: Once you've logged in, create a Droplet using the DigitalOcean web interface. Choose a Droplet plan that suits your needs and select a region where you want your Droplet to be located. For this tutorial, we will use Ubuntu 20.04 as the operating system for our Droplet.

3. SSH into the Droplet: Once the Droplet is created, SSH into it using a terminal program such as PuTTY or the built-in terminal on your computer. You will need the IP address of the Droplet and the root password that was provided in the email from DigitalOcean.

4. Install Docker and Docker Compose: In the terminal window, install Docker and Docker Compose on the Droplet using the following commands:

   ```
   sudo apt update
   sudo apt install docker.io docker-compose
   ```

5. Copy the Docker Compose project to the Droplet: Copy your Docker Compose project to the Droplet using the `scp` command. For example, if your Docker Compose project is in a directory called `myproject` on your local machine, and the IP address of the Droplet is `1.2.3.4`, you can copy the project to the Droplet using the following command:

   ```
   scp -r myproject/ root@1.2.3.4:/root/myproject/
   ```

   This will copy the `myproject` directory to the `/root` directory on the Droplet.

6. Start the containers: In the terminal window, navigate to the directory where your Docker Compose project is located on the Droplet. Then, use the following command to start the containers:

   ```
   sudo docker-compose up -d
   ```

   This will start the containers in detached mode, which means that they will run in the background.

7. Access the app: Once the containers are running, you can access your app by visiting the IP address of the Droplet in a web browser. If your app is a web app, it should be accessible at port 80.

That's it! You have now deployed your Docker Compose project to DigitalOcean. Note that this is a basic tutorial and there are many other considerations to take into account when deploying containers in production, such as security, scalability, and monitoring.

---

🙋 **You:**

Which would be easier, heroku or digital ocean?

---

🤖 **Assistant:**

Heroku and DigitalOcean are both excellent options for deploying applications, but they have different strengths and weaknesses depending on your needs.

Heroku is a cloud platform that provides a simple and easy-to-use deployment process. It abstracts away many of the complexities of infrastructure management, so you can focus on building and deploying your application. Heroku supports many programming languages and frameworks out of the box, and has a large ecosystem of add-ons and services that you can use to extend your application. Heroku also provides automatic scaling and monitoring of your application.

On the other hand, DigitalOcean is a cloud infrastructure provider that gives you more control over your infrastructure. With DigitalOcean, you get full root access to your virtual machines, which allows you to customize the infrastructure to your needs. DigitalOcean provides a simple and easy-to-use interface for creating and managing virtual machines, and supports a wide range of operating systems and applications. DigitalOcean also provides flexible pricing options that allow you to choose the resources you need for your application.

So, which one is easier to use depends on your level of experience and your specific needs. If you're looking for a simple and easy-to-use platform with automatic scaling and monitoring, Heroku may be the better option. If you need more control over your infrastructure and want to customize your infrastructure to your needs, DigitalOcean may be the better option.

---

🙋 **You:**

heroku container:push app returns No image to push but there is a docker and docker-compose

---

🤖 **Assistant:**

If the `heroku container:push app` command returns `No image to push`, it means that there is no Docker image in the local repository to push to the Heroku container registry. Here are some possible reasons why this might be happening:

1. The Docker image was not built yet: Make sure you have built the Docker image for your application by running the `docker build` command. Once the image is built, you can run the `docker images` command to see if it is available in the local repository.

2. The Docker image name is incorrect: When running the `heroku container:push` command, make sure that the name of the Docker image matches the name specified in the `Dockerfile` for your application. By default, the Heroku container registry expects the image name to be in the format `<HEROKU_APP_NAME>/<IMAGE_NAME>`.

3. The Dockerfile is in the wrong directory: Make sure that the `Dockerfile` is located in the root directory of your application. If it is in a different directory, you will need to specify the location using the `-f` flag when running the `docker build` command.

4. The Dockerfile is not named correctly: Make sure that the `Dockerfile` is named exactly as such, with no file extension. If the file is named something else, you will need to specify the name using the `-f` flag when running the `docker build` command.

Once you have resolved the issue, you should be able to run the `heroku container:push` command successfully and push the Docker image to the Heroku container registry.

---

🙋 **You:**

checked the docker images and when I found the good one, entered:
❯ heroku container:push navi-app                                                                                                                                                         
but still complains about no image to push

---

🤖 **Assistant:**

If you have confirmed that the Docker image exists in your local repository, and you are still getting the "no image to push" error message, there are a few things you can check:

1. Make sure you are running the `heroku container:push` command from the same directory that contains the Docker image.

2. Check that the image name is correct. The `heroku container:push` command expects the image to be named in the format `<HEROKU_APP_NAME>/<IMAGE_NAME>`. Make sure you are specifying the correct app name and image name.

3. Verify that you are logged into the Heroku container registry. You can log in by running the `heroku container:login` command.

4. Try running the `docker tag` command to tag the image with the correct name. For example, if the image is named `navi-app`, you can run `docker tag navi-app <HEROKU_APP_NAME>/navi-app` to tag the image with the correct name.

If none of these solutions work, it may be helpful to provide more information about the error message you are receiving, including the full output of the command you are running.

---

🙋 **You:**

What should I add to this docker file to point to the container app?
FROM ruby:3.2.1-slim-bullseye
RUN apt update -qq && DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
# Common development dependencies
bash \
build-essential \
cmake \
curl \
gnupg2 \
# ActiveStorage
# - image analysis and transformations
imagemagick \
libvips \
libvips-dev \
# - video previews (with ffprobe for video/audio analysis)
ffmpeg \
# - PDF previews
libpoppler-dev \
# Nokogiri
zlib1g-dev \
liblzma-dev \
libxml2 \
libxml2-dev \
libxslt-dev \
patch \
pkg-config \
xz-utils \
# Interactive REPL (irb, pry, debug) requirement
less \
# Gem tz-data requirement
tzdata \
# Other packages
libffi-dev \
libgcrypt20 \
libgcrypt20-dev \
netcat-openbsd \
openssl \
shared-mime-info \
vim \
# PostgreSQL
&& curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
gpg --dearmor -o /usr/share/keyrings/postgres-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/postgres-archive-keyring.gpg] https://apt.postgresql.org/pub/repos/apt/" \
bullseye-pgdg main 15 | tee /etc/apt/sources.list.d/postgres.list > /dev/null \
&& apt update -qq \
&& DEBIAN_FRONTEND=noninteractive apt -yq dist-upgrade \
&& DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
libpq-dev \
postgresql-client-15 \
# Node.js
&& curl -sL https://deb.nodesource.com/setup_16.x | bash - \
&& apt update -qq \
&& DEBIAN_FRONTEND=noninteractive apt -yq dist-upgrade \
&& DEBIAN_FRONTEND=noninteractive apt install -yq --no-install-recommends \
nodejs \
&& npm install -g yarn \
# Ruby
&& gem install bundler --version '~> 2.3' -N \
&& gem install nokogiri --platform=ruby -- --use-system-libraries -N \
# Cleanup
&& apt clean \
&& rm -rf /var/cache/apt/archives/* \
&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& truncate -s 0 /var/log/*log

ENV LANG=C.UTF-8 \
BUNDLE_JOBS=4 \
BUNDLE_RETRY=5 \
BUNDLE_DISABLE_PLATFORM_WARNINGS=true

WORKDIR /app
COPY Gemfile Gemfile.lock package.json yarn.lock .yarnrc /app/
RUN bundle install && yarn install --check-files --ignore-engines --ignore-platform
COPY ./ /app/

What heroku cli command I should action check the existing remote containers?

---

🤖 **Assistant:**

To check the existing remote containers on Heroku, you can use the following Heroku CLI command:

```
heroku container:release web --app <your_app_name>
```

This command will release the latest version of the container named `web` to the specified Heroku app. If the container has not been previously released, this command will also create the container.

---

🙋 **You:**

How my docker file should look like instead of the one already shared?

---

🤖 **Assistant:**

To build a Dockerfile that can be used to deploy a Ruby on Rails application to Heroku using container registry, you can start with a base image that includes Ruby and add the necessary dependencies for your application. Here's an example Dockerfile that you can use:

```
# Base image with Ruby and dependencies
FROM ruby:3.2.1-slim-bullseye

# Install essential packages and dependencies
RUN apt-get update && \
    apt-get install -y \
      build-essential \
      libpq-dev \
      postgresql-client \
      nodejs \
      yarn \
      cmake \
      libvips-dev \
      libvips-tools \
      ffmpeg \
      imagemagick \
      libxml2-dev \
      libxslt-dev \
      shared-mime-info \
      zlib1g-dev \
      less \
      curl \
      wget \
      vim \
      git \
      && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock to the image
COPY Gemfile Gemfile.lock ./

# Install RubyGems and Bundler
RUN gem update --system
RUN gem install bundler

# Install project dependencies
RUN bundle install

# Copy the application code
COPY . ./

# Run the database migrations
RUN bundle exec rake db:migrate

# Expose the port
EXPOSE $PORT

# Start the application server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
```

You will need to customize this Dockerfile based on the dependencies and requirements of your specific application. Additionally, you will need to ensure that your application code is copied into the image and that the `CMD` instruction starts your application server.

Once you have built your Docker image, you can push it to Heroku using the `heroku container:push` command.

---

🙋 **You:**

My dockerfile is under the docker/ folder, does it have something to do?

---

🤖 **Assistant:**

Yes, the location of your Dockerfile matters when building Docker images with `docker build`. By default, `docker build` looks for a file named `Dockerfile` in the build context, which is the directory you specify as the build context when running `docker build`. 

If your Dockerfile is located in a different directory, you can specify its location using the `-f` flag followed by the path to the Dockerfile:

```
docker build -f docker/Dockerfile .
```

In this example, `docker/Dockerfile` is the path to your Dockerfile, and `.` is the build context directory. The `.` tells Docker to use the current directory as the build context.

---

🙋 **You:**

The error I was having is:
Step 5/7 : COPY Gemfile Gemfile.lock package.json yarn.lock .yarnrc /app/
COPY failed: file not found in build context or excluded by .dockerignore: stat Gemfile: file does not exist

---

🤖 **Assistant:**

The error message suggests that the `Gemfile` file is not found in the build context of your Dockerfile. The build context is the set of files located in the directory where you run the `docker build` command.

Here are a few steps you can follow to resolve this issue:

1. Make sure the `Gemfile` file is located in the same directory as your Dockerfile, or in a subdirectory. For example, if your Dockerfile is located in `~/myapp/docker/Dockerfile`, the `Gemfile` should be located in `~/myapp/docker/Gemfile`.

2. Verify that your build context includes the `Gemfile`. If you're using the `docker build` command to build your image, make sure you're running it from the correct directory. You can specify the build context using the `-f` flag. For example, if your Dockerfile is located in `~/myapp/docker/Dockerfile`, and your build context is located in `~/myapp`, you can use the following command to build your image:

```
docker build -f docker/Dockerfile -t myapp:latest .
```

This tells Docker to use the `Dockerfile` located in the `docker` subdirectory, and the `.` at the end specifies the build context as the current directory (`~/myapp`).

3. If the `Gemfile` is excluded by your `.dockerignore` file, you may need to update your `.dockerignore` file to include it. The `.dockerignore` file specifies files and directories that should be excluded from the build context. Make sure that the `Gemfile` is not listed in your `.dockerignore` file.

By following these steps, you should be able to resolve the `COPY failed: file not found in build context` error and build your Docker image successfully.

---

🙋 **You:**

I'm getting an error in the GitLab CI/CD
      Fetching data_migrate 9.0.0
Installing data_migrate 9.0.0
Fetching debug 1.7.1
Downloading debug-1.7.1 revealed dependencies not in the API or the lockfile
(irb (>= 1.5.0), reline (>= 0.3.1)).
Either installing with `--full-index` or running `bundle update debug` should
fix the problem.
Cleaning up project directory and file based variables
ERROR: Job failed: exit code 1

Here is my yml file:

stages:
  - build
  - test

.build:
  image: ruby:3.2.1
  cache:
    key: navi
    paths:
      - apt-cache/
      - vendor/ruby
      - node_modules/
    policy: pull
  before_script:
    - gem install bundler --no-document
    - bundle install --jobs $(nproc) "${FLAGS[@]}" --path=vendor

.data_storages:
  extends: .build
  services:
    - postgres:15.2
    - redis:7.0
  variables:
    POSTGRES_USER: navi
    POSTGRES_PASSWORD: hixdev
    DATABASE_USERNAME: navi
    DATABASE_HOST: postgres
    DATABASE_PASSWORD: hixdev
    REDIS_URL: redis
    REDIS_DB: 0
    REDIS_PORT: 6379
    RAILS_ENV: test
    DISABLE_SPRING: 1
    BUNDLE_PATH: vendor/bundle
  before_script:
    - export APT_CACHE_DIR=`pwd`/apt-cache && mkdir -pv $APT_CACHE_DIR
    - apt update -qq && apt -o dir::cache::archives="$APT_CACHE_DIR" install -yqq nodejs postgresql-client
    - gem install bundler --no-document
    - bundle install --jobs $(nproc) "${FLAGS[@]}" --path=vendor
    - bundle exec rails db:create db:migrate db:seed --trace
    - bundle exec rails data:migrate

rubocop:
  extends: .build
  stage: build
  cache:
    policy: pull-push
  script:
    - bundle exec rubocop

fasterer:
  extends: .build
  stage: build
  cache:
    policy: pull-push
  script:
    - bundle exec fasterer

rails_best_practices:
  extends: .build
  stage: build
  cache:
    policy: pull-push
  script:
    - bundle exec rails_best_practices

brakeman:
  extends: .build
  stage: build
  cache:
    policy: pull-push
  script:
    - bundle exec brakeman

rspec:
  extends: .data_storages
  stage: test
  cache:
    policy: pull-push
  artifacts:
    name: coverage
    paths:
      - coverage/
  script:
    - bundle exec rspec --profile 10 --format progress
sast:
  stage: test
include:
- template: Security/SAST.gitlab-ci.yml

---

🤖 **Assistant:**

The error message suggests that the `debug` gem version `1.7.1` has dependencies (`irb` and `reline`) that are not in the API or the lockfile. To fix the issue, you need to update the `debug` gem or install it with the `--full-index` option.

You can try updating the `debug` gem by adding the following line to the `before_script` section of your `.build` job:

```
- bundle update debug
```

If that doesn't work, you can try installing the gem with the `--full-index` option:

```
- bundle install --jobs $(nproc) "${FLAGS[@]}" --path=vendor --full-index
```

If you continue to have issues, you can also try running `bundle update` to update all gems to their latest version. However, note that this may cause compatibility issues with your code, so you may want to test thoroughly after doing so.

---

🙋 **You:**

What line of the yml?

---

🤖 **Assistant:**

The error message doesn't provide information about which line of the YAML file caused the error, but I suspect the issue is with the `bundle install` command in the `.data_storages` job.

You might try adding the `--full-index` flag to the `bundle install` command to force a full index of all gems:

```yaml
.data_storages:
  extends: .build
  services:
    - postgres:15.2
    - redis:7.0
  variables:
    POSTGRES_USER: navi
    POSTGRES_PASSWORD: hixdev
    DATABASE_USERNAME: navi
    DATABASE_HOST: postgres
    DATABASE_PASSWORD: hixdev
    REDIS_URL: redis
    REDIS_DB: 0
    REDIS_PORT: 6379
    RAILS_ENV: test
    DISABLE_SPRING: 1
    BUNDLE_PATH: vendor/bundle
  before_script:
    - export APT_CACHE_DIR=`pwd`/apt-cache && mkdir -pv $APT_CACHE_DIR
    - apt update -qq && apt -o dir::cache::archives="$APT_CACHE_DIR" install -yqq nodejs postgresql-client
    - gem install bundler --no-document
    - bundle install --jobs $(nproc) "${FLAGS[@]}" --path=vendor --full-index
    - bundle exec rails db:create db:migrate db:seed --trace
    - bundle exec rails data:migrate
```

If that doesn't work, you might try running `bundle update debug` as suggested in the error message.