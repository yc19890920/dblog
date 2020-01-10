#!/usr/bin/env bash


install(){
    mkdir -p $(pwd)/log

    docker build -t dblog:1.0 -f Dockerfile .

    docker run -d \
        -p 0.0.0.0:5000:5000 \
        -v $(pwd)/log:/app/log \
        --name dblog \
        dblog:1.0
}

start(){
    docker stop dblog
}

stop(){
    docker stop dblog
}

bak_data(){
    echo "mysqldump -u dblog -P 3306 -p dblog > $(pwd)/doc/data.sql"
   mysqldump -u dblog -P 3306 -p dblog > $(pwd)/doc/data.sql
}

case "$1" in
    "install"|"i")
        install;
        ;;
    "start"|"s")
        start;
        ;;
    "stop")
        stop;
        ;;
    "bak")
        bak_data;
        ;;
    *)
        echo "Usage: $0 {install|start|stop|bak}"
        ;;
esac
