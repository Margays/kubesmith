FROM python:3.13.7
ARG REMOTE_USER
ARG REMOTE_UID
ARG REMOTE_GID

COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN addgroup --gid ${REMOTE_GID} ${REMOTE_USER}
RUN adduser --disabled-password --uid ${REMOTE_UID} --gid ${REMOTE_GID} ${REMOTE_USER}

ENV HOME /home/${REMOTE_USER}
USER ${REMOTE_USER}
