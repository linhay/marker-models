FROM python:3.12-slim as base

# Set non-interactive frontend (useful for automated builds)
ENV DEBIAN_FRONTEND=noninteractive \
    DEBCONF_NONINTERACTIVE_SEEN=true \
    PYTHONUNBUFFERED=1

WORKDIR /code

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget curl openssh-client ca-certificates binutils libgl1-mesa-glx libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file and install Python dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the application code
COPY ./loaders /loaders
RUN python /loaders/load-models-surya_det2.py
RUN python /loaders/load-models-surya_layout2.py
RUN python /loaders/load-models-texify.py
RUN python /loaders/load-models-texify2.py
RUN python /loaders/load-models-surya_rec.py
RUN python /loaders/load-models-surya_order.py