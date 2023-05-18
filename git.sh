#!/bin/bash

echo "What is your email?"

read email
git config --global user.email "$email"

echo "What is your full name?"

read name
git config --global user.name "$name"
