CC = g++
CFLAGS = -Wall -std=c++11
TARGET = longest_words
PREFIX ?= /usr

# Список необходимых пакетов
REQUIRED_LIBS = build-essential

all: check_compiler check_dependencies $(TARGET)

$(TARGET): longest_words.cpp
	$(CC) $(CFLAGS) -o $(TARGET) longest_words.cpp

install: $(TARGET)
	install -d "$(DESTDIR)$(PREFIX)/bin"
	install -m 755 $(TARGET) "$(DESTDIR)$(PREFIX)/bin/$(TARGET)"

clean:
	rm -f $(TARGET)

check_compiler:
	@if ! command -v $(CC) &> /dev/null; then \
		echo "Ошибка: Компилятор $(CC) не установлен."; \
		read -p "Хотите установить его сейчас? (y/n): " choice; \
		if [ "$$choice" = "y" ] || [ "$$choice" = "Y" ]; then \
			sudo apt-get update && sudo apt-get install -y build-essential; \
			if [ $$? -ne 0 ]; then \
				echo "Ошибка при установке компилятора. Попробуйте установить вручную."; \
				exit 1; \
			fi \
		else \
			echo "Сборка прекращена. Установите компилятор вручную."; \
			exit 1; \
		fi \
	fi

check_dependencies:
	@for lib in $(REQUIRED_LIBS); do \
		if ! dpkg -l | grep -q $$lib; then \
			echo "Ошибка: Библиотека или пакет $$lib не установлен."; \
			read -p "Хотите установить его сейчас? (y/n): " choice; \
			if [ "$$choice" = "y" ] || [ "$$choice" = "Y" ]; then \
				sudo apt-get update && sudo apt-get install -y $$lib; \
				if [ $$? -ne 0 ]; then \
					echo "Ошибка при установке $$lib. Попробуйте установить вручную."; \
					exit 1; \
				fi \
			else \
				echo "Сборка прекращена. Установите $$lib вручную."; \
				exit 1; \
			fi \
		fi \
	done

install_dependencies:
	sudo apt-get update && sudo apt-get install -y build-essential