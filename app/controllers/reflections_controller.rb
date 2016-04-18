class ReflectionsController < ApplicationController
  before_action :set_reflection, only: [:show, :edit, :update, :destroy]

  def index
    if params[:see] == "journals"
      @reflections = current_user.reflections.where(entry_type: "Journal")
    elsif params[:see] == "ideas"
      @reflections = current_user.reflections.where(entry_type: "Idea")
    else
      @reflections = current_user.reflections
    end
  end

  def show
    if @reflection.user_id != current_user.id
      redirect_to root_path
    end
  end

  def new
    @reflection = Reflection.new
  end

  def edit
    if @reflection.user_id != current_user.id
      redirect_to root_path
    end
  end

  def create
    @reflection = Reflection.new(reflection_params)
    @reflection.user_id = current_user.id

    require 'json'
    require 'open-uri'

    @ip = JSON.parse(open('http://ipinfo.io').read)
    @reflection.ip_address = @ip["ip"]

    respond_to do |format|
      if @reflection.save
        format.html { redirect_to @reflection, notice: 'Reflection was successfully created.' }
        format.json { render :show, status: :created, location: @reflection }
      else
        format.html { render :new }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reflections/1
  def update
    if @reflection.user_id != current_user.id
      redirect_to root_path
    end

    respond_to do |format|
      if @reflection.update(reflection_params)
        format.html { redirect_to @reflection, notice: 'Reflection was successfully updated.' }
        format.json { render :show, status: :ok, location: @reflection }
      else
        format.html { render :edit }
        format.json { render json: @reflection.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reflection.destroy
    respond_to do |format|
      format.html { redirect_to reflections_url, notice: 'Reflection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reflection
      @reflection = Reflection.find(params[:id])
    end

    def reflection_params
      params.require(:reflection).permit(:entry_type, :feels, :body, :ip_address, :latitude, :longitude)
    end
end
