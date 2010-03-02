#!/bin/bash 
git rm --cached ./config/database.yml
git rm --cached ./db/local_development.sqlite3
git rm --cached ./log/server.log
git rm --cached ./log/development.log
git rm --cached ./log/production.log
git rm --cached ./log/test.log
git rm --cached ./db/schema.rb
