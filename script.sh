#!/bin/bash
docker build . -t cr.yandex/${REGISTRY}/demo:v1
docker push cr.yandex/${REGISTRY}/demo:v1

sudo docker build -t test:v1 .
sudo docker run -p 80:80 -d --rm --name test.v1 job:v2


yc resource-manager folder add-access-binding --id=b1guhc3e5if3hpdvi62v \
                                              --subject=serviceAccount:ajesh4d1h72qghglqran \
                                              --role=container-registry.images.puller

                                              
docker build . -t cr.yandex/crp81n533tpg41knmn24/dem:v1

yc compute instance update my-instance --service-account-name final