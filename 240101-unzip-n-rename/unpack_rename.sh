#!/bin/bash

: <<'COMMENT1'
1) Перевірити, чи було передано аргументом ім'я файлу.
2) Отримати розширення переданого файлу.
3) Перевірити, чи є переданий агрумент дійсним файлом.
4) Отримати шлах до директорії, де знаходиться переданий файл і сохранити її в змінній current_dir.
5) Розпакувати переданий файл в current_dir: якщо це zip, то використовується unzip; якщо tar - використовується tar; інакше повідомляється про те, що розпакувати неможливо.
6) Перевірити існування файла з розширенням txt серед великої кількості файлів в директорії current_dir. Якщо файл з розширенням txt присутній в files_list, створити асоциатівний масив lessons_names, де ключі повинні бути цілими числами, починаючи з 1, а значеннями мають бути відповідні стрічки прочитаного файла без непечатних символів.
7) Створити асоциативний масив files_list, в якому ключами виступають номера в іменах файлів, а значеннями -  повні імена файлів mp4
8) Виведення на екран масивів files_list і lessons_names
9) Порівняти кількость елементів в масивах files_list і lessons_names
10) Перейменувати файли з розширенням mp4, використовуючи два асоциативних масиви files_list і lessons_names
COMMENT1


# 1) Перевірка наявності аргументу - ім'я файлу
if [ -z "$1" ]; then
  echo "Не було передано ім'я файлу аргументом"
  exit 1
fi

# 2) Отримання розширення переданого файлу
file_ext="${1##*.}"


# 3) Перевірка, чи є переданий аргумент дійсним файлом
if [ ! -f "$1" ]; then
  echo "Переданий аргумент не є дійсним файлом"
  exit 1
fi


# 4) Отримання шляху до директорії, де знаходиться переданий файл
current_dir=$(dirname "$(realpath "$1")")
dir_path=$(dirname "$1")


# : <<'COMMENT2'
# 5) Розпакувати переданий файл в current_dir
case "$file_ext" in
    zip)
        unzip "$1" -d "$current_dir"
        ;;
    tar)
        tar -xf "$1" -C "$current_dir"
        ;;
    *)
        echo "Не вдається розпакувати файл з розширенням $file_ext"
        exit 1
        ;;
esac
# COMMENT2


# 6) Перевірка наявності файла з розширенням txt та створення асоциативного масиву lesson_names, видаливши непечатні символи
declare -A lesson_names
txt_files=("$current_dir"/*.txt)
if [ ${#txt_files[@]} -gt 0 ]; then
    idx=1
    while IFS= read -r line || [[ -n $line ]]; do
        lessons_names[$idx]=$(echo ${line} | tr -d '\r\n')
        ((idx++))
    done < "${txt_files[0]}"
fi


# 7) Створення асоциативного масиву files_list, в якому ключами виступають номера в іменах файлів, а значеннями -  повні імена файлів mp4
declare -A files_list
for f in "$current_dir"/*.mp4; do
    value=$(basename "$f")
    val="${value/lesson/}"
    files_list["${val/.mp4/}"]="$f"
done


: <<'COMMENT3'
# 8) Виведення на екран масивів files_list і lessons_names
for key in "${!files_list[@]}"; do
  echo "Ключ: $key, Значення: ${files_list[$key]}"
  echo "Ключ: $key, Значення: ${lessons_names[$key]}"
done
COMMENT3


# 9: Порівняння кількості елементів в масивах files_list і lessons_names
difference=$((${#files_list[@]} - ${#lessons_names[@]}))
echo "${#files_list[@]} - ${#lessons_names[@]}"
if [ $difference -ne 0 ]; then
    echo "Кількість елементів в масивах first_part і mp4_files різна"
    exit 1
fi


# 10) Перейменування файлів з розширенням mp4
for key in "${!files_list[@]}"; do
    oldf=${files_list[$key]}
    name="${lessons_names[$key]%" "}"
    newf=$"$dir_path"/"$key"_"${name/:/}".mp4
    echo "$oldf" - "$newf"
    mv "$oldf" "$newf"
done


echo "Готово!"