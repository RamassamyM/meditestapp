class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :codebar, :fake, :number]

  def home
  end

  def codebar
  end

  def number
  end

  def fake
  end
end
