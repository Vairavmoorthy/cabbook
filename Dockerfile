FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Install build tools and Python
RUN apk update && apk add --no-cache \
    build-base \
    python3


# Set Python 3 as the default Python version
RUN ln -sf python3 /usr/bin/python

# Copy package.json and package-lock.json
COPY Book-My-cab/package*.json ./

RUN npm install bcrypt

# Install npm packages
#RUN npm install
RUN npm install nodemon --save-dev


# Copy the rest of the application files
COPY Book-My-cab/ ./

# Specify the command to start the application
CMD ["npm", "start"]

