#!/bin/bash

function make_caroots_prod_pem {
	find crt/common/trusted crt/common/monitoring crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_nonprod_pem {
	find crt/common/non_production crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_test_pem {
	find crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_prod_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/trusted crt/common/monitoring crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_nonprod_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/common/non_production crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

function make_caroots_test_tsv {
	echo "SHA-256(Certificate)	CA Name" > tsv/$1-ca-roots.tsv
	find crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject=/\t/g" | sort >> tsv/$1-ca-roots.tsv
}

make_caroots_nonprod_pem dodo
make_caroots_prod_pem mammoth
make_caroots_prod_pem sabre
make_caroots_test_pem tigger
make_caroots_nonprod_pem dumbo
make_caroots_prod_pem elephant
make_caroots_prod_pem tiger

make_caroots_nonprod_tsv dodo
make_caroots_prod_tsv mammoth
make_caroots_prod_tsv sabre
make_caroots_test_tsv tigger
make_caroots_nonprod_tsv dumbo
make_caroots_prod_tsv elephant
make_caroots_prod_tsv tiger
