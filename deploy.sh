DATE=`date +%y%m%d`
FOLDER=/tmp/${DATE}


mkdir ${FOLDER}

cp -R base ${FOLDER}/${DATE}_SIRHAN_Utentes
cp -R base ${FOLDER}/${DATE}_SIRHAS_Utentes
cp -R base ${FOLDER}/${DATE}_DPMAIP_SIAM

mv ${FOLDER}/${DATE}_SIRHAN_Utentes/base.exe ${FOLDER}/${DATE}_SIRHAN_Utentes/SIRHAN_Utentes.exe
mv ${FOLDER}/${DATE}_SIRHAS_Utentes/base.exe ${FOLDER}/${DATE}_SIRHAS_Utentes/SIRHAS_Utentes.exe
mv ${FOLDER}/${DATE}_DPMAIP_SIAM/base.exe ${FOLDER}/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe
winresourcer --operation=Update --exeFile=${FOLDER}/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe --resourceType=Icongroup --resourceName=100  --resourceFile=./base-dpmaip/resources/app/window_icon.ico

sed -i "s/\"version\":.*/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json
sed -i "s/\"name\":.*/\"name\": \"SIRHAN_Utentes\",/" ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json
sed -i "s/\"version\":.*/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json
sed -i "s/\"name\":.*/\"name\": \"SIRHAS_Utentes\",/" ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json
sed -i "s/\"version\":.*/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/package.json
sed -i "s/\"name\":.*/\"name\": \"DPMAIP_SIAM\",/" ${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/package.json

# sed -i "s/title: 'Gestão de Utentes'/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/main.js
# sed -i "s/title: 'Gestão de Utentes'/\"version\": \"`date +%Y.%m.%d`\",/" ${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/main.js
sed -i "s/title: 'Gestão de Utentes'/title: 'DPMAIP: Sistema Información Acuicultura'/" ${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/main.js




wget https://github.com/iCarto/utentes-api/archive/master.zip -O /tmp/utentes-api.zip
unzip /tmp/utentes-api.zip -d /tmp/
# mv /tmp/utentes-api-master /tmp/utentes-api
cp -R /tmp/utentes-api-master ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api
cp -R /tmp/utentes-api-master ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api
cp -R /tmp/utentes-api-master ${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api

wget https://github.com/iCarto/utentes-ui/archive/master.zip -O /tmp/utentes-ui.zip
unzip /tmp/utentes-ui.zip -d /tmp/
# mv /tmp/utentes-ui-master /tmp/utentes-ui
cp -R /tmp/utentes-ui-master ${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/utentes/static/utentes-ui
cp -R /tmp/utentes-ui-master ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/utentes/static/utentes-ui
wget https://github.com/iCarto/utentes-ui/archive/dpmaip.zip -O /tmp/utentes-ui.zip
unzip /tmp/utentes-ui.zip -d /tmp/
cp -R /tmp/utentes-ui-dpmaip  ${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/utentes/static/utentes-ui



sed -i "s/aranorte/arasul/" ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini
sed -i "s/aranorte/arasul/" ${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini


sed -i "s/aranorte/dpmaip/" ${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini
sed -i "s/aranorte/dpmaip/" ${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini


cp -R ./base-aranorte/* ${FOLDER}/${DATE}_SIRHAN_Utentes/
cp -R ./base-arasul/* ${FOLDER}/${DATE}_SIRHAS_Utentes/
cp -R ./base-dpmaip/* ${FOLDER}/${DATE}_DPMAIP_SIAM/

[ -f secret.sh ] && bash secret.sh $FOLDER $DATE
