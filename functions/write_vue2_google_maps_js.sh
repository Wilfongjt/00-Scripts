function write_vue2_google_maps_js() {
    #################
    # write an initial plugins/vue2_google_maps.js view file to the app
    # $1 is a output file name  <app-name>/plugins/vue2-google-maps.js
    ############
    local file_name=$1

    echo $file_name
    echo "import Vue from 'vue'" > $file_name
    echo "import * as VueGoogleMaps from '~/node_modules/vue2-google-maps/src/main'" >> $file_name

    echo "" >> $file_name
    echo "Vue.use(VueGoogleMaps, {" >> $file_name
    echo "  load: { key: process.env.GOOGLE_MAPS_JAVASCRIPT_API_KEY }" >> $file_name
    echo "})" >> $file_name

}

#pageFile="files/google-maps.vue"
#if [ ! -f $pageFile ]; then
#  write_google_maps_vue $pageFile
#else
#  echo "File exists, can't write file $pageFile"
#fi
