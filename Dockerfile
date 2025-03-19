FROM ubuntu:latest

# Устанавливаем зависимости
RUN apt-get update && \
    apt-get install -y build-essential g++ software-properties-common wget \
    && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
    && apt-get update \
    && apt-get install --only-upgrade libstdc++6

# Копируем .deb файл в контейнер
COPY longest-words_4.0_all.deb /tmp/

# Устанавливаем пакет
RUN dpkg -i /tmp/longest-words_4.0_all.deb || apt-get install -f -y

# Проверяем наличие бинарника
RUN ls -l /usr/bin/longest_words || echo "Файл не найден в /usr/bin/"

# Делаем бинарник исполнимым
RUN chmod +x /usr/bin/longest_words || echo "Не удалось сделать файл исполнимым"

# Проверяем, что бинарник доступен в системе
RUN find / -name longest_words || echo "Файл не найден в системе"

# Команда запуска с параметром (например, с текстом для обработки)
CMD ["/usr/bin/longest_words", "Раз два три четыре 1000000000 2000000000 9000000000 950000"]
