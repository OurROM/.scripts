#! /bin/bash
perl -pe 's#(ro.goo.version=)([0-9.]+)( \\)#"$1" . ($2 + 1) . "$3"#e;' common_versions.mk | cat > tmp.txt
mv tmp.txt common_versions.mk
