```json
 server {
     listen      80;
     server_name kibana.inforcharge.com;
     rewrite     ^   https://$server_name$request_uri? permanent;
 
 }
 server{
     listen 443 ssl http2;
     server_name kibana.inforcharge.com 104.199.142.24;
 
     #auth_basic "Restricted Access";
     #auth_basic_user_file /etc/nginx/.kibana-user;
 
     ssl on;
     ssl_certificate /etc/nginx/ssl/inforcharge.crt;
     ssl_certificate_key /etc/nginx/ssl/inforcharge.key;
     ssl_ciphers EECDH+CHACHA20:EECDH+AES128:RSA+AES128:EECDH+AES256:RSA+AES256:EECDH+3DES:RSA+3DES:!MD5;
     ssl_prefer_server_ciphers on;
 
     location /dashboard/ {
 #        rewrite ^/kibana/(.*) /$1 break;
         proxy_pass http://localhost:5601/;
         proxy_redirect http://host:5601/ /dashboard/;
         proxy_http_version 1.1;
         proxy_set_header Upgrade $http_upgrade;
         proxy_set_header Connection 'upgrade';
         proxy_set_header Host $host;
         proxy_cache_bypass $http_upgrade;
     }
   location / {
        proxy_pass http://localhost:9200/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
   location /logstash/ {
        add_header Access-Control-Allow-Origin *;
        default_type application/json;
        proxy_pass http://localhost:8080/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
        add_header 'Access-Control-Allow-Headers' 'Content-Type';
    }


}

```

```json
network.bind_host: localhost
network.publish_host: kibana.inforcharge.com
#transport.publish_port: 443
#transport.tcp.port: 443
# Set a custom port for HTTP:
#
http.publish_port: 443
http.port: 9200
#transport.tcp.port: 9201

```


```json
input {
  http {
    port => 8080
    host => "127.0.0.1"
  }
}
filter{
  #  ruby {code => "require 'pry'; binding.pry"}
   if [message] =~ /^\s*$/ {
     drop { }
   }

    split{   field => "results" }
    mutate {
     rename => [
                    "[results][sn]", "sn",
                    "[results][ad_id]", "ad_id",
                    "[results][ad_type]", "ad_type",
                    "[results][faces_length]", "faces_length",
                    "[results][male]", "male",
                    "[results][female]", "female",
                    "[results][average_age]", "average_age",
                    "[results][ad_faces_price]", "ad_faces_price",
                    "[results][ad_impression_price]", "ad_impression_price",
                    "[results][ad_calculated_faces_price]", "ad_calculated_faces_price",
                    "[results][ad_click_price]", "ad_click_price",
                    "[results][faces_data]", "faces_data"
            ]
            remove_field => "results"
    }
}
output{
  #stdout { codec => rubydebug }
 # if "_split_type_failure" not in [tags] {
  elasticsearch {
    index => "ads-%{+YYYY.MM.dd}"

```