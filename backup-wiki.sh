#!/bin/zsh

INDEX_URL="http://localhost/index.php"
ENTRY_PAGE="Fiat_Lux_(for_Michal)"
DEST_DIR="mediawiki"
URL="$INDEX_URL/$ENTRY_PAGE"
FILES_DEST="$DEST_DIR/"`echo "$INDEX_URL" | sed 's/[a-zA-Z]*:\/\///g'`

# Switches explained:
#
# -nv: no verbose
# -k: convert links for local viewing
# -p: include all assets required to view the page correctly, including inline images
# --reject-regex: do not include paths matched by regex
# -r: download pages recursively
# --directory-prefix: use this folder to store files
# -E: add correct extensions to downloaded pages and assets

echo "Getting wiki pages into static HTML. URL: $URL, DESTINATION: $DEST_DIR."

wget \
-nv \
-k \
-p \
--reject-regex "(index\.php\/Special:.*)|(index\.php\/WikiMedia:.*)|(&oldid=.*)|(&printable=.*)|(&action=.*)|(index\.php\?title=Special.*)" \
-r \
--directory-prefix=$DEST_DIR \
-E \
$URL

echo "Removing [edit] links from the html files."

for FILE in `ls $FILES_DEST/*.html` ; do
sed 's/<span class="mw-editsection".*<\/span><\/span>//' $FILE > $FILE.new;
done;

for FILE in `ls $FILES_DEST/*.html` ; do
mv $FILE.new $FILE;
done;

echo "Creating more traditional index file."

cp $FILES_DEST/$ENTRY_PAGE.html $FILES_DEST/index.html
