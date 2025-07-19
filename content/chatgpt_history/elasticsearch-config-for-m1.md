---
title: Elasticsearch config for M1
tags: []
created: '2025-07-19'
updated: '2025-07-19'
summary:
draft: false
---

# Elasticsearch config for M1

## ✅ TODOs


## 📌 Summary
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.10.2

## 🧠 Full Chat


docker pull docker.elastic.co/elasticsearch/elasticsearch:7.10.2

I have a m3 mac, should I do something so I can run this image? It's not working and I'm getting the following error:

2024-02-23 00:01:01 ERROR: [1] bootstrap checks failed
2024-02-23 00:01:01 [1]: the default discovery settings are unsuitable for production use; at least one of [discovery.seed_hosts, discovery.seed_providers, cluster.initial_master_nodes] must be configured
2024-02-23 00:01:01 ERROR: Elasticsearch did not exit normally - check the logs at /usr/share/elasticsearch/logs/docker-cluster.log
2024-02-23 00:01:01 {"type": "server", "timestamp": "2024-02-23T06:01:01,286Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "5c8e80081242", "message": "stopping ..." }
2024-02-23 00:01:01 {"type": "server", "timestamp": "2024-02-23T06:01:01,290Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "5c8e80081242", "message": "stopped" }
2024-02-23 00:01:01 {"type": "server", "timestamp": "2024-02-23T06:01:01,290Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "5c8e80081242", "message": "closing ..." }
2024-02-23 00:01:01 {"type": "server", "timestamp": "2024-02-23T06:01:01,294Z", "level": "INFO", "component": "o.e.n.Node", "cluster.name": "docker-cluster", "node.name": "5c8e80081242", "message": "closed" }
2024-02-23 00:01:01 {"type": "server", "timestamp": "2024-02-23T06:01:01,295Z", "level": "INFO", "component": "o.e.x.m.p.NativeController", "cluster.name": "docker-cluster", "node.name": "5c8e80081242", "message": "Native controller process has stopped - no new native processes can be started" }



The error you're encountering when trying to run Elasticsearch 7.10.2 on your M3 Mac via Docker is not directly related to your Mac's architecture but rather to Elasticsearch's configuration for a production environment. The log indicates that Elasticsearch has failed its bootstrap checks due to unsuitable default discovery settings for production use. Specifically, it's requiring you to configure at least one of the following settings: `discovery.seed_hosts`, `discovery.seed_providers`, or `cluster.initial_master_nodes`.

For a quick, non-production setup, you can bypass these checks by setting your environment to development mode and explicitly configuring the cluster to consist of a single node. This can be done by adding environment variables to your Docker command that set `discovery.type` to `single-node`. Here's how you could adjust your Docker command:

```sh
docker run -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.10.2
```

This command runs the Elasticsearch Docker container with the `discovery.type` environment variable set to `single-node`, which tells Elasticsearch to bypass the bootstrap checks that are failing. This setup is not recommended for production because it disables some of the production checks that ensure your cluster is configured safely. However, it's perfectly fine for development or testing purposes.

Additionally, ensure that your Docker Desktop application is configured to run ARM64 containers natively, as the M3 chip is based on the ARM architecture. Recent versions of Docker Desktop for Mac support Apple Silicon natively, but you might want to check your Docker Desktop's settings or update it to the latest version to ensure optimal performance and compatibility.

This is some of the logs but I still can't curl port 9200
{"type": "server", "timestamp": "2024-02-23T06:06:21,819Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding template [.monitoring-es] for index patterns [.monitoring-es-7-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,832Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding template [.monitoring-kibana] for index patterns [.monitoring-kibana-7-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,851Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding template [.monitoring-logstash] for index patterns [.monitoring-logstash-7-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,869Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding template [.monitoring-beats] for index patterns [.monitoring-beats-7-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,886Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index template [logs] for index patterns [logs-*-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,901Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index template [metrics] for index patterns [metrics-*-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,916Z", "level": "INFO", "component": "o.e.c.m.MetadataIndexTemplateService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index template [synthetics] for index patterns [synthetics-*-*]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,929Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [ml-size-based-ilm-policy]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,946Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [logs]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,958Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [metrics]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,970Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [synthetics]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,981Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [watch-history-ilm-policy]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:21,993Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [ilm-history-ilm-policy]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:22,002Z", "level": "INFO", "component": "o.e.x.i.a.TransportPutLifecycleAction", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "adding index lifecycle policy [slm-history-ilm-policy]", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:22,046Z", "level": "INFO", "component": "o.e.l.LicenseService", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "license [fb8c998e-1743-4500-88db-90a515982ad3] mode [basic] - valid", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }
{"type": "server", "timestamp": "2024-02-23T06:06:22,047Z", "level": "INFO", "component": "o.e.x.s.s.SecurityStatusChangeListener", "cluster.name": "docker-cluster", "node.name": "58b59321b264", "message": "Active license is now [BASIC]; Security is disabled", "cluster.uuid": "pcqDkRLYSW22mQUTGZQ0oA", "node.id": "2d037MoXT7eBLtacWSVIyg"  }

If you're unable to access Elasticsearch on port 9200 after starting it with Docker, there are a few potential reasons and solutions you might want to consider:

1. **Port Mapping**: Ensure that when you start the Elasticsearch Docker container, you map the container's port 9200 to a port on your host machine. If you haven't specified a port mapping, you won't be able to access Elasticsearch from your host machine. Use the `-p` option in your Docker run command to map the ports. For example:

   ```sh
   docker run -p 9200:9200 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.10.2
   ```

   This command maps port 9200 on the container to port 9200 on your host, allowing you to access Elasticsearch via `localhost:9200`.

2. **Firewall or Security Software**: Ensure that no firewall or security software on your machine is blocking access to port 9200. Depending on your operating system, you might need to configure or temporarily disable the firewall to test connectivity.

3. **Docker Network Configuration**: Docker's network configuration could be preventing access to the container. If you're running Docker in a specific network mode (e.g., `--network="host"`), ensure that it's correctly configured to allow access to the ports you need.

4. **Elasticsearch Configuration**: Although the logs don't indicate a configuration issue beyond the discovery settings, double-check the Elasticsearch configuration files (if you've mounted a custom configuration) to ensure there are no settings that might prevent access.

5. **Curl from Inside the Container**: To rule out any issues with Docker or Elasticsearch itself, try accessing Elasticsearch from within the container. First, execute a bash shell inside your running container:

   ```sh
   docker exec -it <container_id> bash
   ```

   Then, try to `curl` Elasticsearch from within the container:

   ```sh
   curl http://localhost:9200
   ```

   If this succeeds, the issue likely lies with the Docker port mapping or network configuration.

6. **Inspect Docker Logs**: Further inspect the Docker container logs for any errors or warnings that might indicate what's going wrong. You can view the logs of your running container using:

   ```sh
   docker logs <container_id>
   ```

By following these steps, you should be able to diagnose and resolve the issue preventing access to Elasticsearch on port 9200. If the problem persists, consider checking Elasticsearch's official documentation or forums for more specific guidance.