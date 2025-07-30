FROM d3smond/cuda-rocky:latest


ENV TZ=Europe/Zagreb
ENV PIP_ROOT_USER_ACTION=ignore

ARG USE_PERSISTENT_DATA

RUN mkdir -p /data && chmod -R 777 /data

COPY ./setup/setup.sh /setup/setup.sh
COPY ./setup/debug.sh /setup/debug.sh
COPY ./setup/run.sh /setup/run.sh
COPY ./setup/startup.sh /setup/startup.sh
COPY ./setup/requirements.txt /setup/requirements.txt


# Copy
RUN chmod +x /setup/*.sh

# ENV
ENV HOME=/root \
    PATH=/root/.local/bin:$PATH

# Pyenv
RUN curl https://pyenv.run | bash
ENV PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH

ARG PYTHON_VERSION=3.11

# Python
RUN pyenv install $PYTHON_VERSION && \
    pyenv global $PYTHON_VERSION && \
    pyenv rehash && \
    pip install --no-cache-dir --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade -r /setup/requirements.txt

# Set the working directory to /data mounted from docker compose
WORKDIR $HOME/app

RUN echo "Done."

CMD ["bash","/setup/startup.sh"]