FROM python:3.8-slim

ARG DEBIAN_FRONTEND=noninteractive

# Place webapp files here and use a non-root user
RUN useradd --create-home webapp

# Set working dir to new dir
WORKDIR /home/webapp
USER webapp

# User installed pip
ENV PATH="${PATH}:/home/webapp/.local/bin"

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip

# Install pipenv
RUN pip install --user pipenv

COPY Pipfile /home/webapp
COPY Pipfile.lock /home/webapp

# This is a dev version of the Dockerfile, so we also need the dev dependencies
RUN set -ex && /home/webapp/.local/bin/pipenv install --deploy --system --dev

#EXPOSE 5000
