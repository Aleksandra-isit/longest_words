#!/bin/bash

# Определяем путь к тестируемой программе
PROGRAM_PATH="./usr/bin/longest_words"

# Проверяем, существует ли файл
if [ ! -f "$PROGRAM_PATH" ]; then
    echo "Ошибка: Файл $PROGRAM_PATH не найден!"
    exit 1
fi

# Тест 1: Проверка с простым вводом
echo "Тест 1: Проверка с простым вводом"
OUTPUT=$($PROGRAM_PATH "apple banana orange")
EXPECTED="banana orange"
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 1 пройден успешно"
else
    echo "Тест 1 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi

# Тест 2: Проверка с одинаковыми по длине словами
echo "Тест 2: Проверка с одинаковыми по длине словами"
OUTPUT=$($PROGRAM_PATH "cat dog bat")
EXPECTED="cat dog bat"
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 2 пройден успешно"
else
    echo "Тест 2 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi

# Тест 3: Проверка с пустым вводом
echo "Тест 3: Проверка с пустым вводом"
OUTPUT=$($PROGRAM_PATH "")
EXPECTED=""
if [ "$OUTPUT" == "$EXPECTED" ]; then
    echo "Тест 3 пройден успешно"
else
    echo "Тест 3 не пройден. Ожидалось: $EXPECTED, но получено: $OUTPUT"
fi
