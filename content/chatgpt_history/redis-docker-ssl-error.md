---
title: Redis Docker SSL Error
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Redis Docker SSL Error

## ✅ TODOs


## 📌 Summary
redis docker  error:0A00010B:SSL

## 🧠 Full Chat


redis docker  error:0A00010B:SSL



The error `error:0A00010B:SSL` in a Redis Docker environment usually points to an SSL/TLS-related issue. Redis itself doesn't natively enforce SSL but can be configured to use SSL through proxies like `stunnel` or via Redis' native SSL support (from version 6.0 onward). Here’s how to address this error:

---

### **1. Confirm Redis Configuration**
Check your `redis.conf` or Redis container configuration:
- Ensure SSL/TLS is enabled if you intend to use it.
- Look for settings like `tls-port`, `tls-cert-file`, and `tls-key-file` and confirm they point to valid files.

Example snippet for SSL setup:
```conf
tls-port 6379
tls-cert-file /path/to/redis.crt
tls-key-file /path/to/redis.key
tls-ca-cert-file /path/to/ca.crt
```

---

### **2. Validate Certificates**
Ensure the following:
- The certificates (`.crt`, `.key`) are valid and not expired.
- The private key file is correct and matches the certificate.
- The CA certificate used for signing is trusted.

You can validate certificates using OpenSSL:
```bash
openssl verify -CAfile ca.crt redis.crt
```

---

### **3. Check Redis Client Configuration**
If you're connecting to Redis using SSL from your app, make sure:
- The client is configured to use SSL/TLS.
- The client has access to the CA certificate.
- The connection string includes the correct scheme (`rediss://` for SSL).

Example connection string:
```bash
rediss://:<password>@<hostname>:6379
```

---

### **4. Docker-Specific Configurations**
If Redis is running in Docker:
- Ensure the certificate paths in the container map correctly to volumes on the host.
- Verify the Docker image supports SSL. Use the official Redis Docker image or one you’ve customized for SSL.

Example Docker setup:
```yaml
services:
  redis:
    image: redis:6.2
    ports:
      - "6379:6379"
    volumes:
      - ./path/to/certs:/certs
    command: redis-server --tls-port 6379 \
                          --port 0 \
                          --tls-cert-file /certs/redis.crt \
                          --tls-key-file /certs/redis.key \
                          --tls-ca-cert-file /certs/ca.crt
```

---

### **5. Debugging**
- Run Redis with verbose logging (`loglevel debug`) to capture more details about the error.
- Check the container logs for more insights:
```bash
docker logs <container_id>
```

---

### **6. Verify Client Tools**
Ensure that the tool you're using to connect to Redis (e.g., `redis-cli`, Ruby library) supports SSL and is up to date.

For `redis-cli`:
```bash
redis-cli --tls --cert /path/to/redis.crt --key /path/to/redis.key --cacert /path/to/ca.crt -h <host> -p 6379
```

---

Let me know if you want assistance debugging further or adjusting configurations!

docker compose
x-app: &app
  labels:
    - "com.centurylinklabs.watchtower.enable=false"
  build:
    context: .dockerdev
    args:
      RUBY_VERSION: '3.2.2'
      PG_MAJOR: '14'
      NODE_MAJOR: '18'
  image: printavo-dev:1.0.0
  environment: &env
    NODE_ENV: ${NODE_ENV:-development}
    RAILS_ENV: ${RAILS_ENV:-development}
  tmpfs:
    - /tmp:mode=1777
    - /app/tmp/pids

x-backend: &backend
  shm_size: 1g
  <<: *app
  stdin_open: true
  tty: true
  volumes:
    - code:/app
    - bundle:/usr/local/bundle
    - rails_cache:/app/tmp/cache
    - node_modules:/app/node_modules
    - history:/usr/local/hist
    - .dockerdev/.psqlrc:/root/.psqlrc:ro
    - .git:/app/.git
  environment: &backend-environment
    <<: *env
    REDIS_URL: rediss://redis:6379/
    DATABASE_URL: postgres://postgres:postgres@postgres:5432
    OPENSEARCH_URL: http://opensearch:9200
    MALLOC_ARENA_MAX: 2
    WEB_CONCURRENCY: ${WEB_CONCURRENCY:-0}
    MAX_THREADS: ${MAX_THREADS:-1}
    BOOTSNAP_CACHE_DIR: /usr/local/bundle/_bootsnap
    XDG_DATA_HOME: /app/tmp/cache
    YARN_CACHE_FOLDER: /app/node_modules/.yarn-cache
    HISTFILE: /usr/local/hist/.bash_history
    PSQL_HISTFILE: /usr/local/hist/.psql_history
    IRB_HISTFILE: /usr/local/hist/.irb_history
    EDITOR: vi
    BETTER_ERRORS_EDITOR: rubymine
    VITE_RUBY_HOST: vite
    DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL: true
    CLOCKWORK_QUICKBOOKS: true
    CLOCKWORK_MESSAGING: true
    FIREBASE_SERVICE_ACCOUNT_CREDENTIALS: ${FIREBASE_SERVICE_ACCOUNT_CREDENTIALS:-}
    FIREBASE_PROJECT_ID: ${FIREBASE_PROJECT_ID:-}
  depends_on: &backend-depends
    postgres:
      condition: service_healthy
    redis:
      condition: service_healthy
    opensearch:
      condition: service_healthy
    mail:
      condition: service_started
    create-s3-bucket:
      condition: service_completed_successfully
    watchtower:
      condition: service_started

services:
  # This is used for various ad-hoc dip commands
  rails:
    <<: *backend
    command: tail -f /dev/null

  # This is a special container to be used exclusively by Rubymine to avoid container contention
  rubymine:
    <<: *backend
    environment:
      <<: *backend-environment
    hostname: www.printavo-test.docker
    networks:
      default:
      frontend:
        aliases:
          - printavo-test.docker
          - www.printavo-test.docker
          - wooden-cotten.printavo-test.docker
    command: tail -f /dev/null
    depends_on:
      chrome:
        condition: service_healthy

  web:
    <<: *backend
    environment:
      <<: *backend-environment
      VIRTUAL_HOST: "*.printavo.localhost,printavo.localhost"
      VIRTUAL_PATH: "/"
      VIRTUAL_PORT: "3000"
    networks:
      - frontend
      - default
      - printavo-shared
    command: bundle exec rails server -b 0.0.0.0
    expose:
      - "3000"
    depends_on:
      <<: *backend-depends
      sidekiq:
        condition: service_started
      vite:
        condition: service_started
      clockwork:
        condition: service_started

  vite:
    <<: *backend
    environment:
      <<: *backend-environment
      VITE_RUBY_HOST: 0.0.0.0
      VIRTUAL_HOST: "*.printavo.localhost,printavo.localhost"
      VIRTUAL_PATH: "/vite-dev"
      VIRTUAL_PORT: "3036"
    networks:
      - default
      - frontend
    expose:
      - "3036"
    ports:
      - "3036:3036"
    command: bin/vite dev

  sidekiq:
    <<: *backend
    command: bundle exec sidekiq
    networks:
      - default
      - printavo-shared

  clockwork:
    <<: *backend
    command: bundle exec clockwork ./config/clockwork.rb

  postgres:
    image: postgres:14-alpine
    shm_size: 4g
    volumes:
      - .dockerdev/.psqlrc:/root/.psqlrc:ro
      - db-data:/var/lib/postgresql/data
      - history:/usr/local/hist
    environment:
      PSQL_HISTFILE: /usr/local/hist/.psql_history
      POSTGRES_PASSWORD: postgres
    ports:
      - "5432:5432"
    healthcheck:
      test: pg_isready -U postgres -h 127.0.0.1
      interval: 5s

  redis:
    labels:
      - "com.centurylinklabs.watchtower.enable=false"
    image: redis-tls
    build: .dockerdev/redis
    volumes:
      - redis-data:/data
    environment:
      ALLOW_EMPTY_PASSWORD: yes
      REDIS_TLS_ENABLED: yes
      REDIS_TLS_CERT_FILE: /tls/redis.crt
      REDIS_TLS_KEY_FILE: /tls/redis.key
      REDIS_TLS_CA_FILE: /tls/ca.crt
      REDIS_TLS_AUTH_CLIENTS: "no"
    ports:
      - "6379:6379"
    healthcheck:
      test: redis-cli --tls --insecure ping
      interval: 1s
      timeout: 3s
      retries: 30

  opensearch:
    image: opensearchproject/opensearch:2.5.0
    ports:
      - "9210:9200"
    environment:
      - "discovery.type=single-node"
      - "plugins.security.disabled=true"
    volumes:
      - "os-data:/usr/share/opensearch/data"
    healthcheck:
      test: curl -s http://opensearch:9200 >/dev/null || exit 1
      interval: 5s
      timeout: 5s
      retries: 6

  opensearch-dashboards:
    image: opensearchproject/opensearch-dashboards:2.5.0
    container_name: opensearch-dashboards
    ports:
      - "5601:5601"
    environment:
      OPENSEARCH_HOSTS: '["http://opensearch:9200"]'
      DISABLE_SECURITY_DASHBOARDS_PLUGIN: true

  s3:
    image: minio/minio
    volumes:
      - s3-data:/data/minio
    command: minio server /data/minio
    ports:
      - "9000:9000"
    healthcheck:
      test: [ "CMD", "curl", "-f", "http://localhost:9000/minio/health/live" ]
      interval: 5s
      timeout: 5s
      retries: 3

  create-s3-bucket:
    image: minio/mc
    depends_on:
      - s3
    entrypoint: >
      /bin/sh -c "
      /usr/bin/mc config host add local http://s3:9000 minioadmin minioadmin;
      /usr/bin/mc mb -p local/uploads;
      /usr/bin/mc anonymous set download local/uploads;
      exit 0;
      "

  mail:
    image: axllent/mailpit
    ports:
      - "1025:1025"
      - "8025:8025"
    volumes:
      - mailpit-data:/data
    environment:
      MP_MAX_MESSAGES: 5000
      MP_DATABASE: /data/mailpit.db

  # VNC Session: http://localhost:7900/?autoconnect=1&resize=scale&password=secret.
  chrome:
    image: seleniarm/standalone-chromium
    shm_size: 2g
    ports:
      - "4444:4444"
      - "7900:7900"
    environment:
      JAVA_OPTS: -Dwebdriver.chrome.whitelistedIps=
      SE_VNC_NO_PASSWORD: 1
      SCREEN_WIDTH: 3840
      SCREEN_HEIGHT: 4320
    hostname: chrome.docker
    networks:
      - frontend
    healthcheck:
      test: /opt/bin/check-grid.sh --host 0.0.0.0 --port 4444
      interval: 15s
      timeout: 30s
      retries: 5

  # start as needed to run tests relating to pusher
  pusher:
    build:
      context: .dockerdev/pusher-fake
      args:
        RUBY_VERSION: '3.2.2'
    image: printavo/pusher-fake
    hostname: pusher.docker
    networks:
      - default
      - frontend
    environment:
      PUSHER_APP_ID: "PUSHER_APP_ID"
      PUSHER_APP_KEY: "PUSHER_APP_KEY"
      PUSHER_APP_SECRET: "PUSHER_SECRET"

  # Handle keeping all the images up to date on a regular basis
  watchtower:
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    command: --interval 3600

volumes:
  bundle:
  node_modules:
  history:
  rails_cache:
  db-data:
  es-data:
  os-data:
  s3-data:
  redis-data:
  mailpit-data:
  code:

networks:
  printavo-shared:
    external: true
  frontend:
    name: ${DIP_INFRA_NETWORK_NGINX}
    external: true

# Define synchronization
x-mutagen:
  sync:
    defaults:
      ignore:
        vcs: true
        paths:
          - node_modules
          - .idea
          - tmp/miniprofiler
    code:
      alpha: '.'
      beta: 'volume://code'


docker-compose.override.yml
services:
  web:
    command: /bin/true
  sidekiq:
    command: /bin/true
  chrome:
    command: /bin/true

I now run only dip up web -d
and dip infra up but not all the containers and it's been failing. What can I do?

To resolve the issue with your `dip up web -d` and `dip infra up` commands not starting all containers properly, follow these steps for troubleshooting and resolution:

---

### **1. Validate Docker Compose File**
Ensure your `docker-compose.yml` and `docker-compose.override.yml` are syntactically correct. Run:
```bash
docker-compose config
```
This command will validate and merge your Compose files, displaying the final configuration. Check for syntax errors or misconfigurations.

---

### **2. Check Dependencies**
Ensure that all the `depends_on` conditions in your services are correctly defined and the dependencies (e.g., `postgres`, `redis`) are healthy. Look at the healthcheck conditions:
- Test the healthchecks manually using commands like `pg_isready` for PostgreSQL or `redis-cli ping` for Redis.
- Check logs of failing services:
  ```bash
  docker logs <container_name>
  ```

---

### **3. Start Infrastructure Services**
Ensure the dependent services like `redis`, `postgres`, `opensearch`, and others are running correctly before starting the `web` container:
```bash
dip infra up -d
```
Verify the status:
```bash
docker ps
```

If some services are not starting, check their logs for errors.

---

### **4. Debugging the `web` Service**
If `web` fails to start:
- Inspect the logs of the `web` container:
  ```bash
  docker logs web
  ```
- Verify that its dependencies (`sidekiq`, `vite`, etc.) are available and healthy.

---

### **5. Fix Redis SSL Configuration**
Your `redis` service is using `rediss://` (SSL-enabled), and the healthcheck uses:
```bash
redis-cli --tls --insecure ping
```
Ensure:
- The `redis` container can find the correct `redis.crt`, `redis.key`, and `ca.crt` files in the `/tls` directory.
- The healthcheck command runs without errors inside the container:
  ```bash
  docker exec -it redis redis-cli --tls --insecure ping
  ```

If Redis fails to initialize, correct the paths or generate new certificates.

---

### **6. Clean Up Stale Containers**
Sometimes, orphaned or conflicting containers can cause issues. Remove any unnecessary containers:
```bash
docker-compose down --remove-orphans
docker system prune --volumes
```

Rebuild the services:
```bash
dip up --build web -d
```

---

### **7. Verify Mutagen Configuration**
If you’re using Mutagen for synchronization (`x-mutagen`), ensure:
- Mutagen is installed and running.
- The sync definitions are correct and do not ignore critical paths.

Restart Mutagen and check its status:
```bash
mutagen sync list
```

---

### **8. Networking Issues**
Check the network configuration:
- Ensure external networks like `printavo-shared` and `${DIP_INFRA_NETWORK_NGINX}` are properly defined and accessible.
- Inspect the network:
  ```bash
  docker network inspect <network_name>
  ```

If there are conflicts, recreate the networks:
```bash
docker network prune
docker-compose up -d
```

---

### **9. Use Docker Logs for Insights**
Gather logs from all services to identify issues:
```bash
docker-compose logs
```
Look for errors or warnings related to services not starting.

---

### **10. Test in Isolation**
Try running only the `infra` services first:
```bash
dip infra up
```
Ensure they are healthy before starting `web`:
```bash
dip up web -d
```

---

### **11. Increase Healthcheck Timeout**
Some services like `postgres` or `redis` may need more time to initialize. Update the `healthcheck` settings with a longer `timeout` or `retries` value.

Example:
```yaml
healthcheck:
  test: pg_isready -U postgres -h 127.0.0.1
  interval: 10s
  timeout: 10s
  retries: 10
```

---

### **12. Debugging in Detached Mode**
If `dip up web -d` fails silently, run it interactively:
```bash
dip up web
```

---

### **13. Check Resource Limits**
Ensure your system has sufficient resources (CPU, memory) to run all the containers. Adjust Docker Desktop settings if needed.

---

### **14. Consult Dip Logs**
If you suspect Dip-specific issues, enable verbose logging:
```bash
DIP_DEBUG=true dip up web
```

---

Let me know the results or if you'd like further help interpreting logs or resolving specific issues!

unable to bring up Mutagen Compose sidecar service: network printavo-shared declared as external, but could not be found


The error "network `printavo-shared` declared as external, but could not be found" indicates that the `printavo-shared` network is declared as an external network in your `docker-compose.yml`, but it hasn't been created or isn't accessible to your Docker setup.

Here’s how to fix this issue:

---

### **1. Check Existing Networks**
Verify whether the `printavo-shared` network exists:
```bash
docker network ls
```
Look for `printavo-shared` in the output. If it doesn’t exist, you’ll need to create it.

---

### **2. Create the External Network**
Manually create the `printavo-shared` network:
```bash
docker network create printavo-shared
```

Now try running the services again:
```bash
dip infra up
```

---

### **3. Verify Network Configuration**
Ensure the `printavo-shared` network is correctly defined in your `docker-compose.yml` file. It should look something like this:
```yaml
networks:
  printavo-shared:
    external: true
```

If you accidentally included an environment variable (e.g., `${DIP_INFRA_NETWORK_NGINX}`) that hasn’t been defined, ensure it resolves properly.

---

### **4. Resolve Environment Variables**
If the `name` property in `networks` references an environment variable, confirm the variable is set:
```bash
echo $DIP_INFRA_NETWORK_NGINX
```
If it’s empty, set it:
```bash
export DIP_INFRA_NETWORK_NGINX=printavo-shared
```

---

### **5. Update the Compose File for Debugging**
If you don’t need the `printavo-shared` network to be external, remove the `external: true` declaration and let Docker Compose create it automatically:
```yaml
networks:
  printavo-shared:
    name: printavo-shared
```

---

### **6. Clean Up Orphaned Resources**
Remove orphaned or conflicting networks:
```bash
docker network prune
```

---

### **7. Restart Mutagen**
After resolving the network issue, restart the Mutagen daemon to ensure it’s properly configured:
```bash
mutagen sync terminate
mutagen project start
```

---

### **8. Retry the Command**
Run the Compose commands again:
```bash
dip infra up
```

If you continue to encounter errors, share the updated `docker-compose.yml` or additional error messages, and I can help further.

 Error accepting a client connection: error:0A00010B:SSL routines::wrong version number (addr=192.168.65.1:20472 laddr=172.18.0.7:6379)

The error `error:0A00010B:SSL routines::wrong version number` suggests that there's a mismatch in SSL/TLS settings between the client and the Redis server. Here's how to troubleshoot and resolve this issue:

---

### **1. Verify Redis Configuration**
Ensure Redis is correctly configured for SSL. Check the following in your `redis.conf` or Docker configuration:

- **Enable TLS:** Confirm `tls-port` is specified (e.g., `6379`) and `port` is set to `0` (to disable non-TLS connections).
- **Certificates:** Verify paths for `tls-cert-file`, `tls-key-file`, and `tls-ca-cert-file`.

Example `redis.conf` settings:
```conf
tls-port 6379
port 0
tls-cert-file /path/to/redis.crt
tls-key-file /path/to/redis.key
tls-ca-cert-file /path/to/ca.crt
```

---

### **2. Check Client Configuration**
Ensure the client is configured to connect using TLS. If you're using `redis-cli` or a Redis client library, the connection string should use `rediss://` (with `s` indicating SSL/TLS).

For example:
```bash
redis-cli --tls --cert /path/to/redis.crt --key /path/to/redis.key --cacert /path/to/ca.crt -h <host> -p 6379
```

Or, in your environment variables:
```env
REDIS_URL=rediss://<username>:<password>@<host>:6379
```

---

### **3. Verify SSL/TLS Version Compatibility**
This error often occurs if the client and server are using incompatible TLS versions. Redis supports TLS versions starting from `1.2`.

- Ensure both the client and server support `TLS 1.2` or higher.
- You can force a specific TLS version using OpenSSL to debug:
```bash
openssl s_client -connect <host>:6379 -tls1_2
```

---

### **4. Update Docker Redis Image**
If you're using a custom Redis image with SSL (`redis-tls`), ensure it's properly built and uses the correct Redis version with SSL support. Verify the `Dockerfile` in `.dockerdev/redis` contains necessary instructions to build Redis with TLS.

Rebuild the image:
```bash
docker-compose build redis
```

Restart the container:
```bash
docker-compose up -d redis
```

---

### **5. Debug the Redis Logs**
Inspect Redis container logs for more details about the error:
```bash
docker logs <redis_container_name>
```

Look for issues with certificate loading, TLS handshake, or connection attempts.

---

### **6. Confirm Client-Server Connectivity**
Use a simple connection to confirm that the Redis server is reachable:
```bash
redis-cli -h <host> -p 6379 --tls
```

If this works, the issue is likely with your application's configuration.

---

### **7. Check for Proxy or Networking Issues**
If your Redis server is behind a proxy (e.g., Nginx) or load balancer, ensure it’s configured to support SSL/TLS properly and matches the Redis server’s configuration.

For example, Nginx configuration for Redis with SSL:
```nginx
stream {
    server {
        listen 6379 ssl;
        ssl_certificate /path/to/cert.pem;
        ssl_certificate_key /path/to/key.pem;
        proxy_pass redis:6379;
    }
}
```

---

### **8. Update Redis URL**
If you’re using environment variables to configure `REDIS_URL`, confirm the format is correct:
```env
REDIS_URL=rediss://<host>:6379
```

---

### **9. Test Without SSL**
To isolate the issue, temporarily disable SSL on Redis. Update the configuration:
```conf
port 6379
tls-port 0
```

Restart Redis and test. If this works, the issue is indeed with SSL configuration.

---

Let me know if you need further assistance debugging or fixing specific issues!