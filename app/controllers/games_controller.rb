require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    answer = params[:answer]
    @letters = params[:letters]
    @letters_split = @letters.split('')
    url = "https://wagon-dictionary.herokuapp.com/#{answer}"
    wagon_dictionary = open(url).read
    @result = JSON.parse(wagon_dictionary)
    @word = @result['word'].upcase
    @word_split = @word.split('')
    difference = @word_split - @letters_split
    if difference == []
      @result = "congratulation #{@word} is a valid english word!"
    else
      @result = "sorry"
    end
  end
end
