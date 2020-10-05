# Save mediawiki into HTML

Use this script to export the MediaWiki content into pretty HTML files. It is written in Z shell, but works in Bash too. 

## Usage

1. Ensure you have wget installed.
1. Change variables:
   1. **INDEX_URL** must contain full url to your index.php file, e.g. INDEX_URL="http://localhost/index.php"
   1. **ENTRY_PAGE** must contain last part of the path to your front page, e.g. ENTRY_PAGE="Fiat_Lux" if the full path is http://localhost/index.php/Fiat_Lux
   1. **DEST_DIR** is a directory where the MediaWiki will be saved, relative to this script.
   
*Note*: This script was inspired by https://mediawiki-l.wikimedia.narkive.com/zn4XHhdm/export-mediawiki-articles-to-static-html-or
