#!/bin/bash

layout=$(xkb-switch)
if [ "$layout" = "us" ]; then
  echo "Language: US"
else
  echo "Language: RU"
fi
