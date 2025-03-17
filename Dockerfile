# استخدم Ubuntu كأساس
FROM ubuntu:latest

# تثبيت المتطلبات الأساسية
RUN apt update && apt install -y lua5.3 luarocks curl wget

# تثبيت المكتبات المطلوبة
RUN luarocks install luasocket
RUN luarocks install luasec
RUN luarocks install lua-utf8

# تعيين مجلد العمل
WORKDIR /app

# نسخ جميع الملفات إلى الحاوية
COPY . .

# تشغيل البوت
CMD ["lua", "SNAP.lua"]
