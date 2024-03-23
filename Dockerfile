FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy as build
WORKDIR /docker-app
COPY /net /docker-app
RUN set -eux \
    && dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
WORKDIR /apps
COPY --from=build /docker-app/WebApplication_DIT_Docker/bin/Debug/net6.0/* /apps/
RUN set -eux \
    && useradd dockerappuser \
    && id dockerappuser
USER dockerappuser:dockerappuser
EXPOSE 80
ENTRYPOINT [ "dotnet", "/apps/WebApplication_DIT_Docker.dll" ]