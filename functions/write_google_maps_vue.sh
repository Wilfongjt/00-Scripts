function write_google_maps_vue() {
    #################
    # write an initial google-maps.vue view file to the app
    # $1 is a output file name  <app-name>/pages/google-maps.vue
    ############
    local file_name=$1

    echo $file_name

    echo "<template>" > $file_name
    echo "  <gmap-map" >> $file_name
    echo '    v-bind:center = "center"' >> $file_name
    echo '    v-bind:zoom="5"' >> $file_name
    echo '    style="height: 225px"' >> $file_name
    echo "  >" >> $file_name
    echo "  <gmap-marker" >> $file_name
    echo '    v-for="(item, index) in markers"' >> $file_name
    echo '    v-bind:key="index"' >> $file_name
    echo '    v-bind:position="item.position"' >> $file_name
    echo '    v-on:click="center=item.position"/>' >> $file_name
    echo "  </gmap-map>" >> $file_name
    echo "</template>" >> $file_name

    echo "<script>" >> $file_name
    echo "export default {" >> $file_name
    echo "  data() {" >> $file_name
    echo "    return {" >> $file_name
    echo "      center: { lat: -3.350235, lng: 111.995865 }," >> $file_name
    echo "      markers: [" >> $file_name
    echo "        { position: { lat: -0.48585, lng: 117.1466 } }," >> $file_name
    echo "        { position: { lat: -6.21462, lng: 106.84513 } }" >> $file_name
    echo "      ]" >> $file_name
    echo "    }" >> $file_name
    echo "  }" >> $file_name
    echo "}" >> $file_name
    echo "</script>" >> $file_name

    echo '<style lang="scss" scoped>' >> $file_name
    echo ".vue-map-container {" >> $file_name
    echo "  height: 450px;" >> $file_name
    echo "  max-width: 992px;" >> $file_name
    echo "  width: 100%;" >> $file_name
    echo "}" >> $file_name
    echo "</style>" >> $file_name
}

#pageFile="files/google-maps.vue"
#if [ ! -f $pageFile ]; then
#  write_google_maps_vue $pageFile
#else
#  echo "File exists, can't write file $pageFile"
#fi
