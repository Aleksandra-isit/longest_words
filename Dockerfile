# Используем официальный образ Ubuntu 22.04
FROM ubuntu:22.04

# Устанавливаем обновления и необходимые утилиты
RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    build-essential \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb пакет в контейнер
COPY longest-words_4.0_all.deb /tmp/

# Распаковываем .deb пакет для проверки содержимого
RUN dpkg-deb -c /tmp/longest-words_4.0_all.deb

# Устанавливаем .deb пакет, если возникают проблемы с зависимостями — исправляем их
RUN dpkg -i /tmp/longest-words_4.0_all.deb || apt-get install -f -y

# Проверяем наличие исполнимого файла и его доступность
RUN ls -l /usr/bin/longest_words || echo "Файл не найден в /usr/bin/"
RUN chmod +x /usr/bin/longest_words || echo "Не удалось сделать файл исполнимым"
RUN find / -name longest_words || echo "Файл не найден в системе"

# Запускаем контейнер с программой (если необходимо)
CMD ["/usr/bin/longest_words"]
