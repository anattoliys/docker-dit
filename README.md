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
