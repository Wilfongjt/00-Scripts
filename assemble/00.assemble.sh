 #!/bin/bash
echo ""
echo ""
echo ""
# load functions
source ../functions/delete_blank_lines_file.sh
source ../functions/insert_after_file.sh
source ../functions/has_value.sh
source ../functions/write_google_maps_vue.sh
source ../functions/write_vue2_google_maps_js.sh

# intall npx is included with NPM
app_name="adopt_a_drain"
# move to umbrella folder
cd ../..

########
# setup nuxtjs vue app
######

source ./00-Scripts/assemble/01.01.nuxt.sh

####################
# APP FOLDER
####################

cd "$app_name/"

####################
# LINTING
###############

source ../00-Scripts/assemble/01.02.lint.sh

####################
# DOTENV
####################

source ../00-Scripts/assemble/01.03.env.sh

#####################
# GOOGLE MAPS
######################

source ../00-Scripts/assemble/01.04.google.map.sh

####################
# Delete blank lines
###############
echo "remove blanks from pages/index.vue"

delete_blank_lines_file "pages/index.vue"


#rc=$(has_value "$app_name/nuxt.config.js" "env:")
#echo "has_value is $rc"
#if [ $rc -eq 0 ]; then
#    echo "add env variables"
#    rpl="  mode: 'universal',"
#    rpls=()
#     rpls=("  env: {")
#    rpls+=("    DB_HOST: process.env.DB_HOST,")
#    rpls+=("    DB_USER: process.env.DB_USER,")
#    rpls+=("    GOOGLE_MAPS_JAVASCRIPT_API_KEY: process.env.GOOGLE_MAPS_JAVASCRIPT_API_KEY,")
#    rpls+=("    DW_USER: process.env.DW_USER,")
#    rpls+=("    DW_AUTH_TOKEN: process.env.DW_AUTH_TOKEN,")
#    rpls+=("    OPEN_SOURCE: process.env.OPEN_SOURCE")
#    rpls+=("  },")
#   insert_after_file "$app_name/nuxt.config.js" "$rpl" "${rpls[@]}"
#fi

echo " "
echo " "

##############
#
###########
if [ ! -f ".env" ]; then
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
    echo "  Create an .env file in the app folder"
    echo "  start the app "
    echo "  npm run dev"
    echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"

else

  #####################
  # Launch the app
  ###########

  npm run dev
fi
