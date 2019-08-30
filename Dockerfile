FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
LABEL maintainer="Emertyl <lremy@is4ri.com>"

WORKDIR /usr/share/elasticsearch

COPY --chown=elasticsearch:elasticsearch conf/elasticsearch.yml ./config/

RUN ./bin/elasticsearch-plugin install analysis-icu
RUN ./bin/elasticsearch-plugin install analysis-kuromoji
RUN ./bin/elasticsearch-plugin install analysis-smartcn
RUN ./bin/elasticsearch-plugin install analysis-stempel
RUN echo "# allow user 'elasticsearch' mlockall \
    elasticsearch soft memlock unlimited \
    elasticsearch hard memlock unlimited" >> /etc/security/limits.conf

USER elasticsearch

CMD ./bin/elasticsearch
