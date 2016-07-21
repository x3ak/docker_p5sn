##Docker repository for p5sn

####Preparation for use:
1. To use this you need to [install](https://docs.docker.com/engine/installation/) locally docker.
2. Also [install](https://docs.docker.com/compose/install/) docker compose.


### Making to work!

#### Building containers and downloading/making needed images:
1. Execute from terminal: `cd /path/to/your/cloned/docker_p5sn`
2. Copy file `docker-compose.yml.dist` in `docker-compose.yml`
3. Edit in key 'volumes' and put your `/path/to/project/`
4. Execute from terminal: `docker-compose up`


#### Importing database:
1. Copy db dump to: `/path/to/your/cloned/docker_p5sn/mysql`
2. Rename dump to: `p5sndb.sql`
3. Execute from terminal: `docker exec -it p5sn_db bash` #You are entering in container "p5sn_db"
4. Now you are in container p5sn_db, execute from terminal: `cd /database/import_db`
5. Execute from terminal: `chmod +x import_db.sh`
6. Import db by executing from terminal: `./import_db.sh`


#### Entering p5sn container:
1. Execute from terminal from terminal: `cd /path/to/your/cloned/docker_p5sn`
2. Execute from terminal from terminal: `chmod +x enter-container.sh`
3. Execute from terminal from terminal: `./enter-container.sh`, now you are in p5sn container
4. Execute from terminal from terminal: `cd app`, now you are in the symfony project, from here you clean cache, make composer install, but not commit 
    with git, to commit with git you need to make this from outside of container due to docker root file permission that 
    will change permissions
5. Give permissions to `cache/, logs` maps