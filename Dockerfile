FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy as build
WORKDIR /docker-app
COPY /net /docker-app
RUN set -eux \
    && dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
LABEL version 1.0
WORKDIR /apps
COPY --from=build /docker-app/WebApplication_DIT_Docker/bin/Debug/net6.0/* /apps/
RUN set -eux \
    && groupadd --gid 9000 netgroup \
    && useradd --uid 9000 --gid 9000 -ms /bin/bash netuser \
    && chown -R netuser:netgroup /apps
USER netuser:netgroup
EXPOSE 80
ENTRYPOINT [ "dotnet", "/apps/WebApplication_DIT_Docker.dll" ]