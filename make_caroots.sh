#!/bin/bash

function make_caroots_readonly_pem {
	find crt/common/monitoring crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_prod_tls_pem {
	find crt/common/trusted/tls crt/common/monitoring crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_prod_bimi_pem {
	find crt/common/trusted/bimi crt/common/monitoring crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_nonprod1_pem {
	find crt/common/trusted/tls crt/common/non_production crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_nonprod2_pem {
	find crt/common/non_production crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_test_pem {
	find crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_readonly_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/monitoring crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_prod_tls_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/trusted/tls crt/common/monitoring crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_prod_bimi_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/trusted/bimi crt/common/monitoring crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_nonprod1_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/trusted/tls crt/common/non_production crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_nonprod2_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/non_production crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_test_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

make_caroots_readonly_pem mammoth
make_caroots_readonly_pem sabre
make_caroots_prod_tls_pem elephant
make_caroots_prod_tls_pem tiger
make_caroots_prod_tls_pem monument
make_caroots_prod_tls_pem statue
make_caroots_prod_bimi_pem billboard
make_caroots_nonprod1_pem dumbo
make_caroots_nonprod2_pem standee
make_caroots_test_pem tigger

make_caroots_readonly_tsv mammoth
make_caroots_readonly_tsv sabre
make_caroots_prod_tls_tsv elephant
make_caroots_prod_tls_tsv tiger
make_caroots_prod_tls_tsv monument
make_caroots_prod_tls_tsv statue
make_caroots_prod_bimi_tsv billboard
make_caroots_nonprod1_tsv dumbo
make_caroots_nonprod2_tsv standee
make_caroots_test_tsv tigger
