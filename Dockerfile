FROM openjdk:14-alpine

ARG PLANTUML_VERSION=1.2020.0
ARG LANG=en_US.UTF-8

LABEL "version"="1.0.0-$PLANTUML_VERSION"
LABEL "com.github.actions.name"="PlantUML CLI"
LABEL "com.github.actions.description"="Allows generating various output files from PlantUML definitions"
LABEL "com.github.actions.icon"="printer"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/lokkju/github-actions-plantuml.git"
LABEL "homepage"="https://github.com/lokkju/github-actions-plantuml"
LABEL "maintainer"="Loki Coyote <lokkju@gmail.com>"

RUN apk add --virtual planuml-deps --no-cache graphviz ttf-droid ttf-droid-nonlatin curl \
    && mkdir /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.${PLANTUML_VERSION}.jar/download -o /app/plantuml.jar \
    && apk del curl

COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "-h" ]
