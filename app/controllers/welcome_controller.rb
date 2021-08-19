class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de ruby [COOKIE]"
  end
end
