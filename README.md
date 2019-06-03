# geoloc-mongodb

## Initialization

1 - Use init.sh script then launch the commande below : 

```bash
docker-compose -f docker-compose.yml up -d
```

2 - It will up the mongo containers. After that, connect to the geoloc_mongos container with bash : 

```bash
docker exec -it <container-id> /bin/bash
```

3 - Once you're connected, enter the mongo database (just type mongo and enter), then switch to geoloc db and create the user :


```bash
mongo //Enter from bash to mongo mode
```

```bash
use geoloc //Switch from test base to geoloc base
```

```mongodb
db.createUser(
   {
     user: "geoloc",
     pwd: "geoloc",
     roles: [ "readWrite", "dbAdmin" ]
   }
) //Create the user
```
Do not forget to remove the comments after // in order to make the commands work
