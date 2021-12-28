FROM centos 

RUN yum install openssh-server -y

RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

COPY remote_key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user  /home/remote_user/.ssh/ -R

RUN chmod 600 /home/remote_user/.ssh/authorized_keys

RUN sed -i 's/sshd:\/sbin\/nologin/sshd:\/bin\/bash/g' /etc/passwd

RUN rm -rf /run/nologin

RUN rm -rf /sbin/nologin


RUN yum -y install mysql unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install
 
RUN ssh-keygen -A

CMD /usr/sbin/sshd -D
