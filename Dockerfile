FROM docker.elastic.co/elasticsearch/elasticsearch:6.5.4
LABEL maintainer="Emertyl <lremy@is4ri.com>"

WORKDIR /usr/share/elasticsearch

RUN ./bin/elasticsearch-plugin install analysis-icu
RUN ./bin/elasticsearch-plugin install analysis-kuromoji
RUN ./bin/elasticsearch-plugin install analysis-smartcn
RUN ./bin/elasticsearch-plugin install analysis-stempel

CMD ./bin/elasticsearch
