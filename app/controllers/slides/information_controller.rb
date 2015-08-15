class Slides::InformationController < ApplicationController
  def show
    @slide = Slide.find(params[:slide_id])
    end
end
