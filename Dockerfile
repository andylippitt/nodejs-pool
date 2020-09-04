FROM andylippitt/pool_controller:0.20-arm
COPY --from=andylippitt/pool_web:0.20-arm /app/dist/web/ /app/dist/static/
