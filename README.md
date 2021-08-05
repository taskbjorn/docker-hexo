# Quick reference

* **Maintained by:** [taskbjorn](https://git.dsme.cc/taskbjorn)
* **Official Git repository:** [docker-hexo on Git&Tonic](https://git.dsme.cc/taskbjorn/docker-hexo)

# Supported tags and respective Dockerfile links

* [`latest`, `5.2.0`](https://git.dsme.cc/taskbjorn/docker-hexo/build/latest/Dockerfile)

# What is `docker-hexo`?

![docker-hexo](https://git.dsme.cc/taskbjorn/docker-hexo/src/branch/main/docker-hexo.png)

`docker-hexo` is a Docker container for the Hexo blog framework based on Alpine Linux.

# Running using Docker or Docker Compose

To run the container and persist data across container restarts, create a volume with a name of your choice (`hexo_data`, in this example) and run the following:

```bash
docker volume create my_hexo_data
docker run -it --name my_hexo_container -p 4000:4000 -v hexo_data:/home/hexo/.hexo taskbjorn/hexo
```

Your blog will then be available at `http://0.0.0.0:4000` on your host.

If you use Docker Compose. you may use the example [Compose file](https://git.dsme.cc/taskbjorn/docker-hexo/compose/docker-compose.yml) provided in this repository. Make sure to adjust the configuration (container names, volume names, ports, etc.) to fit your needs.

# How to use `docker-hexo`

On first run, the container initializes a new site in `/home/hexo/.hexo`. The static pages are then served through the integrated web server `hexo-server` running on the container port `4000`. If a pre-populated volume is mounted at `/home/hexo/.hexo`, then no new site is initialized and the pre-existing contents of the volume are served instead.

To use Hexo, you may run a command inside the Docker container as follows:

```bash
docker exec my_hexo_container hexo <command>
```

You can find the list of available commands on the [Commands](https://hexo.io/docs/commands.html) page of the official Hexo documentation.

Alternatively, you may open an interactive shell which will start in the root of your blog and give you direct access to the `hexo` command:

```bash
docker exec -it my_hexo_container sh
hexo generate
```

# License

This image is licensed under [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).

As it is often the case with Docker images, some of the software contained in this image (e.g. the base image, software included in the base image, etc.) may be covered under a difference license.

Please remember it is your responsibility as the end-user to ensure that your use case complies with the licenses of all included software.