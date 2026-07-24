FROM ghcr.io/ansible-community/community-ee-base:latest

USER root

RUN dnf install -y sshpass linux-system-roles rsync && \
    dnf clean all && \
    ansible-galaxy collection install community.general ansible.posix -p /usr/share/ansible/collections
