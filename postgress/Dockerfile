#file-name: dockerfile
FROM ubuntu:22.04

ENV TZ=Europe/London \
    DEBIAN_FRONTEND=noninteractive

# Run the Update
RUN apt-get update && apt-get upgrade -y 
RUN apt-get install tzdata -y


RUN apt-get install -y curl openssh-server

# Setup sshd
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config


# install AWS CLI
RUN apt-get install awscli -y

# Setup AWS CLI Command Completion
RUN echo complete -C '/usr/local/bin/aws_completer' aws >> ~/.bashrc
CMD /usr/sbin/sshd -D

EXPOSE 22

#=========POSTGRES========#
RUN apt update
RUN apt -y install postgresql postgresql-contrib
# RUN systemctl start postgresql.service
RUN service postgresql start

EXPOSE 5432
CMD ["postgres"]

#Make sure that your shell script file is in the same folder as your dockerfile while running the docker build command as the below command will copy the file to the /home/root/ folder for execution. 
COPY . /home/root/ 
#Copying script file
RUN ls /home/root/
USER root 
#switching the user to give elevated access to the commands being executed from the k8s cron job