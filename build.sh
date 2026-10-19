#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt
# 收集所有静态文件(admin 后台、第三方包的 CSS/JS、你自己的 static)到 STATIC_ROOT 目录,供生产环境 Nginx/WhiteNoise 等提供。--noinput 表示不询问确认,直接覆盖
python manage.py collectstatic --noinput
# 执行数据库迁移,把 Django 模型变更同步到数据库表结构。
python manage.py migrate