# miniature-wookie
Generic Node Development Environment
I built it mostly for my own use, but feel free to use it! 
Github repo: [https://github.com/alexwitherspoon/miniature-wookie](https://github.com/alexwitherspoon/miniature-wookie)
Dockerhub repo [https://registry.hub.docker.com/u/alexwitherspoon/miniature-wookie/](https://registry.hub.docker.com/u/alexwitherspoon/miniature-wookie/)


## What are Wookies?

Wookiees are devoted, loyal friends and are very distrustful of strangers.

> [wikipedia.org/wiki/Wookiee](http://en.wikipedia.org/wiki/Wookiee)

# How to use this image

## Create a `Dockerfile` in your project

Include the following at the top of your project.

    FROM alexwitherspoon:miniature-wookie

## How to Run this Thing

Run `http://container-ip:5050` in a browser, or ssh to `ssh root@container-ip:22`

    docker run -d -p 5050:5050 -p 80:80 -p 222:22 alexwitherspoon/miniature-wookie

Then go to `http://localhost:5050` or `http://host-ip:5050` in a browser.
    
If you want to run it and develop using it, run this:

    docker run -i -t -p 5050:5050 -p 80:80 -p 222:22 --entrypoint /bin/bash alexwitherspoon/miniature-wookie
    
## How to Connect to it!

Then if developing you may connect either using SSH (default U: root P: wookie), or Docker Attach.

    docker attach <name-of-proccess>
    
OR

SSH in with user: 'root', and password: 'wookie', on port 222(or whatever you specify.)
   
   ssh -p 222 -l root <container-ip>
   
OR

Use the WebIDE found on port 80, log in with user: 'root', and password: 'wookie'

   `http://container-ip`
   

## Things got out of hand, how do I kill it?

Just be carefull, wookies are just as likely to take your arms off!

Show all running docker instances

    docker ps -a

When you've found the bear's container id, run this:

    docker kill <container-id>
    docker rm <container-id>
    docker rmi <container-id>
