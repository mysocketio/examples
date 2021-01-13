#export ACCESS_KEY_ID="xxxx"
#export SECRET_ACCESS_KEY="xxx"

docker run -i -v $(pwd)/grafana.ini:/etc/grafana/grafana.ini \
   -e "GF_AWS_PROFILES=default" \
   -e "GF_AWS_default_ACCESS_KEY_ID=$ACCESS_KEY_ID" \
   -e "GF_AWS_default_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY" \
   -e "GF_AWS_default_REGION=us-east-1" \
   -p 3000:3000 grafana/grafana

