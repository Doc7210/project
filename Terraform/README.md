### Подготовьте план инфраструктуры
Для создания ресурса необходимо указать набор обязательных и опциональных параметров, определяющих свойства ресурса. 
Такие описания ресурсов составляют план инфраструктуры.
Для доступа к ВМ через SSH сгенерируйте пару SSH-ключей и передайте публичную часть ключа на виртуальную машину в параметре ssh-keys блока metadata.
Конфигурации ресурсов задаются сразу после конфигурации провайдера:
```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = "<зона доступности по умолчанию>"
}
```

### Чтобы добавить пользователя на создаваемую ВМ, в блоке metadata укажите параметр user-data с пользовательскими метаданными. Для этого:
1. Создайте текстовый файл с метаданными в кодировке UTF-8, например:
```
#cloud-config
users:
  - name: <имя пользователя>
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh_authorized_keys:
      - ssh-ed25519 AAAAB3Nza......OjbSMRX user@example.com
      - ssh-ed25519 AAAAB3Nza......Pu00jRN user@desktop
```

2. В файле main.tf вместо ssh-keys задайте параметр user-data и укажите путь к файлу с метаданными:
```
metadata = {
    user-data = "${file("<путь к файлу>/meta.txt")}"
}
```

### Создайте ресурсы
1. После проверки конфигурации выполните команду:
```
terraform plan
```

2. Чтобы создать ресурсы выполните команду:
```
terraform apply
```

3. Чтобы удалить ресурсы, созданные с помощью Terraform выполните команду:
```
terraform destroy
```
