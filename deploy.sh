#!/bin/bash

set -e

WINRESOURCER=node_modules/.bin/winresourcer

DATE=$(date +%y%m%d)
FOLDER=/tmp/${DATE}
FOLDER="/home/fpuga/VirtualBox VMs/shared/${DATE}"

mkdir "${FOLDER}"

cp -R base "${FOLDER}/${DATE}_SIRHAN_Utentes"
cp -R base "${FOLDER}/${DATE}_SIRHAS_Utentes"
cp -R base "${FOLDER}/${DATE}_SIRHAZ_Utentes"
cp -R base "${FOLDER}/${DATE}_DPMAIP_SIAM"

# mv "${FOLDER}"/${DATE}_SIRHAN_Utentes/electron.exe "${FOLDER}"/${DATE}_SIRHAN_Utentes/SIRHAN_Utentes.exe
# "${WINRESOURCER}" --operation=Update --exeFile="${FOLDER}"/${DATE}_SIRHAN_Utentes/SIRHAN_Utentes.exe --resourceType=Icongroup --resourceName=100  --resourceFile=./base/resources/app/sixhiara_50.ico
# mv "${FOLDER}"/${DATE}_SIRHAS_Utentes/electron.exe "${FOLDER}"/${DATE}_SIRHAS_Utentes/SIRHAS_Utentes.exe
# "${WINRESOURCER}" --operation=Update --exeFile="${FOLDER}"/${DATE}_SIRHAS_Utentes/SIRHAS_Utentes.exe --resourceType=Icongroup --resourceName=100  --resourceFile=./base/resources/app/sixhiara_50.ico
# mv "${FOLDER}"/${DATE}_DPMAIP_SIAM/electron.exe "${FOLDER}"/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe
# "${WINRESOURCER}" --operation=Update --exeFile="${FOLDER}"/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe --resourceType=Icongroup --resourceName=100  --resourceFile=./base-dpmaip/resources/app/window_icon.ico

mv "${FOLDER}/${DATE}_SIRHAN_Utentes/base.exe" "${FOLDER}/${DATE}_SIRHAN_Utentes/SIRHAN_Utentes.exe"
mv "${FOLDER}/${DATE}_SIRHAS_Utentes/base.exe" "${FOLDER}/${DATE}_SIRHAS_Utentes/SIRHAS_Utentes.exe"
rm "${FOLDER}/${DATE}_DPMAIP_SIAM/base.exe"
# mv "${FOLDER}/${DATE}_DPMAIP_SIAM/base.exe" "${FOLDER}/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe"
# "${WINRESOURCER}" --operation=Update --exeFile="${FOLDER}/${DATE}_DPMAIP_SIAM/DPMAIP_SIAM.exe" --resourceType=Icongroup --resourceName=100  --resourceFile=./base-dpmaip/resources/app/window_icon.ico


sed -i "s/\"version\":.*/\"version\": \"${DATE}\",/" "${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json"
sed -i "s/\"name\":.*/\"name\": \"SIRHAN_Utentes\",/" "${FOLDER}/${DATE}_SIRHAN_Utentes/resources/app/package.json"
sed -i "s/\"version\":.*/\"version\": \"${DATE}\",/" "${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json"
sed -i "s/\"name\":.*/\"name\": \"SIRHAS_Utentes\",/" "${FOLDER}/${DATE}_SIRHAS_Utentes/resources/app/package.json"
sed -i "s/\"version\":.*/\"version\": \"${DATE}\",/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/resources/app/package.json"
sed -i "s/\"name\":.*/\"name\": \"SIRHAZ_Utentes\",/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/resources/app/package.json"
sed -i "s/\"version\":.*/\"version\": \"${DATE}\",/" "${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/package.json"
sed -i "s/\"name\":.*/\"name\": \"DPMAIP_SIAM\",/" "${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/package.json"

# sed -i "s/title: 'Gestão de Utentes'/\"version\": \"`date +%Y.%m.%d`\",/" "${FOLDER}"/${DATE}_SIRHAN_Utentes/resources/app/main.js
# sed -i "s/title: 'Gestão de Utentes'/\"version\": \"`date +%Y.%m.%d`\",/" "${FOLDER}"/${DATE}_SIRHAS_Utentes/resources/app/main.js
sed -i "s/title: 'Gestão de Utentes'/title: 'DPMAIP: Sistema Información Acuicultura'/" "${FOLDER}/${DATE}_DPMAIP_SIAM/resources/app/main.js"




wget https://gitlab.com/icarto/utentes-api/-/archive/aranorte/utentes-api-aranorte.tar.bz2 -O /tmp/utentes-api-aranorte.tar.bz2
tar xjf /tmp/utentes-api-aranorte.tar.bz2 --one-top-level=utentes-api --strip-components=1 -C "${FOLDER}/${DATE}_SIRHAN_Utentes/"

wget https://gitlab.com/icarto/utentes-api/-/archive/arasul/utentes-api-arasul.tar.bz2 -O /tmp/utentes-api-arasul.tar.bz2
tar xjf /tmp/utentes-api-arasul.tar.bz2 --one-top-level=utentes-api --strip-components=1 -C "${FOLDER}/${DATE}_SIRHAS_Utentes/"

wget https://gitlab.com/icarto/utentes-api/-/archive/arazambeze/utentes-api-arazambeze.tar.bz2 -O /tmp/utentes-api-arazambeze.tar.bz2
tar xjf /tmp/utentes-api-arazambeze.tar.bz2 --one-top-level=utentes-api --strip-components=1 -C "${FOLDER}/${DATE}_SIRHAZ_Utentes/"

wget https://gitlab.com/icarto/utentes-api/-/archive/dpmaip/utentes-api-dpmaip.tar.bz2 -O /tmp/utentes-api-dpmaip.tar.bz2
tar xjf /tmp/utentes-api-dpmaip.tar.bz2 --one-top-level=utentes-api --strip-components=1 -C "${FOLDER}/${DATE}_DPMAIP_SIAM/"



sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/production.ini"
sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/development.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/production.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/development.ini"

sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini"
sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini"

sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/production.ini"
sed -i "s/10003/5432/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/development.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/production.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/development.ini"

sed -i "s/10003/5432/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini"
sed -i "s/10003/5432/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini"
sed -i "s/9001/5432/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini"

sed -i "s/ara[ ]*=.*/ara = ARAN/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/production.ini"
sed -i "s/ara[ ]*=.*/ara = ARAN/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/development.ini"

sed -i "s/ara[ ]*=.*/ara = ARAS/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini"
sed -i "s/ara[ ]*=.*/ara = ARAS/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini"

sed -i "s/ara[ ]*=.*/ara = ARAZ/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/production.ini"
sed -i "s/ara[ ]*=.*/ara = ARAZ/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/development.ini"

sed -i "s/ara[ ]*=.*/ara = DPMAIP/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini"
sed -i "s/ara[ ]*=.*/ara = DPMAIP/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini"

sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/production.ini"
sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAN_Utentes/utentes-api/development.ini"

sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini"
sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini"

sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/production.ini"
sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/development.ini"

sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini"
sed -i "s/webassets.debug[ ]*=.*/webassets.debug = True/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini"



sed -i "s/aranorte/arasul/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/production.ini"
sed -i "s/aranorte/arasul/" "${FOLDER}/${DATE}_SIRHAS_Utentes/utentes-api/development.ini"

sed -i "s/aranorte/arazambeze/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/production.ini"
sed -i "s/aranorte/arazambeze/" "${FOLDER}/${DATE}_SIRHAZ_Utentes/utentes-api/development.ini"

sed -i "s/aranorte/dpmaip/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/production.ini"
sed -i "s/aranorte/dpmaip/" "${FOLDER}/${DATE}_DPMAIP_SIAM/utentes-api/development.ini"





cp -R ./base-aranorte/* "${FOLDER}/${DATE}_SIRHAN_Utentes/"
cp -R ./base-arasul/* "${FOLDER}/${DATE}_SIRHAS_Utentes/"
cp -R ./base-arazambeze/* "${FOLDER}/${DATE}_SIRHAZ_Utentes/"
cp -R ./base-dpmaip/* "${FOLDER}/${DATE}_DPMAIP_SIAM/"


[ -f secret.sh ] && bash secret.sh "${FOLDER}" "${DATE}"
