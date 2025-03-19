# Используем официальный образ Ubuntu 22.04
FROM ubuntu:22.04

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y \
    bash \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Копируем .deb пакет внутрь контейнера
COPY longest-words_4.0_all.deb /tmp/

# Устанавливаем .deb пакет
RUN dpkg -i /tmp/longest-words_4.0_all.deb || apt-get install -f -y

# Проверяем, что файл был установлен
RUN ls -l /usr/bin/longest_words

# Делаем его исполнимым
RUN chmod +x /usr/bin/longest_words

# Запускаем программу
CMD ["/usr/bin/longest_words"]

