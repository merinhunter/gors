FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends openssh-server && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -m -s /bin/bash docker
RUN echo 'docker:docker' | chpasswd
RUN service ssh start

CMD ["/usr/sbin/sshd", "-D"]
