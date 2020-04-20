class StaticController < ApplicationController
  def homepage
    @games = Game.all
    # @game = Game.all
  end

  # def about
  # end

  # def contact
  # end


end