sudo docker run --rm -d -it --name test_env tsw303005/linux-setup:latest bash

test_id=$(sudo docker ps -aqf "name=test_env")

sudo docker exec -it $test_id /bin/bash
