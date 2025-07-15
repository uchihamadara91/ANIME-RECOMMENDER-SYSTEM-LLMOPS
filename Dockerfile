## Parent image
FROM python:3.10-slim

## Essential environment variables which you write in every dockerfile
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

## Work directory inside the docker container
WORKDIR /app

## Installing system dependancies
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

## Copying ur all contents from local to app
COPY . .

## Run setup.py (--no-cache-dir is written to get fresh restart, not use pycache files)
RUN pip install --no-cache-dir -e .

# Used PORTS (streamlit by default run on port 8501, that's why)
EXPOSE 8501

# Run the app ("--server.address=0.0.0.0" to deploy in aws, gcp etc, 
#it means any ip) (--server.headless=true, by default it is false, 
#when we run streamlit run app.py, it directly opens the app, 
#it will prevent that)
CMD ["streamlit", "run", "app/app.py", "--server.port=8501", "--server.address=0.0.0.0","--server.headless=true"]