FROM node:20-slim

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci --production

COPY main.js ./
COPY views views
COPY public public

ARG PORT=3000 INSTANCE_NAME="dov-bear" INSTANCE_HASH="red"

EXPOSE ${PORT}

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -s -f http://localhost:${PORT}/healthz > dev/null || exit 1

ENTRYPOINT node main.js -p ${PORT} -n ${INSTANCE_NAME} --hash ${INSTANCE_HASH}