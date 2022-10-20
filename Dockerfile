FROM python:3
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
ENTRYPOINT ["mkdocs", "serve","--dev-addr", "0.0.0.0:8000"]