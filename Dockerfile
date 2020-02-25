FROM python:3.8.1-slim-buster as base
RUN useradd --create-home app
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
            build-essential

FROM base as builder
WORKDIR /tmp
COPY requirements.txt /requirements.txt
RUN pip install --prefix="/tmp" -r /requirements.txt

FROM base
COPY --from=builder /tmp /usr/local
USER app
WORKDIR /home/app

COPY --chown=app:app /src /home/app
