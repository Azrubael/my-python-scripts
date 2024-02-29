#!/bin/bash

echo "Do you like apples or oranges?"
read fruit

case $fruit in
    apples)     echo "Well, they're tasty!" ;;
    oranges)    echo "Wow, me too!" ;;
    *)          echo "I didn't understand :(" ;;
esac
