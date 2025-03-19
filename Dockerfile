# Используем официальный образ Ubuntu 22
FROM ubuntu:22.04

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb пакет внутрь контейнера
COPY longest-words_4.0_all.deb /tmp/

# Выводим содержимое .deb пакета перед установкой, чтобы проверить структуру
RUN dpkg-deb -c /tmp/longest-words_4.0_all.deb

# Устанавливаем .deb пакет
RUN dpkg -i /tmp/longest-words_4.0_all.deb || apt-get install -f -y

# Проверяем, что файл был установлен
RUN ls -l /usr/bin/longest_words || echo "Файл не найден в /usr/bin/"

# Делаем его исполнимым, если нужно
RUN chmod +x /usr/bin/longest_words || echo "Не удалось сделать файл исполнимым"

# Проверяем, где установлен файл, если его нет в /usr/bin
RUN find / -name longest_words || echo "Файл не найден в системе"

# Запускаем программу
CMD ["/usr/bin/longest_words"]
