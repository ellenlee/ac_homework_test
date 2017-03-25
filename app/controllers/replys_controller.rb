class ReplysController < ApplicationController

	def new
		@reply = Reply.new
	end

	def create
		@reply = current_user.replys.new(reply_params)
		@reply.photo_id = params[:photo_id]
		@reply.save

		redirect_to photo_path(params[:photo_id])
	end

	private

	def reply_params
		params.require(:reply).permit( :content, :photo_id)
	end

end
