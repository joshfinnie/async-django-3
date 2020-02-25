FROM python:3.8-slim
WORKDIR /code

# Update to latest packages and add build-essential and python-dev
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
            build-essential=12.6 \
            python3-dev=3.7.3-1 && \
    rm -fr /var/lib/apt/lists/*

RUN pip install Django==3.0 uvicorn==0.10.8
