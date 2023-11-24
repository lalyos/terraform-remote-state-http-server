FROM python:alpine3.7
RUN pip install flask flask_restful
COPY server.py /app
WORKDIR /app
EXPOSE 5000
ENTRYPOINT ["python", "server.py"]