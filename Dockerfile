# Node Development Server
# https://github.com/alexwitherspoon/miniature-wookie
FROM debian:wheezy

# Network Ports Used by App
EXPOSE 5050
EXPOSE 22

#Commands to Stage OS
RUN echo "Updating OS" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get upgrade -qq --force-yes" && \
    echo "OS Updated, installing software" && \
    echo "...."

RUN echo "Installing Base Utilties" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get install -qq --force-yes build-essential nano ssh" && \
    bash -c "echo 'root:wookie' | chpasswd" && \
    echo "Base Utilities Installed" && \
    echo "...."

#Commands to Stage App
RUN echo "Installing git" && \
    bash -c "apt-get install -qq --force-yes git" && \
    echo "git Installed" && \
    echo "...."
    
RUN echo "Installing mongodb" && \
    bash -c "apt-get install -qq --force-yes mongodb" && \
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