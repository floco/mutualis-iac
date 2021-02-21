wget "https://simpleicons.org/icons/$1.svg" -O "$1.tmp"
sed -e 's/viewBox="0 0 24 24"/viewBox="0 -12 24 48" style="background-color:#'$2'" width="300px" height="150px"/' -e 's/<path /<path fill="#FFFFFF" /' "$1.tmp" > "$1.svg"
rm "$1.tmp"