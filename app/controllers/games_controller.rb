require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def included?(guess, grid)
    guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    return json['found']
  end


  def new
    @letters = []
    letter_range = ('A'..'Z')
    10.times do
      @letters << letter_range.to_a.sample
    end
  end

  def score
    @word = params[:word]
    @letters = params[:letters]
    @result = ""

    @letter_array = @letters.split(" ")
    @word_letters = @word.upcase.split("")

    if included?(@word_letters, @letter_array)
      @congrats = "Congrats"
        if english_word?(@word)
          @result = "Congrats - #{@word} is a valid a word 🤗"
        else
          @result = "Sorry - #{@word} is not an English word 🤔"
        end
      else
      @result = "The letters for #{@word} weren't all in the grid ☹️"
      end
  end

    # check if words are in the grid
end
