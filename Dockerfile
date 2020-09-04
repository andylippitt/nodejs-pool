FROM andylippitt/pool_controller:0.21
COPY --from=andylippitt/pool_web:0.21 /app/dist/web/ /app/dist/static/
