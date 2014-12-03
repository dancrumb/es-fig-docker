curl -X POST \
    'http://localhost:9200/_cluster/reroute?pretty=true' \
    -d "{ \"commands\" : [ { \"allocate\" : { \"index\" : \"shakespeare\", \"shard\" : $1 , \"node\" : \"$2\", \"allow_primary\" : 1 }}]}"