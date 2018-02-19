require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('a'..'z').to_a.sample
    end
  end

  def score
    @word = params[:response]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    user_serialized = open(url).read
    @result = JSON.parse(user_serialized)

    @count_letters = []
    @word_array = @word.split('')
    @word_array.each do |word_letter|
      @letters.each do |letter|
       @count_letters << word_letter if letter == word_letter
      end
      @exist = @count_letters == @word
    end
  end
end
