# miniature-wookie
Generic Node Development Environment
I built it mostly for my own use, but feel free to use it!

## What are Wookies?

Wookiees are devoted, loyal friends and are very distrustful of strangers.

> [wikipedia.org/wiki/Wookiee](http://en.wikipedia.org/wiki/Wookiee)

# How to use this image

## Create a `Dockerfile` in your project

Include the following at the top of your project.

    FROM alexwitherspoon:miniature-wookie

## How to Run this Thing

Run `http://container-ip:5050` in a browser, or ssh to `ssh root@container-ip:22`

    docker run -d --name <name-of-proccess> -p 5050:5050 alexwitherspoon/miniature-wookie

Then go to `http://localhost:5050` or `http://host-ip:5050` in a browser.

Or to run it long time:

    docker run -d --restart always --name="miniature-wookie" -P alexwitherspoon/miniature-wookie