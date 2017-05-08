#!/bin/bash

function make_caroots_pem {
	find crt/common crt/$1 -iname *.crt 2>/dev/null | sort | xargs cat > pem/$1-ca-roots.pem
}

function make_caroots_tsv {
	find crt/common crt/$1 -iname *.crt -printf %f -exec openssl x509 -nameopt utf8 -subject -noout -in '{}' ';' 2>/dev/null | sed "s/\.crtsubject= /\t/g" | sort > tsv/$1-ca-roots.tsv
}

make_caroots_pem dodo
make_caroots_pem mammoth
make_caroots_pem sabre

make_caroots_tsv dodo
make_caroots_tsv mammoth
make_caroots_tsv sabre
