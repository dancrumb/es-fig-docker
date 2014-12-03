FROM dockerfile/elasticsearch

ADD ./elasticsearch.yml /elasticsearch/config/elasticsearch.yml

RUN echo Hello World
RUN mkdir /plugins
RUN /elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/v1.3.8

