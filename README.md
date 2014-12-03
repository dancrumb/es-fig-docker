# Elasticsearch-Fig-Docker Demonstration

This repository contains the code that was demonstrated by me, [Dan Rumney](dan.rumney@vodori.com), on December 2, 2014 as part of
the [Elasticsearch meetup](http://www.meetup.com/Elasticsearch-User-Group-Chicago/events/218664265/) hosted by [Vodori](http://vodori.com).

## Getting started

First, you'll need to install Docker on your system. There are [instructions](https://docs.docker.com/installation/) for a wide variety of Operating Systems.

Next, you'll need to install Fig. [Instructions](http://www.fig.sh/install.html) on their site indicate that support for OS X an 64-bit Linux come out of the box. If you're on another system, you'll need to install it as a Python package.

## Building the docker image

Run this command

    docker build -t esdemo:1.1.0 .

 in this directory to create the necessary Docker image

## Starting your cluster

This is easy:

    fig up -d

 This starts up our services (`up`) in the background (`-d` for "detached").

 Next, run `fig logs` to watch the nodes come up. Once they're up, you can view the cluster state via [the kopf plugin](http://localhost:9200/_plugin/kopf).

## Creating an populating the index

There are a few scripts in this repo that encapsulate some HTTP requests to the Elasticseach REST API for creating and populating an index.
Simply run:

     ./createIndex.sh 
     ./loadIndex.sh

Then watch the kopf plugin to see the data being loaded.

## Adding and removing nodes

Adding nodes is simple. You have an N+1 node cluster, where N is the number of `esNode` services you have running. The '1' node is the esGateway service that has its container ports mapped to your host's ports.

So, to go to an 8 node cluster, you would run

    fig scale esNode=7

If you watch the kopf plugin, you can see the shards being moved about the cluster


## Rerouting shard

 If you want to move an unallocated shard into the cluster, simply run

     ./reroute.sh <shard number> "<node name>"

## Handy tips

If you run `docker ps`, you'll see a list of your running containers with their container IDs

If you look at the nodes on the kopf display, you'll see which node corresponds to which container. You'll also see those containers' IP addresses.

## Questions, comments, etc.

If you have any questions, please don't hesitate to contact me. This is a public repo so pull requests for clarifications and improvements are most welcome.


### Acknowledgements

The shakespeare data and index commands are taken from [Elasticsearch's Kibana walkthrough](http://www.elasticsearch.org/guide/en/kibana/current/using-kibana-for-the-first-time.html)
The base Docker image for our image is [dockerfile/elasticsearch](https://github.com/dockerfile/elasticsearch/blob/master/Dockerfile)