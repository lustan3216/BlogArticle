```
upstream inforcharge_sock {
        server unix:/var/tmp/nginx.sock fail_timeout=0;
}

server {
        listen 80 default_server;
        listen [::]:80 default_server ipv6only=on;

        root /home/deployer/inforcharge/current/public;

        # Make site accessible from http://localhost/
        server_name 54.169.174.47;


        location / {
          proxy_redirect     off;
          proxy_set_header   Host $host;
          proxy_set_header   X-Forwarded-Host $host;
          proxy_set_header   X-Forwarded-Server $host;
          proxy_set_header   X-Real-IP        $remote_addr;
          proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_buffering    on;
          proxy_pass         http://inforcharge_sock;
        }

        location ~ ^/assets/ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }

        location ~ ^/data/ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }

       location ~* \.(?:htm|pdf|svg|ico)$ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }
}

server {
        listen 443;
        listen [::]:443 ipv6only=on;
        server_name 54.169.174.47;

        root /home/deployer/inforcharge/current/public;

        ssl on;
        ssl_certificate /etc/nginx/ssl/ssl-bundle2.crt;
        ssl_certificate_key /etc/nginx/ssl/inforcharge.key;

        ssl_protocols SSLv3 TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers "HIGH:!aNULL:!MD5 or HIGH:!aNULL:!MD5:!3DES";
        ssl_prefer_server_ciphers on;

        location ~ ^/assets/ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }

        location ~ ^/data/ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }

        location / {
          proxy_redirect     off;
          proxy_set_header   Host $host;
          proxy_set_header   X-Forwarded-Host $host;
          proxy_set_header   X-Forwarded-Server $host;
          proxy_set_header   X-Real-IP        $remote_addr;
          proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_buffering    on;
          proxy_pass         http://inforcharge_sock;
        }

       location ~* \.(?:htm|pdf|ico|svg)$ {
          expires 1y;
          add_header Cache-Control public;
          add_header ETag "";
          break;
        }

        location /download-app/c209r {
                return 301 https://www.inforcharge.com/download/c209r;
        }
        location /privacy-policy/c98r {
                return 301 https://www.inforcharge.com/privacy/c98r;
        }
        location /rate/c1r55 {
                return 301 https://www.inforcharge.com/rate-x/c1r55;
        }

}
```