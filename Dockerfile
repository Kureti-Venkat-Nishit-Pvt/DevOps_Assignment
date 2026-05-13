FROM python:3.11-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PORT=8000

COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r /app/requirements.txt

COPY app/ /app/app/
COPY app.py /app/app.py
COPY startup.sh /app/startup.sh

RUN chmod +x /app/startup.sh

EXPOSE 8000

CMD ["/app/startup.sh"]
