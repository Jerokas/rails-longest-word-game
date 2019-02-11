require 'json'
require 'open-uri'




class GamesController < ApplicationController

  def new
    @letters = ('a'..'z').to_a.sample(10)
  end


  def score
    @answer = params[:answer]

    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    dictionary_unparsed = URI.open(url).read
    dictionary = JSON.parse(dictionary_unparsed)

    if dictionary[:found] == true
      "CONGRDULATIONS! #{@answer.upcase} is a valid word!"
    elsif dictionary[:found] == false
      "Sorry #{@answer.upcase} is not a valid english word!"
    elsif @answer.each_char.to_s {|letter| letter.include? @letters}
    end
  end
end
