# Specify a base image
FROM node:alpine

# Set the working directory. If it's not there, it will be created
WORKDIR /usr/app

# Copy everything from the current working directory to the container
COPY ./package.json ./
# Install some dependencies
RUN npm install

# This second copy to avoid re-running npm install again (unnecessarily) when 
# we only change the code (in this setup, npm install will run only if there is a change to package.json)
COPY ./ ./

# Default command
CMD ["npm", "start"]