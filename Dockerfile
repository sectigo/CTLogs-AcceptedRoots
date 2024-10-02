FROM busybox:1.37
USER nobody

COPY crt/* /ctlog-roots/crt/
COPY pem/* /ctlog-roots/pem/
COPY tsv/* /ctlog-roots/tsv/
