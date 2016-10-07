FROM debian

USER root

RUN apt-get update && apt-get install -y openssh-server && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

# Password is 'password'
RUN echo 'root:password' | chpasswd

RUN sed -ie "s/PermitRootLogin without-password/PermitRootLogin yes/" /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd", "-D"]
