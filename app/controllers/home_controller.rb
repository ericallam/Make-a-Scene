class HomeController < ApplicationController
  
  def index
    @images = Dir["#{Rails.root}/public/images/carousel/*.jpg"].map {|p| p.gsub("#{Rails.root}/public/images/", "") }
  end

  def faq
  end
  
end
