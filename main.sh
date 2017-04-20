#!/usr/bin/env bash

cp -R /code/* /code-copy/

chown -R app:app /code-copy/*

cd /code-copy
/app/codeclimate-clippy
