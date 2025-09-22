#!/bin/bash


#!/bin/bash
echo "Wisdom served on port 4499..."
# Keep the container alive so we can exec
while true; do sleep 10; done


SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
	read line
	echo $line
}

handleRequest() {
    # 1) Process the request
	get_api
	mod=`fortune`

cat <<EOF > $RSPFILE
HTTP/1.1 200


<pre>`cowsay $mod`</pre>
EOF
}

prerequisites() {
    for cmd in cowsay fortune; do
        if ! command -v $cmd >/dev/null 2>&1; then
            echo "$cmd missing, install prerequisites."
            exit 1
        fi
    done
}


main() {
	prerequisites
	echo "Wisdom served on port=$SRVPORT..."

	while [ 1 ]; do
		cat $RSPFILE | nc -lN $SRVPORT | handleRequest
		sleep 0.01
	done
}

main
