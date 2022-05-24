FROM docker.io/library/node:17.4.0-bullseye-slim@sha256:127e7abf453152266a11ccbed1510dff5241b671855e32611d19fb348a8f4a41 AS base

# Define the current directory based on defacto community standard
WORKDIR /usr/src/app

FROM base AS deps

# Pull all depedencies
COPY package.json yarn.lock ./
RUN --mount=type=cache,id=yarn-cache,sharing=locked,target=/usr/local/share/.cache/yarn \
  yarn install --frozen-lockfile --production

FROM deps AS source

# Copy source
COPY . .

FROM source

# Build application
ENV NODE_ENV=production
RUN npm run build

# Switch to the node default non-root user
USER node

# Default HTTP Port
EXPOSE 1337

# Production entrypoint
CMD [ "npm", "run", "start" ]
