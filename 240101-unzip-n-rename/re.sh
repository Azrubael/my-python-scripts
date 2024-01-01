#!/bin/bash

: <<'COMMENT1'
1) Перевірити, чи було передано аргументом ім'я файлу.
2) Перевірити, чи є переданий агрумент дійсним файлом.
3) Отримати розширення переданого файлу.
4) Отримати шлах до директорії, де знаходиться переданий файл і сохранити її в змінній current_dir.
5) Розпакувати переданий файл в current_dir: якщо це zip, то використовується unzip; якщо tar - використовується tar; інакше повідомляється про те, що розпакувати неможливо.
6) Перевірити існування файла з розширенням txt серед великої кількості файлів в директорії current_dir і, якщо він є, створити масив first_part, де одна стрічка прочитаного файла має бути один елементом.
7) В кожному елементі масиву first_part видалити недруковані символи.
8) Прочитати всі імена файлів в current_dir. Якщо файл має розширення mp4, зберегти його ім'я в масиві mp4_files.
9) Відсортувати елементи mp4_files по порядку від меншого до більшого. Для сортирови використати алгорітм сортування злиттям.
10) Порівняти кількість елементів в масивах first_part і mp4_files.
Якщо вони різні, вивести відповідне повідомлення і завершити виконання стрипта.
11) Перейменувати всі файли з розширенням mp4 в директорії current_dir таким чином, щоб нові файли мали назву "{first_part[i-1]} {старе ім'я}".
COMMENT1


# 1) Перевірка наявності аргументу - ім'я файлу
if [ -z "$1" ]; then
  echo "Не було передано ім'я файлу аргументом"
  exit 1
fi


# 2) Перевірка, чи є переданий аргумент дійсним файлом
if [ ! -f "$1" ]; then
  echo "Переданий аргумент не є дійсним файлом"
  exit 1
fi


# 3) Отримання розширення переданого файлу
file_extension="${1##*.}"


# 4) Отримання шляху до директорії, де знаходиться переданий файл
current_dir=$(dirname "$(realpath "$1")")
dir_path=$(dirname "$1")


# : <<'COMMENT2'
# 5) Розпакувати переданий файл в current_dir
case "$file_extension" in
    zip)
        unzip "$1" -d "$current_dir"
        ;;
    tar)
        tar -xf "$1" -C "$current_dir"
        ;;
    *)
        echo "Не вдається розпакувати файл з розширенням $file_extension"
        exit 1
        ;;
esac
# COMMENT2


# 6: Перевірка наявності файла з розширенням txt та створення масиву first_part
txt_files=("$current_dir"/*.txt)
if [ ${#txt_files[@]} -gt 0 ]; then
    mapfile -t first_part < "${txt_files[0]}"
fi

echo "${#first_part[@]}"


# 7: Читання всіх імен файлів в current_dir та збереження імен mp4 файлів в масиві mp4_files
mp4_files=()
while IFS=  read -r -d $'\0'; do
  file_name=$(basename "$REPLY")
  if [[ "$file_name" == *.mp4 ]]; then
    mp4_files+=("$file_name")
  fi
done < <(find "$current_dir" -type f -name "*.mp4" -print0)


# 8: Сортування елементів mp4_files за допомогою алгоритму сортування злиттям
merge_sort() {
  local arr=("$@")
  if [ ${#arr[@]} -le 1 ]; then
    echo "${arr[@]}"
  else
    local m=$((( ${#arr[@]} + 1 ) / 2 ))
    local left=($(merge_sort "${arr[@]:0:m}"))
    local right=($(merge_sort "${arr[@]:m}"))
    local result=()
    while [ ${#left[@]} -gt 0 ] && [ ${#right[@]} -gt 0 ]; do
      if [[ ${left[0]} < ${right[0]} ]]; then
        result+=("${left[0]}")
        left=("${left[@]:1}")
      else
        result+=("${right[0]}")
        right=("${right[@]:1}")
      fi
    done
    echo "${result[@]}" "${left[@]}" "${right[@]}"
  fi
}

mp4_files_sorted=($(merge_sort "${mp4_files[@]}"))


# 9: Порівняння кількості елементів в масивах first_part і mp4_files
difference=$((${#first_part[@]} - ${#mp4_files_sorted[@]}))
if [ $difference -ne 0 ]; then
  echo "Кількість елементів в масивах first_part і mp4_files різна"
  echo "${#first_part[@]} - ${#mp4_files_sorted[@]}"
  exit
fi


# 10) Перейменування файлів з розширенням mp4
for ((i=0; i<${#mp4_files_sorted[@]}; i++)); do
    oldf=$"$dir_path"/"${mp4_files_sorted[i]}"
    trimmed=$(echo ${first_part[i]} | tr -d '\r\n')
    idx=$((i+1))
    newf=$dir_path"/"${idx}_${trimmed}.mp4
    echo $newf
    mv "$oldf" "$newf"
done

