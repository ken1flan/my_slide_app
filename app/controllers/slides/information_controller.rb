class Slides::InformationController < ApplicationController
  def show
    @slide = Slide.find(params[:slide_id])
    not_found if !can_browse_slide?(@slide)
  end
end
