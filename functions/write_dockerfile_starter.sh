function write_dockerfile_starter() {
    #########
    # Write a starter Dockerfile
    # writes to current folder
    ##############
    local file_name="Dockerfile"
    echo "write Dockerfile"
    echo "..."
    echo "FROM node:8.11.3" > $file_name
    echo "..."
    echo "ENV HOST 0.0.0.0" >> $file_name
    echo "WORKDIR /usr/src/app" >> $file_name
    echo "..."
    echo "ADD . /usr/src/app" >> $file_name
    echo "..."
    echo "RUN npm install" >> $file_name
    echo "..."
    echo "# ARG APP_NODE_ENV=production" >> $file_name
    echo "..."
    echo "# ENV NODE_ENV ${NODE_ENV}" >> $file_name
    echo "..."
    echo "RUN npm run build" >> $file_name
    echo "..."
    echo "EXPOSE 3000" >> $file_name
    echo "..."
    echo "CMD ['npm', 'run', 'start']" >> $file_name
}
