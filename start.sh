az login --service-principal -u ${APP_ID} -p ${SP_SECRET} --tenant ${TENANT_ID} > /dev/null
az configure --defaults group=${RG}
exec "$@"