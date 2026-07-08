FROM ghcr.io/ansible-community/community-ee-base:latest

USER root

RUN dnf install -y sshpass && \
    dnf clean all && \
    ansible-galaxy collection install community.general -p /usr/share/ansible/collections
