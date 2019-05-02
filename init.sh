#!/bin/sh
echo "Init config replSet"
docker exec -i mongo-geoloc_config mongo --port 27019 <<EOF
rs.initiate({
  _id: "config",
  members: [
    { _id: 0, host: "config:27019" }
  ]
})
EOF

echo "Wait for master to step up"
sleep 5

echo "Add shards to cluster"
docker exec -i mongo-geoloc_mongos mongo <<EOF
sh.addShard("sh0:27018")
sh.addShard("sh1:27018")
sh.addShard("sh2:27018")
EOF
