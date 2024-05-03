FROM python:3.10

ENV PYTHONBUFFERED=1

WORKDIR /django-app

RUN pip install --upgrade pip "poetry==1.8.2"
COPY pyproject.toml poetry.lock ./
RUN poetry config virtualenvs.create false --local
RUN poetry install
RUN python manage.py collectstatic --noinput

COPY mysite .
