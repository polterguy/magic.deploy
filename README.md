
# Magic Deploy

This is a helper repository to deploy Magic to a VPS of your chosing. This project helps you to deploy Magic,
using Docker. First clone the entire project into your VPS server using the following command.

```
git clone https://github.com/polterguy/magic.deploy.git
```

**Notice** - If the above gives you an error, you might need to install git using the following
command and then rerun the above afterwards.

```
apt install git
```

When you have successfully cloned this repository, change into the `magic.deploy` folder
using the following command.

```
cd magic.deploy
```

**Notice** - The `docker-compose.yml` file needs to be manually edited to provide it with your
email address, frontend domain, and backend domain before you execute the docker-compose command.
You can do this with the following command.

```
sudo nano docker-compose.yml
```

And then look through the file for the following YAML nodes.

```
- VIRTUAL_HOST=api.servergardens.com
- LETSENCRYPT_HOST=api.servergardens.com
- LETSENCRYPT_EMAIL=thomas@servergardens.com
```

In addition to these YAML nodes.

```
- VIRTUAL_HOST=magic.servergardens.com
- LETSENCRYPT_HOST=magic.servergardens.com
- LETSENCRYPT_EMAIL=thomas@servergardens.com
```

In total there are _6 entries_ you need to change, and the email address needs to be a valid email
address you own, and the domain needs to be a sub-domain you own where you want to run your Magic
installation. When you are done editing the docker-compose.yml file, hold down the CTRL key and
click X, then choose Y when nano asks you if you want to save the file after you have edited the
file. When you are done with editing the _"docker-compose.yml"_ file, you can execute the following
command in your terminal.

```
docker network create nginx-proxy
```

If the above gives you an error, you might need to install docker using `apt install docker`.

This command will create the your Docker proxy network, which Magic will need to be able to connect
all the docker images within your docker-compose file. When you have created the above network, you
can start your docker containers using the following command.

```
docker-compose up -d
```

If the above gives you an error, you might need to install docker-compose using `apt install docker-compose`.

The above will start 5 docker containers.

* `nginx-proxy` - The nGinx proxy that internally routes requests to either your backend or your frontend
* `letsencrypt` - The container responsible for retrieving and renewing LetsEncrypt SSL certificates for you
* `db` - Your MySQL database, used to create the _"magic"_ database, which Magic internally depends upon
* `backend` - The main Magic backend container
* `frontend` - The main Magic dashboard frontend container

You can now visit your frontend domain, and setup Magic, assuming you've pointed your DNS A records to
the IP address of your virtual server. Notice, to configure Magic login with _"root/root"_ and do _not_
change the database connection string, but choose _mysql_ as your database type, and provide Magic with
a root password, and just follow the wizard to the end.
