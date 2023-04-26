:#!/bin/bash
#A simple script for renaming all *.HTM files in the current directory

for file in *.htm; do
  name=$(basename "$file" .HTM)
  # для "сухого пуска" - вывод на экран вместо переимнования
  echo mv "$file" "$name.html" 
done
