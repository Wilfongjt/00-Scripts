 #!/bin/bash
echo ""
echo ""
echo ""

source ../functions/delete_blank_lines_file.sh
source ../functions/insert_after_file.sh
source ../functions/has_value.sh
source ../functions/write_google_maps_vue.sh
source ../functions/write_vue2_google_maps_js.sh
# intall npx is included with NPM
app_name="seed_11"
# move to parent/umbrella folder
cd ../..

echo "---------------------------------------------------"
echo "Setup Nuxt Vuejs Application with webpack: "
echo "---------------------------------------------------"

if [ -d "$app_name" ]; then

    if [ -f "$app_name/package.json" ]; then
        echo "Already initialized"
    else
        echo "no package.json file"
        echo "npx create-nuxt-app $app_name"
        npx create-nuxt-app $app_name
        # change the app-name to something appropritate
        # Project name
        # Project description
        # Use a custom server framework: express
        # Use a custom UI framework: none
        # Choose rendering mode: universal
        # Use axios module: yes
        # Use eslint: no
        # Use prettier: no
#       echo "npm i --save-dev dotenv"
#       npm i --save-dev dotenv

    fi
else
    echo "new app"
    npx create-nuxt-app $app_name
    # change the app-name to something appropritate
    # Project name
    # Project description
    # Use a custom server framework: none
    # Use a custom UI framework: none
    # Choose rendering mode: Universal
    # Use axios module: yes
    # Use eslint: no
    # Use prettier: no
fi

####################
# CHANGE FOLDER
####################

cd "$app_name/"

###################
# replaces eslint
###################

npm install eslint@3.14.1

###################
# replaces eslint-plugin-vue
###################

npm install eslint-config-prettier@3.1.0

####################
# DOTENV
####################
echo "--------------------------"
echo " Environment variables"
echo "--------------------------"

npm i --save-dev dotenv
npm install --save-dev @nuxtjs/dotenv

#####################
# GOOGLE MAPS
######################
echo "--------------------------"
echo " Google Maps"
echo "--------------------------"
# should be in app folder app dir
# npm install dotenv
npm install vue2-google-maps



#############
# sass-loader
############
echo "--------------------------"
echo " sass-loader"
echo "--------------------------"
npm install sass-loader node-sass webpack --save-dev


#######################
# CREATE HELPER SCRIPTS
####################
echo "--------------------------"
echo " Helper scripts"
echo "--------------------------"

## move to umbrella folder from app folder
cd ..


# make folder to stash helper scripts
mkdir $app_name/scripts/

########################
# launch from app/scripts/
######################
echo "#!/bin/bash" > $app_name/scripts/run.dev.sh
echo "cd .." >> $app_name/scripts/run.dev.sh
echo "npm run dev" >> $app_name/scripts/run.dev.sh

chmod 755 $app_name/scripts/run.dev.sh

########################
# launch from 00.Scripts/
######################
echo "#!/bin/bash" > 00-Scripts/00.run.$app_name.sh
echo "cd ../$app_name" >> 00-Scripts/00.run.$app_name.sh
echo "npm run dev" >> 00-Scripts/00.run.$app_name.sh

chmod 755 00-Scripts/00.run.$app_name.sh

echo "--------------------------"
echo " dont forget to remove the extra space in pages/index.vue"
echo "--------------------------"
# move to app folder

echo "$app_name/pages/index.vue"
delete_blank_lines_file "$app_name/pages/index.vue"

#######################
# INTEGRATE DOTENV
#############

echo "--------------------------"
echo " update nuxt.config.js"
echo "--------------------------"

rc=$(has_value "$app_name/nuxt.config.js" "@nuxtjs/dotenv")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
    echo "add @nuxtjs/dotenv"
    rpl="  modules: ["
    rpls=()
    rpls+=("    '@nuxtjs/dotenv',")
    insert_after_file "$app_name/nuxt.config.js" "$rpl" "${rpls[@]}"
fi

rc=$(has_value "$app_name/nuxt.config.js" "require('dotenv').config()")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
    echo "add if NOT prod then launch dotenv"
    rpl="const pkg = require('./package')"
    rpls=()
    rpls=("/* do not use dotenv in production env  */")
    rpls+=("if (process.env.NODE_ENV !== 'production') require('dotenv').config()")
#   rpls+=("console.log(process.env.NODE_ENV)")
    insert_after_file "$app_name/nuxt.config.js" "$rpl" "${rpls[@]}"

fi

rc=$(has_value "$app_name/nuxt.config.js" "env:")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
    echo "add env variables"
    rpl="  mode: 'universal',"
    rpls=()
     rpls=("  env: {")
    rpls+=("    DB_HOST: process.env.DB_HOST,")
    rpls+=("    DB_USER: process.env.DB_USER,")
    rpls+=("    GOOGLE_MAPS_JAVASCRIPT_API_KEY: process.env.GOOGLE_MAPS_JAVASCRIPT_API_KEY,")
    rpls+=("    DW_USER: process.env.DW_USER,")
    rpls+=("    DW_AUTH_TOKEN: process.env.DW_AUTH_TOKEN,")
    rpls+=("    OPEN_SOURCE: process.env.OPEN_SOURCE")
    rpls+=("  },")


    insert_after_file "$app_name/nuxt.config.js" "$rpl" "${rpls[@]}"
fi

###############
# INTEGRATE GOOGLE MAPs
###############
# INSERT PLUGIN REFERENCE
rc=$(has_value "$app_name/nuxt.config.js" "~/plugins/vue2-google-maps")
if [ $rc -eq 0 ]; then
    echo "Put new plugins here"
    rpl="  plugins: ["
    rpls=()
#    rpls=("    '~/plugins/vue2-google-maps'")
    rpls=("    { src: '~/plugins/vue2-google-maps.js' }")

    insert_after_file "$app_name/nuxt.config.js" "$rpl" "${rpls[@]}"
fi

####################
# PLUGIN GOOGLE
############
pageFile="$app_name/plugins/vue2-google-maps.js"
if [ ! -f $pageFile ]; then
  write_vue2_google_maps_js $pageFile
else
  echo "File exists, can't write file $pageFile"
fi

##########
# Page
# assume the develper is going to change this file and don't overwrite if exists
# delete file if you need to replace it
#########
pageFile="$app_name/pages/google-maps.vue"
if [ ! -f $pageFile ]; then
  write_google_maps_vue $pageFile
else
  echo "File exists, can't write file $pageFile"
fi

echo " "
echo " "

##############
#
###########
if [ ! -f "$app_name/.env" ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "  Create an .env file in the app folder"
    echo "  start the app "
    echo "  npm run dev"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

else

  #####################
  # Launch the app
  ###########
  cd "$app_name/"
  npm run dev
fi
