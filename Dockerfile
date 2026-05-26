FROM busybox:1.38
USER nobody

COPY crt/* /ctlog-roots/crt/
COPY pem/* /ctlog-roots/pem/
COPY tsv/* /ctlog-roots/tsv/
