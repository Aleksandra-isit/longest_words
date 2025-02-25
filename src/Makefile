CC = g++
CFLAGS = -Wall -std=c++11
TARGET = longest_words
SRC = longest_words.cpp
PREFIX ?= /usr

# Список необходимых пакетов
REQUIRED_LIBS = build-essential

all: check_compiler check_dependencies $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

install: $(TARGET)
	install -d "../usr/bin"
	install -m 755 $(TARGET) "../usr/bin/$(TARGET)"

clean:
	rm -f $(TARGET)

check_compiler:
	@if ! command -v $(CC) &> /dev/null; then \
		echo "Компилятор $(CC) не установлен. Устанавливаем..."; \
		sudo apt-get update && sudo apt-get install -y build-essential; \
		if [ $$? -ne 0 ]; then \
			echo "Ошибка при установке компилятора. Попробуйте установить вручную."; \
			exit 1; \
		fi \
	fi

check_dependencies:
	@for lib in $(REQUIRED_LIBS); do \
		if ! dpkg -l | grep -q $$lib; then \
			echo "Пакет $$lib не установлен. Устанавливаем..."; \
			sudo apt-get update && sudo apt-get install -y $$lib; \
			if [ $$? -ne 0 ]; then \
				echo "Ошибка при установке $$lib. Попробуйте установить вручную."; \
				exit 1; \
			fi \
		fi \
	done
