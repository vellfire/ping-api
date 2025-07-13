FROM docker.io/library/python:3.13.5-alpine AS compiler

WORKDIR /app

USER root

RUN python -m venv /app/.venv
ENV PATH="/app/.venv/bin:$PATH"
COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt


FROM docker.io/library/python:3.13.5-alpine AS runner

RUN apk update && apk add --no-cache iputils-ping

USER root

WORKDIR /app
COPY --from=compiler /app/.venv /app/.venv

ENV PATH="/app/.venv/bin:$PATH"
ENV ENDPOINT="127.0.0.1"
ENV PORT=8080
COPY main.py /app

EXPOSE $PORT

CMD ["sh", "-c", "uvicorn main:app --host '' --port $PORT"]
