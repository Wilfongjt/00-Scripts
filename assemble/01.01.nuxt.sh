 #!/bin/bash
echo ""
echo $app_name
echo ""



echo "---------------------------------------------------"
echo "$app_name Nuxt Vuejs Application with webpack: "
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

echo "nuxt out"
