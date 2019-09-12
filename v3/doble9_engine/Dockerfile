FROM elixir:latest as builder
COPY . /app
WORKDIR /app
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get
RUN MIX_ENV=prod mix release


FROM elixir:1.9.1-slim
WORKDIR /app
COPY --from=builder /app/_build/prod/rel/doble9_engine/ .

CMD bin/doble9_engine start
