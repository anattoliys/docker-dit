## ДЗ по уроку 4

Собрать образы nginx и dotnet
```
docker-compose build
```

Запустить стэк
```
docker stack deploy -c docker-stack.yml dotnet-stack
```

Выполнить запрос
```
curl http://localhost:5000/weatherforecast
```

Удалить стэк
```
docker stack rm dotnet-stack
```

## ДЗ по уроку 3

Запустить контейнер с помощью docker-compose
```
docker-compose up -d
```

Запустить контейнер с ограниченными ресурсами
```
docker run -d -m=1g --cpus='1' -p 5000:80 --name dotnet-container dotnet-image:latest
```

## ДЗ по уроку 2

> Dockerfile должен находится в проекте **docker-basic**

Создать образ
```
docker build -t dotnet-image .
```

Запустить контейнер
```
docker run -d -p 5000:80 --name dotnet-container dotnet-image:latest
```

Перейти по ссылке

```
http://localhost:5000/weatherforecast
```
