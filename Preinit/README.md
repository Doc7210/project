### Для храния пользовательских Docker Images необходимо создать приватное Registry:

```
yc container registry create --name=demo
```

### После этого необходимо проставить в переменную окружения идентификатор созданного приватного Registry:
```
REGISTRY=$(yc container registry get --name=demo --format=json | jq -r .id)
```

### Настроить Docker на работу через Docker Cred Helper:
```
yc container registry configure-docker
```

### Собираем первую версию Docker Image:
```
docker build . -t cr.yandex/${REGISTRY}/demo:v1
```

### Публикация Docker Image в приватном Registry:
```
docker push cr.yandex/${REGISTRY}/demo:v1
```
