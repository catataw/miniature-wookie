# Node Development Server
# https://github.com/alexwitherspoon/miniature-wookie
FROM debian:wheezy

# Network Ports Used by App
EXPOSE 5050
EXPOSE 22

#Commands to Stage OS
RUN echo "Updating OS" && \
    sudo -E bash -c "apt-get update -qq" && \
    sudo -E bash -c "apt-get upgrade -qq --force-yes" && \
    sudo -E bash -c "apt-get install -qq --force-yes build-essential" && \
    echo "OS Updated, installing software" && \
    echo "...."

#Commands to Stage App
RUN echo "Installing git" && \
    sudo -E bash -c "apt-get install -qq --force-yes git" && \
    echo "git Installed" && \
    echo "...."

RUN echo "Installing node.js" && \
    sudo -E bash -c "apt-get install -qq --force-yes curl" && \
    sudo -E bash -c "curl -sL https://deb.nodesource.com/setup | sudo bash -" && \
    sudo -E bash -c "apt-get install -qq --force-yes nodejs" && \
    sudo -E bash -c "npm cache clean -f" && \
    sudo -E bash -c "npm install -g n" && \
    sudo -E bash -c "n stable" && \
    echo "node.js Installed" && \
    echo "...."

RUN echo "Installing grunt" && \
    sudo -E bash -c "npm install -g grunt-cli" && \
    echo "grunt Installed" && \
    echo "...."