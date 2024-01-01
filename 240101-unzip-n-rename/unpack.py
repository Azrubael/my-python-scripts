import os
import sys
import zipfile
import tarfile


# 1) Обов'язкові перевірки
if len(sys.argv) < 2:
    print("Не вказано ім'я файлу")
    sys.exit(1)

file_name = sys.argv[1]
file_extension = os.path.splitext(file_name)[1]

if not os.path.isfile(file_name):
    print("Вказаний файл не існує")
    sys.exit(1)


# 2) Отримання шляху до директорії з архувним фаqлом і створення списку вже існуючих (можливо розпакованих) файлів
current_dir = os.path.dirname(os.path.abspath(file_name))
extracted_files = set(os.listdir(current_dir))


# 3) Розпакування переданого файлу в current_dir.
if file_extension == '.zip':
    with zipfile.ZipFile(file_name, 'r') as zip_ref:
        for f in zip_ref.namelist():
            if f not in extracted_files:
                zip_ref.extract(f, current_dir)        
        # zip_ref.extractall(current_dir)
        print("Архів zip розпаковано")
elif file_extension == '.tar':
    with tarfile.open(file_name, 'r') as tar_ref:
        for f in tar_ref.namelist():
            if f not in extracted_files:
                tar_ref.extract(f, current_dir)  
        # tar_ref.extractall(current_dir)
        print("Архів tar розпаковано")
else:
    print("Скрипт розпаковує тільки архіви ZIP і TAR. Розпакування переданого файлу неможливе.")


print("Готово!")