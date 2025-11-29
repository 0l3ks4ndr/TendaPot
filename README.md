1. Build the image with: docker build -t tendapot .
2. Run the docker with the following command: docker run -d -p80:80 -v /full_path/volume/local/path/local_logs_mount_folder:/var/log/nginx-real imageID (Mount docker logs folder to host local folder)
3. Copy nginx_tendapot to /etc/logrotate.d/ of the host in which the docker is running
4. Run logrotate -f /etc/logrotate.d/nginx_tendapot


