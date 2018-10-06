echo "01.03.env"

####################
# DOTENV
####################
echo "--------------------------"
echo " Environment variables"
echo "--------------------------"

npm i --save-dev dotenv
npm install --save-dev @nuxtjs/dotenv

rc=$(has_value "nuxt.config.js" "@nuxtjs/dotenv")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
  echo "add @nuxtjs/dotenv"
  rpl="  modules: ["
  rpls=()
  rpls+=("    '@nuxtjs/dotenv',")
  insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"
fi


rc=$(has_value "nuxt.config.js" "require('dotenv').config()")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
echo "add if NOT prod then launch dotenv"
rpl="const pkg = require('./package')"
rpls=()
rpls=("/* do not use dotenv in production env  */")
rpls+=("if (process.env.NODE_ENV !== 'production') require('dotenv').config()")

insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"

fi

if [ ! -f ".env" ]; then
    echo "DEVSITE=dev.site" > ".env"
fi

rc=$(has_value "nuxt.config.js" "env:")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
  echo "add env variables"
  rpl="  mode: 'universal',"
  rpls=()
  rpls=("  env: {")
  rpls+=("  },")
  insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"
fi


rc=$(has_value "nuxt.config.js" "DEVSITE:")
echo "has_value is $rc"
if [ $rc -eq 0 ]; then
  echo "add env variables"
  rpl="  env: {"
  rpls=()

  rpls=("    DEVSITE: 'dev.site'")

  insert_after_file "nuxt.config.js" "$rpl" "${rpls[@]}"
fi





echo "env out"
