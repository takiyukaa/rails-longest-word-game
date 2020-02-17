require 'open-uri'

class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = @alphabet.sample(10)
  end

  def score
    @letters = params[:letters]
    url = "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
    @answer = JSON.parse(open(url).read)

    params[:word].split('').each do |letter|
      if @letters.include?(letter) && @answer["found"] == true
        @result = "Congraturations! #{params[:word]} is valid word:)"
      elsif @letters.include?(letter) && @answer["found"] == false
        @result = "sorry, #{params[:word]} does not seem to be a English word..."
      else
        @result = "sorry, but #{params[:word]} can't be built out of [#{@letters}]"
      end
    end
  end
end
