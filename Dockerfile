# Use a lightweight Node.js image based on Alpine Linux to keep the image size small
FROM node:18-alpine

# Set the working directory inside the container to /app
# This is where all our application files will live
WORKDIR /app

# Copy package.json and package-lock.json files to the container
# We do this first to take advantage of Docker's layer caching
COPY package*.json ./

# Install dependencies listed in package.json
# This step creates a separate layer, so if dependencies don't change, Docker can cache it
RUN npm install

# Now copy the rest of the application code to the working directory in the container
COPY . .

# Inform Docker that the container will listen on port 3000
# This is the port our Node.js app will run on
EXPOSE 3000

# Define the command to run our application
# In this case, we use "node app.js" to start the server
CMD ["node", "app.js"]
