FROM bitwalker/alpine-elixir:1.8.1 as builder
#FROM elixir:latest as builder
ENV MIX_ENV test
RUN apk upgrade && \
    apk --no-cache --update upgrade alpine-sdk && \
    apk --no-cache add alpine-sdk && \
    rm -rf /var/cache/**/*
COPY . /app
WORKDIR /app
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get
RUN MIX_ENV=prod mix release


FROM bitwalker/alpine-elixir:1.8.1
#FROM elixir:latest
ENV REPLACE_OS_VARS=true

#RUN apk upgrade \
#  && apk add --no-cache bash openssl build-base curl \
#  && rm -rf /var/cache/**/*

WORKDIR /app
COPY --from=builder /app/_build/prod/rel/doble9_engine/ .

CMD bin/doble9_engine foreground
#CMD ["abduco", "-A", "termbox", "sh"]