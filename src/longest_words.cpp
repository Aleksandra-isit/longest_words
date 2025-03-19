#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>

// Функция для разделения текста на фразы (по точкам)
std::vector<std::string> splitIntoPhrases(const std::string &text) {
    std::vector<std::string> phrases;
    std::stringstream ss(text);
    std::string phrase;
    while (std::getline(ss, phrase, '.')) {
        if (!phrase.empty()) {
            phrases.push_back(phrase);
        }
    }
    return phrases;
}

// Функция для поиска самых длинных слов в фразе
std::vector<std::string> findLongestWords(const std::string &phrase) {
    std::vector<std::string> words;
    std::stringstream ss(phrase);
    std::string word;
    size_t max_length = 0;

    // Разбиваем фразу на слова и ищем самое длинное
    while (ss >> word) {
        if (word.length() > max_length) {
            max_length = word.length();
            words.clear();
            words.push_back(word);
        } else if (word.length() == max_length) {
            words.push_back(word);
        }
    }

    return words;
}

// Функция для сбора самых длинных слов из всех фраз
std::string collectLongestWords(const std::string &text) {
    std::vector<std::string> phrases = splitIntoPhrases(text);
    std::string result;

    for (const auto &phrase : phrases) {
        std::vector<std::string> longestWords = findLongestWords(phrase);
        for (const auto &word : longestWords) {
            if (!result.empty()) {
                result += " ";
            }
            result += word;
        }
    }

    return result;
}

// Главная функция программы
int main(int argc, char* argv[]) {
    std::string text;

    // Если передан аргумент командной строки, используем его
    if (argc > 1) {
        text = argv[1];
    } else {
        std::cout << "Введите текст: ";
        std::getline(std::cin, text);
    }

    if (text.empty()) {
        std::cerr << "Ошибка: Введен пустой текст." << std::endl;
        return 1;
    }

    // Собираем и выводим самые длинные слова из фраз
    std::string longestWords = collectLongestWords(text);
    std::cout << "Самое длинное слово(а):\t" << longestWords << std::endl;  // Выводим только результат

    return 0;
}
