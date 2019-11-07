# az-ml-cli

A docker image with azure machine learning cli

## Usage

Create a service principal with access to your Azure ML workspace. The following environment variables will need to be passed to docker run using the `-e` switch. Makes sense to export them into your local environment first

- `RG`: resource group containing the workspace
- `APP_ID`: application id of the service principal
- `SP_SECRET`: service prinicpal secret
- `TENTANT_ID`: Azure AD tenant ID
- `WORKSPACE`: name of the azureml workspace

Create a local directory to store your model

`mkdir ./model`

### Listing models 
`docker run --rm -it -e APP_ID=$APP_ID -e SP_SECRET=$SP_SECRET -e TENANT_ID=$TENANT_ID -e RG=$RG az-ml-cli az ml model list -w $WORKSPACE -o table`

```
Name                            Version    Framework    CreatedTime
------------------------------  ---------  -----------  -------------------
customer_repayment_probability  1          Custom       2019-11-07T10:06:50
sales_receivables_forecasting   1          Custom       2019-11-02T04:09:46
```

### Download model
```
docker run --rm -it \
    -e APP_ID=$APP_ID \
    -e SP_SECRET=$SP_SECRET \
    -e TENANT_ID=$TENANT_ID \
    -e RG=$RG \
    -v $(pwd)/models:/models \
    az-ml-cli \
    az ml model download -w $WORKSPACE -i customer_repayment_probability:1 -t ./models

ls ./models

model.pkl
```
