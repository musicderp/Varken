FROM amd64/python:3.7.2-alpine

LABEL maintainers="dirtycajunrice,samwiseg0"

ENV DEBUG="False"

COPY / /app

COPY /tmp/qemu-arm-static /usr/bin/qemu-arm-static

RUN \
    python3 -m pip install -r /app/requirements.txt && \
    chown -R abc:abc \
    /config \
    /app

WORKDIR /app

CMD cp /app/data/varken.example.ini /config/varken.example.ini && python3 /app/Varken.py --data-folder /config

VOLUME /config
