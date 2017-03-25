class PhotosController < ApplicationController

	before_action :authenticate_user, only:[ :new]
	before_action :set_params, only:[ :show, :edit, :update, :destroy]

  def index
  	@photos = Photo.all
  	@photos = Photo.page(params[:page]).per(5)
	end

	def new
		# authenticate_user!
		@photo = Photo.new
	end

	def create
 		@photo = Photo.create(photo_params)
 		
 		if @photo.save
  		redirect_to photos_url
 		else
  		render :action => :new
  	end
	end

	def show
 		# @photo = Photo.find(params[:id])
 		@replys = @photo.replys
	end

	def edit
 		# @photo = Photo.find(params[:id])
	end

	def update
		# @photo = Photo.find(params[:id])
		@photo.update(photo_params)
		
		if @photo.update(photo_params)
  		redirect_to photo_url(@photo)
		else
  		render :action => :edit
		end
	end

	def destroy
 		# @photo = Photo.find(params[:id])
 		@photo.destroy

 		redirect_to photos_url
	end

	private

		def set_params
			@photo = Photo.find(params[:id])
		end

		def photo_params
 			params.require(:photo).permit(:title, :description, :category_id)
		end


end
