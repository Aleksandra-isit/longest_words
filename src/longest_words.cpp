#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>

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

std::vector<std::string> findLongestWords(const std::string &phrase) {
    std::vector<std::string> words;
    std::stringstream ss(phrase);
    std::string word;
    size_t max_length = 0;

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

int main() {
    std::string text;
    std::cout << "Введите текст: ";
    std::getline(std::cin, text);

    if (text.empty()) {
        std::cerr << "Ошибка: Введен пустой текст." << std::endl;
        return 1;
    }

    if (text.length() > 1000) {
        std::cerr << "Ошибка: Текст слишком длинный. Максимальная длина - 1000 символов." << std::endl;
        return 1;
    }

    std::string longestWords = collectLongestWords(text);
    std::cout << "Самые длинные слова из каждой фразы: " << longestWords << std::endl;

    return 0;
}
