class PhotosController < ApplicationController
  before_action :check_current_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    # @photos = Photo.status_active
    # @photos = Photo.paginate(:page => params[:page], per_page: 6)
    # @photos = Photo.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 2, :page => params[:page])
    @photos = Photo.search(params[:search]).paginate(:page => params[:page], per_page: 6)
    @photo = Photo.new
  end

  def home
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find_by_id(params[:id])
  end

  def show
    @photo = Photo.find_by_id(params[:id])
  end

  def update
    @photo = Photo.find_by_id(params[:id])
    if @photo.update(params_photo)
      flash[:notice] = "Success Update Records"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'edit'
    end
  end

  def create
    @photo = Photo.new(params_photo)
    if @photo.save
      flash[:notice] = "Success Add Records"
      redirect_to action: 'index'
    else
      flash[:error] = "data not valid"
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find_by_id(params[:id])
    if @photo.destroy
      flash[:notice] = "Success Delete a Records"
      redirect_to action: 'index'
    else
      flash[:error] = "fails delete a records"
      redirect_to action: 'index'
    end
  end

  # def import
  #   Photo.import(params[:file])
  #   redirect_to root_url, notice: "Products imported."
  # end

  private
  def params_photo
    params.require(:photo).permit(:title, :content, :status, :gambar)
  end

end
