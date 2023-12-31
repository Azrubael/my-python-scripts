#!/bin/bash

: <<'END_COMMENT'
Створити скрипт Bash для роботи в Linux.
1) Перевірити, чи було передано аргументом ім'я файлу.
2) Перевірити, чи є переданий агрумент дійсним файлом.
3) Отримати розширення переданого файлу.
4) Отримати шлах до директорії, де знаходиться переданий файл і сохранити її в змінній current_dir.
4) Розпакувати переданий файл в current_dir: якщо це zip, то використовується unzip; якщо tar - використовується tar; інакше повідомляється про те, що розпакувати неможливо.
5) Перевірити існування файла з розширенням txt серед великої кількості файлів в директорії current_dir і, якщо він є, створити масив, де одна стрічка прочитаного файла має бути один елементом.  При цьому необхідно видаляти недруковані символи.
6) Прочитати всі імена файлів в current_dir і створити новий масив mp4_files, в якому зберегти тільки іменя файлів з розширенням mp4.
7) Відсортувати елементи mp4_files по порядку від меншого до більшого. Для сортирови використати алгорітм сортування злиттям.
8) Порівняти кількість елементів в масивах current_dir і mp4_files.
Якщо вони різні, вивести відповідне повідомлення. Інакше перейменувати файли з розширенням mp4 в директорії current_dir таким чином, щоб нові файли мали назву "{mp4_files[i-1]} {старе ім'я}".
END_COMMENT

# Перевірка, чи було передано аргументом ім'я файлу
if [ "$#" -ne 1 ]; then
    echo "Потрібно передати лише один аргумент - ім'я файлу"
    exit 1
fi

file_name=$1

# Перевірка, чи є переданий аргумент дійсним файлом
if [ ! -f "$file_name" ]; then
    echo "Переданий аргумент не є дійсним файлом"
    exit 1
fi

# Отримання розширення переданого файлу
file_extension="${file_name##*.}"
echo "Розширення переданого файлу: $file_extension"

# Отримання шляху до директорії, де знаходиться переданий файл
current_dir=$(dirname "$(realpath "$file_name")")
echo "Шлях до переданої директорії: $current_dir"

# Розпакування переданого файлу в поточну директорію
if [ "$file_extension" = "zip" ]; then
    unzip -d "$current_dir" "$file_name"
elif [ "$file_extension" = "tar" ]; then
    tar -xvf "$file_name" -C "$current_dir"
else
    echo "Розпакування неможливе: невідомий формат файлу"
fi

# Перевірка існування файла з розширенням txt
txt_file="$current_dir/*.txt"
txt_files=($txt_file)
if [ -e "${txt_files[0]}" ]; then
    echo "Файл з розширенням txt існує: ${txt_files[0]}"
    # Створення масиву, де кожен рядок прочитаного файла є окремим елементом
    readarray -t txt_content < "${txt_files[0]}"
fi

# Створення масиву mp4_files з іменами файлів з розширенням mp4
mp4_files=()
shopt -s nullglob
for file in "$current_dir"/*.mp4; do
    mp4_files+=("$(basename "$file" | tr -d '[:cntrl:]')")
done

# Сортування елементів mp4_files за допомогою алгоритму сортування злиттям
IFS=$'\n' sorted=($(sort <<<"${mp4_files[*]}"))
unset IFS
mp4_files=("${sorted[@]}")

# Порівняння кількості елементів в масивах current_dir і mp4_files
if [ "${#mp4_files[@]}" -ne "$(ls -1q "$current_dir" | wc -l)" ]; then
    echo "Кількість елементів в масивах відрізняється"
    echo ""
else
    # Перейменування файлів з розширенням mp4
    for ((i=0; i<${#mp4_files[@]}; i++)); do
        mv "$current_dir"/"${mp4_files[i]}" "$current_dir"/"${mp4_files[i]} ${mp4_files[i-1]}"
    done
fi