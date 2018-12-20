# Healthcheck Proxy

This app takes care of proxying and duplexing healthchecks to multiple backends.

Usecase 1:
You might have multiple healthcheck monitorings setup and want to notify all of them without sending multiple pings. In this case you can configure multiple endpoints for your check.

Usecase 2:
You want to change your healthcheck monitoring internally at some point and
dont want to update your code to reflect new endpoints.

Usecase 3:
You might be confused by cryptic URLs inside of the code. With Healthcheck
proxy you get human friendly readable urls such as:
`GET https://healthcheck-proxy.herokuapp.com/checks/long-running-cron`

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

```sh
cd /api/
./bin/setup
```

It assumes you have a machine equipped with Ruby, Postgres, etc.

## Structure

The folder `api` contains the backend that will receive all the requests from
the clients. The folder `clients` contains programming language specific API
libraries to interact with the API.

## Deployment

Deploy with:

```
api/bin/deploy
```

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
