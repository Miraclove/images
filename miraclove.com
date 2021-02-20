server {
  charset utf-8;
  listen 0.0.0.0:80;
  server_name miraclove.com;

  location /media {
    alias /Github/PyWeb/Src/media;
  }
  location /static {
    alias /Github/PyWeb/Src/static;
  }
  location / {
    proxy_set_header Host $host;
    proxy_pass http://0.0.0.0:8000;
  }
}