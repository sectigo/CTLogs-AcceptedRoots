FROM busybox:1.36
USER nobody

COPY crt/* /ctlog-roots/crt/
COPY pem/* /ctlog-roots/pem/
COPY tsv/* /ctlog-roots/tsv/
