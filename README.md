# miniature-wookie
Generic Node Development Environment
I built it mostly for my own use, but feel free to use it! 

**Github repo:** [alexwitherspoon/miniature-wookie](https://github.com/alexwitherspoon/miniature-wookie)

**Dockerhub repo:** [alexwitherspoon/miniature-wookie](https://registry.hub.docker.com/u/alexwitherspoon/miniature-wookie/)

![](https://alexwitherspoon.ghost.io/content/images/2015/04/2015-04-07-17_11_05-CODIAD-1.png)


## What are Wookies?

![](https://alexwitherspoon.ghost.io/content/images/2015/04/logo-1.png)

"Wookiees are devoted, loyal friends and are very distrustful of strangers."

> [wikipedia.org/wiki/Wookiee](http://en.wikipedia.org/wiki/Wookiee)

# How to use this image

## Use for your own Dockerfile in your own project.

Include the following at the top of your project.

    FROM alexwitherspoon:miniature-wookie

## Run this image on a docker host

    docker pull alexwitherspoon/miniature-wookie
    docker run -d -p 5050:5050 -p 80:80 -p 222:22 alexwitherspoon/miniature-wookie

## How to Connect to it!

Then if developing you may connect either using SSH (default U: root P: wookie), or Docker Attach.

    docker attach <name-of-proccess>
    
OR

SSH in with user: 'root', and password: 'wookie', on port 222(or whatever you specify.)
   
    ssh -p 222 -l root (container-ip)
   
OR

Use the WebIDE found on port 80, log in with user: 'root', and password: 'wookie'

    http://container-ip
   

## Things got out of hand, how do I kill it?

Just be carefull, wookies are just as likely to take your arms off!

Show all running docker instances

    docker ps -a

When you've found the bear's container id, run this:

    docker kill <container-id>
    docker rm <container-id>
    docker rmi <container-id>
