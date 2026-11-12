include ../../../make.inc
all_commands:build_docker_image run_docker_image

# YOUR CODE HERE
 build_docker_image:
	docker build -t "${DOCKER_IMAGE_NAME}" -f Dockerfile .

 run_docker_image:
	docker run --rm -it -e PORT=${PORT} -p 8080:8080 ${DOCKER_IMAGE_NAME}

 push_docker_image:
#docker tag "$IMAGE_NAME:$IMAGE_TAG" "$HOSTNAME/$PROJECT_ID/$REPOSITORY/$IMAGE_NAME:$IMAGE_TAG"
	docker push "${DOCKER_IMAGE_NAME}"



deploy_docker_image:
	gcloud run deploy nonroot-image-fastapi \
  --image europe-west1-docker.pkg.dev/eray-erese-wagon-bootcamp/docker-hub/nonroot-image-fastapi:dev \
  --region europe-west1 \
  --allow-unauthenticated
