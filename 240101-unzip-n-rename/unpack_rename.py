import os
import sys
import json
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

extracted_files = os.listdir(current_dir)


# 4) Перевірка існування файла з розширенням txt серед великої кількості файлів в директорії current_dir і створення словників с назвами зайнять і файлів.
lessons_names = {}
files_dict = {}
for idx, file in enumerate(extracted_files):
    if file.endswith(".txt"):
        with open(os.path.join(current_dir, file), 'r') as f:
            lines = f.readlines()
            for idx, line in enumerate(lines):
                processed_line = line.replace(':', '').rstrip()
                lessons_names[str(idx + 1)] = processed_line
    if file.startswith("lesson") and file.endswith(".mp4"):
        key = file.replace("lesson", "").replace(".mp4", "")
        files_dict[key] = os.path.join(current_dir, file)

# print(json.dumps(lessons_names, indent=2))


# 5) Перевірка чи співпадають розміри створених словників
lessons = len(lessons_names)
movies = len(files_dict)
print("Словник lessons_names має довжину: ", lessons)
print("Словник files_dict має довжину: ", movies)
if lessons != movies:
    print("Розміри створених словників не співпадають!")


# 6) Перейменування розпакованих файлів
for key, value in files_dict.items():
    old_name = value
    new_name = current_dir + "/" + key + " -" + lessons_names.get(key) + ".mp4"
    
    try:
        os.rename(old_name, new_name)
        print(old_name, "-->", new_name)
    except FileNotFoundError:
        print("Файл", old_name, "не існує!")
    except FileExistsError:
        print("Файл", new_name, "вже існує!")
    except Exception as e:
        print("Сталася несподівана помилка під час перейменування файлу:", e)



