### BUILDER
FROM docker.io/floryn90/hugo:0.129.0-ext-alpine-ci AS hugo

WORKDIR /src
ADD . /src
RUN npm ci && hugo -d /target

### RUNTIME
FROM docker.io/nginx AS runtime
COPY --from=hugo /target /usr/share/nginx/html
