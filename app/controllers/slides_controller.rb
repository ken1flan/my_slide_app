class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :information]
  before_action :set_owned_slide, only: [:edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @slides = Slide.published
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
    render layout: false
  end

  def information
  end

  # GET /slides/new
  def new
    @slide = current_user.slides.new
  end

  # GET /slides/1/edit
  def edit
  end

  # POST /slides
  # POST /slides.json
  def create
    @slide = current_user.slides.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to edit_slide_url, notice: 'Slide was successfully created.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to edit_slide_url, notice: 'Slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
      not_found unless can_browse_slide?(@slide)
    end

    def set_owned_slide
      @slide = current_user.slides.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:title, :image_url, :description, :body, :published)
    end
end
