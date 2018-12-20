#!/bin/sh

# Run this script to deploy the app to Heroku.

set -e

git push heroku `git subtree split --prefix api master`:master --force
heroku run rails db:migrate --exit-code
heroku restart
