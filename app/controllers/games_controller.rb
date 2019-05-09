class GamesController < ApplicationController

  def included?(guess, grid)
    guess.all? { |letter| guess.count(letter) <= grid.count(letter) }
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
    @congrats = ""

    @letter_array = @letters.split(" ")
    @word_letters = @word.upcase.split("")

  if included?(@word_letters, @letter_array)
    @congrats = "Congrats"
  end

    # check if words are in the grid
  end


end
