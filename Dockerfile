# Node Development Server
# https://github.com/alexwitherspoon/miniature-wookie
FROM debian:wheezy

# Network Ports Used by App
EXPOSE 5050
EXPOSE 80
EXPOSE 22

# Commands to Stage OS
RUN echo "Updating OS" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get upgrade -qq --force-yes" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "OS Updated, installing software" && \
    echo "...."

RUN echo "Installing Base Utilties" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get install -qq --force-yes build-essential git nano ssh" && \
    bash -c "echo 'root:wookie' | chpasswd" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "Base Utilities Installed" && \
    echo "...."
    
RUN echo "Installing Web Editor" && \
    bash -c "apt-get update -qq" && \
    bash -c "apt-get install -qq --force-yes git lighttpd php5-common php5-cgi php5" && \
    bash -c "lighttpd-enable-mod fastcgi" && \
    bash -c "lighttpd-enable-mod fastcgi-php" && \
    bash -c "rm -Rf /var/www/*" && \
    bash -c "git clone https://github.com/alexwitherspoon/Codiad /var/www" && \
    bash -c "chown -R www-data:www-data -R /var/www/" && \
    bash -c "chmod -R 0777 /opt" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "Web Editor Installed" && \
    echo "...."

# Commands to Stage App  
RUN echo "Installing mongodb" && \
    bash -c "apt-get install -qq --force-yes mongodb" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "mongodb Installed" && \
    echo "...."

RUN echo "Installing node.js" && \
    bash -c "apt-get install -qq --force-yes curl" && \
    bash -c "curl -sL https://deb.nodesource.com/setup | bash -" && \
    bash -c "apt-get install -qq --force-yes nodejs" && \
    bash -c "npm cache clean -f" && \
    bash -c "npm install -g n" && \
    bash -c "n stable" && \
    bash -c "apt-get autoremove -qq --force-yes" && \
    bash -c "apt-get clean -qq --force-yes" && \
    echo "node.js Installed" && \
    echo "...."

RUN echo "Installing grunt" && \
    bash -c "npm install -g grunt-cli" && \
    echo "grunt Installed" && \
    echo "...."

# Commands to Run App
CMD bash -c "/etc/init.d/ssh start" && \
    bash -c "/etc/init.d/lighttpd start" && \
    bash -c "/etc/init.d/mongodb start" && \
    bash -c "sleep 365d"
