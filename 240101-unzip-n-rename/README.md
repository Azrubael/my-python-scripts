* unpack.* - Скрипт для розпаковки файла. Шлях до директорії з файлом для розпаковки передається агрументом під час виклику скрипта.

* unpack_rename.* - Скрипти для розпаковки файла. Шлях до директорії з файлом для розпаковки передається агрументом під час виклику скрипта. Після розпаковки виконується перейменування файлів згідно даних текстового файла, що вкладений в архів. Для перейменування використовується асоціативний масив (словник).

* re.sh - Скрипт Bash для розпаковки файла. Шлях до директорії з файлом для розпаковки передається агрументом під час виклику скрипта. Після розпаковки виконується перейменування файлів згідно даних текстового файла, що вкладений в архів. *Але є питання щодо результатів*.


# [1] - Встановлння Python 3.10 (або пізнішого), pip и python3.10-venv
* https://docs.python.org/3/using/windows.html#launcher
* https://pip.pypa.io/en/stable/installing/
```bash
    apt install python3.10-venv
```


# [2] - Створення ізольованного оточення
* Для Linux
```bash
    $ python3 -m venv azenv
    $ source azenv/bin/activate
```
* Для Windows
```bash
    $ py -m venv azwenv
    $ .\azwenv\Scripts\activate
```


# [3] - Автоконфігурація ізольованного оточення Python3
```bash
    (azenv)$ pip install -r dependencies.txt
```


# [4] - Запуск скрипта
* При работе в Linux
```bash
    (azenv)$ python3 <скрипт>.py <шлях/до/директорії/де/архів>
```
* При работе в Windows
```bash
    (azenv)$ py <скрипт>.py <шлях/до/директорії/де/архів>
```


# [5] - Створення переліку залежностей
```bash
    (azenv)$ pip freeze > dependencies.txt
```


# [6] - Деактивація ізольованого середовища
```bash
    (azenv)$ deactivate
```

