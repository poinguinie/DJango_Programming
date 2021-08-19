# pull official base image
FROM python:3.8.0-alpine

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

RUN apk update
# libffi-dev for gcc error
RUN apk add postgresql-dev python3-dev libffi-dev gcc musl-dev zlib-dev jpeg-dev

COPY . /usr/src/app/
#install dependencies
RUN pip install --upgrade pip
RUN pip install -r requirements.txt