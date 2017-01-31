DATE=`date +%y%m%d`
FOLDER=/tmp/${DATE}


mkdir ${FOLDER}

cp -R base ${FOLDER}/${DATE}_SIRHAN_Utentes
cp -R base ${FOLDER}/${DATE}_SIRHAS_Utentes

mv ${FOLDER}/${DATE}_SIRHAN_Utentes/base.exe ${FOLDER}/${DATE}_SIRHAN_Utentes/SIRHAN_Utentes.exe
mv ${FOLDER}/${DATE}_SIRHAS_Utentes/base.exe ${FOLDER}/${DATE}_SIRHAS_Utentes/SIRHAS_Utentes.exe

sed -i "s/\"version\":.*/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json
sed -i "s/\"name\":.*/\"name\": \"SIRHAN_Utentes\",/" ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json
sed -i "s/\"version\":.*/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json
sed -i "s/\"name\":.*/\"name\": \"SIRHAS_Utentes\",/" ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json

rm ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/splash_SIRHAN.png
mv ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/splash_SIRHAS.png ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/splash.png

rm ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/splash_SIRHAS.png
mv ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/splash_SIRHAN.png ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/splash.png


wget https://github.com/iCarto/utentes-api/archive/master.zip -O /tmp/utentes-api.zip
unzip /tmp/utentes-api.zip -d /tmp/
# mv /tmp/utentes-api-master /tmp/utentes-api
cp -R /tmp/utentes-api-master ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api
cp -R /tmp/utentes-api-master ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api

wget https://github.com/iCarto/utentes-ui/archive/master.zip -O /tmp/utentes-ui.zip
unzip /tmp/utentes-ui.zip -d /tmp/
# mv /tmp/utentes-ui-master /tmp/utentes-ui
cp -R /tmp/utentes-ui-master ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/utentes/static/utentes-ui
cp -R /tmp/utentes-ui-master ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui

wget https://github.com/iCarto/leaflet-table/archive/master.zip -O /tmp/leaflet-table.zip
unzip /tmp/leaflet-table.zip -d /tmp/
rm -rf ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/utentes/static/utentes-ui/lib/leaflet-table
rm -rf ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui/lib/leaflet-table
cp -R /tmp/leaflet-table-master ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/utentes/static/utentes-ui/lib/leaflet-table
cp -R /tmp/leaflet-table-master ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui/lib/leaflet-table


cp -R ./utentes-ui-arasul/img ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui/
cp -R ./utentes-ui-arasul/offline ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui/
sed -i "s/aranorte/arasul/" ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini
sed -i "s/aranorte/arasul/" ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini

cp ./node-interaction.js.aranorte ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/utentes/static/utentes-ui/node-interaction.js
cp ./node-interaction.js.arasul ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui/node-interaction.js
