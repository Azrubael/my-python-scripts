# [1] - Установка Python 3.10 (или более позднего), pip и python3.10-venv
* https://docs.python.org/3/using/windows.html#launcher
* https://pip.pypa.io/en/stable/installing/
```bash
    apt install python3.10-venv
```


# [2] - Создание изолированного окружения
* При работе в Linux
```bash
    $ python3 -m venv azenv
    $ source azenv/bin/activate
```
* При работе в Windows
```bash
    $ py -m venv azwenv
    $ .\azwenv\Scripts\activate
```


# [3] - Автоконфигурация изолированного окружения Python3
```bash
    (azenv)$ pip install -r dependencies.txt
```


# [4] - Запуск приложения
* При работе в Linux
```bash
    (azenv)$ python3 unme.py
```
* При работе в Windows
```bash
    (azenv)$ py python3 runme.py
```


# [5] - Создание перечня зависимостей
```bash
    (azenv)$ pip freeze > dependencies.txt
```


# [6] - Деактивация изолированой среды
```bash
    (azenv)$ deactivate
```
