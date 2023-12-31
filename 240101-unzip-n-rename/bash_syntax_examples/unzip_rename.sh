#!/bin/bash

# 2) Є директорія з файлами, які названі [lesson1.mp4, lesson2.mp4, ...]. В той же директорії є файл *.txt, який містить назви для перейменування файлів. Напиши скрипт Bash для Linux, який : 1) отримає аргументом відносний шлях до директорії з файлами, що треба перейменувати; 2) прочитає файл *.txt і створить масив стрічок для утвореня нових імен; 3) по черзі перейменує усі файли "lesson{index}.mp4", використовуючи індекси "index" в прочитаних назвах для визначення нових імен. Нові імена файлів повинні мати структуру "{нове ім'я}-{старе ім'я}".


# Перевірка, чи було передано ім'я файлу як аргумент
if [ "$#" -ne 1 ]; then
    echo "Потрібно передати лише один аргумент - ім'я архіву для розпакування"
    exit 1
fi

# Перевірка, чи ім'я файлу є дійсним файлом
if [ ! -f "$1" ]; then
    echo "Файл не знайдено"
    exit 1
fi

# Отримання розширення файлу
extension="${1##*.}"
# Розпакування в залежності від розширення
case "$extension" in
    zip)
        unzip -d "$(dirname "$1")" "$1"
        ;;
    tar)
        tar -C "$(dirname "$1")" -xvf "$1"
        ;;
    *)
        echo "Неможливо розпакувати файл з розширенням $extension"
        exit 1
        ;;
esac


# Змінна для збереження відносного шляху до директорії
directory="$1"

# Перевірка існування файла з розширенням .txt серед великої кількості файлів в поточній директорії
if [[ $(find . -maxdepth 1 -type f -name '$directory/*.txt' -print -quit) ]]; then
    # Створення масиву зі стрічок прочитаного файла
    readarray -t array_variable < <(find . -maxdepth 1 -type f -name '*.txt' -exec cat {} +)
    
    # Виведення елементів масиву
    for element in "${array_variable[@]}"
    do
        echo "$element"
    done
else
    echo "Файл з розширенням .txt не знайдено серед великої кількості файлів в поточній директорії"
fi



# Читання файлу *.txt та створення масиву
# mapfile -t names < "$directory/*.txt"

# Перейменування файлів "lesson*.mp4" за допомогою прочитаних назв
counter=1
for file in "$directory/lesson*.mp4"; do
    new_name="${array_variable[counter-1]}-lesson$counter.mp4"
    mv "$file" "$directory/$new_name"
    ((counter++))
done