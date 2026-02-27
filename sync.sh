#!/bin/bash
rm -rf content/*
cp -r /s/theBrain/w3bgr3p/KnowledgeHub/. content/
rm -rf content/.git
git add content/
git commit -m "sync: update content"
git push