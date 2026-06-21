# Инструкция по выполению первой самостоятельной работы

## СРС 1:  Diagrams-as-a-code
![](https://github.com/foodeater86/vbd/blob/main/srs1/graphviz.svg)


---
1. Перейдите на сайт:  
   [https://dreampuf.github.io/GraphvizOnline/](https://dreampuf.github.io/GraphvizOnline/)
2. Вставьте ваш код в редактор на сайте.

---

# Инструкция по выполению второй самостоятельной работы
## СРС 2. Миграции

---

## 1. Скачать python
скачать python с официального сайта: https://www.python.org/downloads/

---

## 2. Скачать yoyo-migration
В командной строке выполните:

```bash
python -m pip install yoyo-migrations
```
---

## 3. Создание базы данных

Создайте базу данных, в которую будут применены миграции (целевую БД).




---
## 4. Создайте папку проекта и внутри неё:

### Файл `yoyo.ini`

В этом файле укажите:

- пароль от вашей БД
- название БД
- port

### Папка `migrations`

Внутри неё разместите файлы миграций:

- `001.create_tables.sql`
- `001.create_tables.rollback.sql`
- `002.insert.into.tables.sql`
- `002.insert.into.tables.rollback.sql`

---



## 5. Применение миграций

В командной строке (находясь в папке проекта) выполните:

```bash
python -m yoyo apply
```
---
## 6. Откат миграций

В командной строке (находясь в папке проекта) выполните:

```bash
python -m yoyo rollback
