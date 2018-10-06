# VueJS Seed App
Generates a preconfigured vuejs application.  
## Features
* nuxtjs
* es-lint
* eslint-plugin-vue
* eslint-config-prettier
* dotenv
* @nuxtjs/dotenv
* vue2-google-maps
* sass-loader 
* webpack


## Set Application Name
Change app_name to your app name. 
```
# 00.assemble.sh

app_name="your-app-name"
```
Don't worry you can run this script more than once without harm. 

## Environment Variables

### Enable google maps with your dev or prod google map api key
echo GOOGLE_MAPS_JAVASCRIPT_API_KEY=<get-google-map-api-key> >> .env

### Database
echo DB_HOST=db > .env
echo DB_USER=postgres >> .env

### Provide an owner id for the drain data.
echo DW_USER=citizenlabs

### Enable data.world data with your "read/write" api token
echo DW_AUTH_TOKEN=<get-data.world-api-token> >> .env

### URL for drain data
echo OPEN_SOURCE=https://api.data.world/v0/sql/citizenlabs/grb-storm-drains >> .env

