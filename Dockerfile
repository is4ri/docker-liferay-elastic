FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
LABEL maintainer="Emertyl <lremy@is4ri.com>"

WORKDIR /usr/share/elasticsearch

RUN ./bin/elasticsearch-plugin install analysis-icu
RUN ./bin/elasticsearch-plugin install analysis-kuromoji
RUN ./bin/elasticsearch-plugin install analysis-smartcn
RUN ./bin/elasticsearch-plugin install analysis-stempel
RUN echo "# allow user 'elasticsearch' mlockall\nelasticsearch soft memlock unlimited\nelasticsearch hard memlock unlimited" >> /etc/security/limits.conf
RUN echo "vm.max_map_count=262144" >> /etc/sysctl.conf

USER elasticsearch

CMD ./bin/elasticsearch
