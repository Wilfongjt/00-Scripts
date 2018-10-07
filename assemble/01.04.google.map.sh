echo "01.04.google.map"
echo "01.04.sass-loader"
echo "--------------------------"
echo " Google Maps"
echo "--------------------------"
# should be in app folder app dir
# npm install dotenv
npm install vue2-google-maps


############
# sass-loader
############
echo "--------------------------"
echo " sass-loader"
echo "--------------------------"
npm install sass-loader node-sass webpack --save-dev


###############
# INTEGRATE GOOGLE MAPs
###############
# INSERT PLUGIN REFERENCE
rc=$(has_value "nuxt.config.js" "~/plugins/vue2-google-maps")
if [ $rc -eq 0 ]; then
  echo "Put new plugins here"
  rpl="  plugins: ["
  rpls=()
  #    rpls=("    '~/plugins/vue2-google-maps'")
  rpls=("    { src: '~/plugins/vue2-google-maps.js' }")

  insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"
fi
echo "A"
####################
# PLUGIN GOOGLE
############
pageFile="plugins/vue2-google-maps.js"
if [ ! -f $pageFile ]; then
  write_vue2_google_maps_js $pageFile
else
  echo "File exists, can't write file $pageFile"
fi
echo "B"
##########
# Page
# assume the develper is going to change this file and don't overwrite if exists
# delete file if you need to replace it
# stop creation add .txt to google-maps.vue i.e., google-maps.vue.txt
#########
pageFile="pages/google-maps.vue"
if [ ! -f $pageFile ]; then
    if [ ! -f "$pageFile.txt" ]; then
        write_google_maps_vue $pageFile
    fi
else
  echo "File exists, can't write file $pageFile"
fi

echo "C"

###############
# Environment Varible
###############
rc=$(has_value "nuxt.config.js" "GOOGLE_MAPS_JAVASCRIPT_API_KEY:")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
  echo "add env variable GOOGLE_MAPS_JAVASCRIPT_API_KEY"
  rpl="  env: {"
  rpls=()
  rpls+=("    GOOGLE_MAPS_JAVASCRIPT_API_KEY: process.env.GOOGLE_MAPS_JAVASCRIPT_API_KEY,")
  insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"
fi
echo "D"
rc=$(has_value ".env" "GOOGLE_MAPS_JAVASCRIPT_API_KEY")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
  echo "add env variable GOOGLE_MAPS_JAVASCRIPT_API_KEY"
  echo "GOOGLE_MAPS_JAVASCRIPT_API_KEY=<go-get-key-from-google>" >> .env
fi

echo "google.map out"
