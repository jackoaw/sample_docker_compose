# First we build the images
docker-compose -f docker-compose-prod.yml build
# Then we upload them to our image repository
docker-compose -f docker-compose-prod.yml push
