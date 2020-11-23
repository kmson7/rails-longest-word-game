class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    # I probably dont have to use @ unless I am passing to the view.
    user_letters = params['word'].split('')
    given_letters = params['letters'].split

    user_letters.each do |letter|
      # binding.pry
      if given_letters.include?(letter)
        given_letters.delete(letter)
      else
        # puts "fail, no such letter in given"
        @result = false
        return
      end
    end
    # puts "success!!"
    @result = true
  end
end
