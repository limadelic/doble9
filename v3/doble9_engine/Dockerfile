#FROM bitwalker/alpine-elixir:1.8.1 as builder
FROM elixir:latest as builder
#FROM elixir:latest
#ENV MIX_ENV test
#RUN apk upgrade && \
#    apk --no-cache --update upgrade alpine-sdk && \
#    apk --no-cache add alpine-sdk build-base erlang-dev && \
#    rm -rf /var/cache/**/*
COPY . /app
WORKDIR /app
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get
RUN MIX_ENV=prod mix release
#CMD mix run


#FROM bitwalker/alpine-elixir:1.8.1
FROM elixir:latest
ENV REPLACE_OS_VARS=true

#RUN apk upgrade \
#  && apk add --no-cache bash openssl \
#  && rm -rf /var/cache/**/*

WORKDIR /app
COPY --from=builder /app/_build/prod/rel/doble9_engine/ .

CMD bin/doble9_engine start
#CMD ["abduco", "-A", "termbox", "sh"]