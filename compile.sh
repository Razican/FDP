#!/usr/bin/env bash

makeglossaries FDP-Iban-Eguia
biber FDP-Iban-Eguia
xelatex -shell-escape FDP-Iban-Eguia
