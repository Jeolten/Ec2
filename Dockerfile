FROM python:3.11.3-slim-buster
ENV PYTHON_PATH=/usr/local/bin
ENV PATH="/home/appuser/.local/bin:$PATH"

ARG APP_USER=appuser
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupadd --gid $USER_GID $APP_USER \
    && useradd --uid $USER_UID --gid $USER_GID -m $APP_USER

RUN apt-get update && apt-get install -y curl

RUN mkdir -p /app/src
RUN chown -R ${APP_USER} /app/src
WORKDIR /app/src
ADD app.py config.py requirements.txt /app/src/
USER ${APP_USER}
RUN pip install -r requirements.txt --user 
CMD ["gunicorn", "-c", "config.py", "app:application", "--reload"]


