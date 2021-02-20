server {
  charset utf-8; #使用utf-8字符
  listen 80; #监听Http 80端口
  server_name miraclove.com;  # 改成你的域名或IP

  location /media {
    alias /Github/PyWeb/Src/media; #Django的media静态目录
  }
  location /static {
    alias /Github/PyWeb/Src/static; #Django的static静态目录
  }
  location / {
    proxy_set_header Host $host;
    proxy_pass http://127.0.0.1:8000;  # 如果上面都匹配不上，交给Django处理
  }
}