# Node Development Server
# https://github.com/alexwitherspoon/miniature-wookie
FROM debian:wheezy

# ENV Variables
ENV NOTVISIBLE "in users profile"

# Network Ports Used by App
EXPOSE 5050
EXPOSE 22

#Commands to Stage OS
RUN echo "Updating OS" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get upgrade -qq --force-yes" && \
    bash -c "apt-get install -qq --force-yes ssh build-essential" && \
    echo "OS Updated, installing software" && \
    echo "...."
    
RUN echo "Enabling SSH" && \
    bash -c "mkdir /var/run/sshd" && \
    bash -c "echo 'root:wookie' | chpasswd" && \
    bash -c "sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config" && \
    bash -c "echo "export VISIBLE=now" >> /etc/profile" && \  
    echo "OS Updated, installing software" && \
    echo "...."

#Commands to Stage App
RUN echo "Installing git" && \
    bash -c "apt-get install -qq --force-yes git" && \
    echo "git Installed" && \
    echo "...."

RUN echo "Installing node.js" && \
    bash -c "apt-get install -qq --force-yes curl" && \
    bash -c "curl -sL https://deb.nodesource.com/setup | bash -" && \
    bash -c "apt-get install -qq --force-yes nodejs" && \
    bash -c "npm cache clean -f" && \
    bash -c "npm install -g n" && \
    bash -c "n stable" && \
    echo "node.js Installed" && \
    echo "...."

RUN echo "Installing grunt" && \
    bash -c "npm install -g grunt-cli" && \
    echo "grunt Installed" && \
    echo "...."
    
CMD ["/usr/sbin/sshd", "-D"]