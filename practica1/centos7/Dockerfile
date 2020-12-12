FROM centos:7

RUN yum -y install openssh-server && \
    yum -y clean all

RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -C '' -N ''
RUN ssh-keygen -q -t rsa -f /etc/ssh/ssh_host_rsa_key -C '' -N ''
RUN ssh-keygen -q -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -C '' -N ''

RUN useradd -m -s /bin/bash docker
RUN echo 'docker:docker' | chpasswd

CMD ["/usr/sbin/sshd", "-D"]
