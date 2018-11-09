class MoviesController < ApplicationController
  def index
  end

  def search
    @@tab_global = SearchMovie.new.test(params[:movies][:name])
    puts "----------------------"
    puts @@tab_global
  end
end
