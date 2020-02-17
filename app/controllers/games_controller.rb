class GamesController < ApplicationController
  def new
    @alphabet = ('a'..'z').to_a
    @letters = @alphabet.sample(10)
  end

  def score
    @letters = params[:letters]

    params[:word].split('').each do |letter|
      if @letters.include?(letter)
        @result = "Congraturations! #{params[:word]} is ok"
      else
        @result = "sorry, #{params[:word]} can't be built"
      end
    end
  end
end
