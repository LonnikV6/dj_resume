FROM python:3 as build-python

FROM build-python AS dependencies
COPY requirements.txt /src/
RUN pip install -r /src/requirements.txt

FROM dependencies as codebase
WORKDIR /src
COPY . /src/
ENV PYTHONUNBUFFERED 1

EXPOSE 8000
EXPOSE 5432