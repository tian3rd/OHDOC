"""
Wordle
Assignment 1
Semester 1, 2022
CSSE1001/CSSE7030
"""

from re import S
from string import ascii_lowercase
from typing import Optional

from a1_support import (
    load_words,
    choose_word,
    VOCAB_FILE,
    ANSWERS_FILE,
    CORRECT,
    MISPLACED,
    INCORRECT,
    UNSEEN,
)

MAX_GUESSES = 6
WORD_SIZE = 6
DASHED_PROMPT = "-" * 15
LETTERS = "abcdefghijklmnopqrstuvwxyz"

# Replace these <strings> with your name, student number and email address.
__author__ = "<Your Name>, <Your Student Number>"
__email__ = "<Your Student Email>"

# 5.1


def has_won(guess: str, answer: str) -> bool:
    """ Returns True if the guess is correct, False otherwise.

    Parameters:
        guess (str): The current guess.
        answer (str): The correct answer.

    Returns:
        bool: True if the guess is correct, False otherwise.
    """
    assert len(guess) == 6 and len(answer) == 6
    return guess == answer

# 5.2


def has_lost(guess_number: int) -> bool:
    """ Returns True if the number of guesses that have occurred is equal to or greater than the maximum number of guesses, False otherwise.

    Parameters:
        guess_number (int): The number of guesses that have occurred.

    Returns:
        bool: True if the number of guesses that have occurred is equal to or greater than the maximum number of guesses, False otherwise.
    """
    return guess_number >= MAX_GUESSES

# 5.3


def remove_word(words: tuple[str, ...], word: str) -> tuple[str, ...]:
    """ Removes the given word from the given words.

    Parameters:
        words (tuple[str]): The words to remove the given word from.
        word (str): The word to remove from the given words.
    """
    return tuple(w for w in words if w != word)

# 5.4


def prompt_user(guess_number: int, words: tuple[str, ...]) -> str:
    """ Prompts the user for the next guess, reprompting until either a valid guess is entered, or a selection for help, keyboard, or quit is made.

    Parameters:
        guess_number (int): The number of guesses that have occurred.
        words (tuple[str]): The words that the user has not yet guessed.

    Returns:
        str: first valid guess or request for help, keyboard, or quit.
    """
    while True:
        user_input = input(f"Enter guess {guess_number}: ")
        if len(user_input) < WORD_SIZE:
            print(f"Invalid! Guess must be of length {WORD_SIZE}")
        elif user_input not in words:
            print(f"Invalid! Unknown word")
        else:
            return user_input

# 5.5


def process_guess(guess: str, answer: str) -> str:
    """ Processes the guessed word and returns the corresponding colored blocks.

    Parameters:
        guess (str): The guessed word.
        answer (str): The correct answer.

    Returns:
        str: The corresponding colored blocks.
    """
    assert len(guess) == 6 and len(answer) == 6
    blocks = ""
    for i in range(WORD_SIZE):
        if guess[i] == answer[i]:
            blocks += CORRECT
        elif guess[i] in answer:
            blocks += MISPLACED
        else:
            blocks += INCORRECT
    return blocks

# 5.6


def update_history(history: tuple[tuple[str, str], ...], guess: str, answer: str) -> tuple[tuple[str, str], ...]:
    """ Updates the history with the given guess and answer.

    Parameters:
        history (tuple[tuple[str, str]]): The current history.
        guess (str): The current guess.
        answer (str): The current answer.

    Returns:
        tuple[tuple[str, str]]: The updated history.
    """
    return history + ((guess, process_guess(guess, answer)),)

# 5.7


def print_history(history: tuple[tuple[str, str], ...]) -> None:
    """ Prints the history of guesses and answers.

    Parameters:
        history (tuple[tuple[str, str]]): The history of guesses and answers.
    """
    print(DASHED_PROMPT)
    for i in range(len(history)):
        guessed_word = "".join([" " + history[i][0][j]
                               for j in range(WORD_SIZE)])
        print(f"Guess {i + 1}:{guessed_word}")
        print(f"         {history[i][1]}")
    print(DASHED_PROMPT)

# 5.8


def print_keyboard(history: tuple[tuple[str, str], ...]) -> None:
    """ Prints the keyboard in a user-friendly way with the info currently known about each letter.

    Parameters:
        history (tuple[tuple[str, str]]): The history of guesses and answers.
    """

    keyboard_info = {letter: "  " for letter in LETTERS}
    for record in history:
        for i in range(WORD_SIZE):
            keyboard_info[record[0][i]] = record[1][i]
    print("Keyboard information")
    print(DASHED_PROMPT)
    for i in range(len(LETTERS) // 2):
        print(f"{LETTERS[i * 2]}: {keyboard_info[LETTERS[i * 2]]}\t"
              f"{LETTERS[i * 2 + 1]}: {keyboard_info[LETTERS[i * 2 + 1]]}")


# 5.9


def print_stats(stats: tuple[int, ...]) -> None:
    """ Prints the statistics of the game.

    Parameters:
        stats (tuple[int]): The statistics of the game representing the number of rounds won in 1-6 guesses, and the number of rounds lost.
    """
    print()
    print("Games won in:")
    for i in range(MAX_GUESSES):
        print(f"{i + 1} moves: {stats[i]}")
    print(f"Games lost: {stats[MAX_GUESSES]}")


# 5.10


def main():
    print("Implement your solution and run this file")

    vocab = load_words("vocab.txt")
    history = update_history((), 'python', 'crayon')
    print_history(history)

    history = update_history(history, guess_next(vocab, history), 'crayon')
    print_history(history)

    history = update_history(history, guess_next(vocab, history), 'crayon')
    print_history(history)

    print(guess_next(vocab, history))


# 6.1


def guess_next(vocab: tuple[str, ...], history: tuple[tuple[str, str], ...]) -> Optional[str]:
    """ Returns a valid next guess that doesn't violate known info from previous guesses.

    Parameters:
        vocab (tuple[str]): The possible words in file 'vocab.txt'.
        history (tuple[tuple[str, str]]): The history of guesses and answers.

    Returns:
        Optional[str]: The next guess to make, or None if no such guess exists.
    """
    correct_cond, misplaced_cond, incorrect_cond = get_conditions(history)
    print("conditions: ", get_conditions(history))

    for word in vocab:
        if correct_check(word, correct_cond) and misplaced_check(word, misplaced_cond) and incorrect_check(word, incorrect_cond):
            return word


def get_conditions(history: tuple[tuple[str, str], ...]) -> tuple[str, str, str]:
    correct, misplaced, incorrect = "", "", ""
    for record in history:
        guessed_word = record[0]
        guessed_result = record[1]
        for i in range(WORD_SIZE):
            if guessed_result[i] == CORRECT:
                if guessed_word[i] not in correct:
                    correct += f"{i}{guessed_word[i]}"
            elif guessed_result[i] == MISPLACED:
                misplaced += f"{i}{guessed_word[i]}"
            else:
                incorrect += guessed_word[i]
    return correct, misplaced, incorrect


def correct_check(word: str, cond: str) -> bool:
    for i in range(len(cond) // 2):
        pos = int(cond[i * 2])
        if word[pos] != cond[i * 2 + 1]:
            return False
    return True


def misplaced_check(word: str, cond: str) -> bool:
    for i in range(len(cond) // 2):
        pos = int(cond[i * 2])
        if word[pos] == cond[i * 2 + 1]:
            return False
        if cond[i * 2 + 1] not in word:
            return False
    return True


def incorrect_check(word: str, cond: str) -> bool:
    for letter in cond:
        if letter in word:
            return False
    return True


if __name__ == "__main__":
    main()
