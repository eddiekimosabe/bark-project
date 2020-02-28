class LikesController < ApplicationController
	before_action :set_dog
	before_action :set_like, only: [:destroy]

	def create
		@like = Like.new(user_id: current_user.id, dog_id: @dog.id)
		respond_to do |format|
			if already_liked?
				format.html { redirect_back fallback_location: root_path, notice: "You can't like more than once"}
			elsif owner?
				format.html { redirect_back fallback_location: root_path, notice: "Can't like your own dog"}
			else
				if @like.save
					format.html { redirect_back fallback_location: root_path }
				else
					format.html { redirect_back fallback_location: root_path, notice: "Something went wrong"}
				end
			end
		end
	end

	def destroy
		if !already_liked? 
			flash[:notice] = "Cannot unlike"
		else
			@like.destroy
		end
			redirect_back fallback_location: root_path
	end

	private

	def set_like
		@like = @dog.likes.find(params[:id])
	end

	def set_dog
		@dog = Dog.find(params[:dog_id])
	end

  def already_liked?
    Like.where(user_id: current_user.id, dog_id: params[:dog_id]).exists?
  end

  def owner?
  	current_user == @dog.owner
  end
end