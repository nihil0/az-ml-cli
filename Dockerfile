FROM microsoft/azure-cli

RUN az extension add -n azure-cli-ml

ENV TENANT_ID ''
ENV APP_ID ''
ENV SP_SECRET ''
ENV RG ''

COPY start.sh .

ENTRYPOINT [ "bash", "start.sh"  ]
CMD ["az", "ml", "models", "list"] 