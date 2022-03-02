require "byebug"

class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end



  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length,'_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    attempted_chars.include?(char) ? true : false
  end

  def get_matching_indices(char)
    arr= []
    @secret_word.split("").each_with_index do |letter, i|
      (letter == char) ? arr << i: arr
    end
    arr

  end

  def fill_indices(char, arr)
    arr.each do |index|
      @guess_word[index] = char
    end
  end

  def try_guess(char)
    if already_attempted?(char) 
      p "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matches = self.get_matching_indices(char)
    self.fill_indices(char,matches)

    @remaining_incorrect_guesses += -1 if matches.length == 0

    true

  end

  def ask_user_for_guess()
    p "Enter a char"
    input = gets.chomp

    self.try_guess(input)
  end

  def win?
    if @guess_word.join("") == @secret_word
      p "WIN"
      return true
    else
      return false
    end
  end
  
  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end
    false
  end

  
   




end
