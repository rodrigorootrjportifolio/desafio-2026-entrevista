FROM python@sha256:3996a4b86240b6d41b57055cd7f626cbb15e2baef149b4fd841e04fec7308290 AS compile-image
RUN mkdir /app /assets
RUN apk add --no-cache \
    build-base \
    linux-headers \
    python3-dev \
    pcre-dev \
    libffi-dev
WORKDIR /app
COPY src/ .
RUN python3 -m venv /asset/ && /asset/bin/python -m pip install --upgrade pip
COPY assets/requirements.txt /app
RUN /asset/bin/pip install -r requirements.txt

FROM python@sha256:3996a4b86240b6d41b57055cd7f626cbb15e2baef149b4fd841e04fec7308290 AS run-image
WORKDIR /app
COPY --from=compile-image /app/ /app/
COPY --from=compile-image /asset/ /asset/
EXPOSE 5000
CMD ["/bin/sh","operador.sh"]