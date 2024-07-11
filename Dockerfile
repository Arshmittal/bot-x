# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Install Firefox and other dependencies
RUN apt-get update && apt-get install -y \
    firefox-esr \
    && apt-get clean

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5000

# Run the application
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:5000"]
