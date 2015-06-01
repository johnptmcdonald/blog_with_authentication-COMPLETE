class CommentsController < ApplicationController

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		comment = Comment.find(params[:id])
		comment.update_attributes(comment_params)
	end

	def create
		comment = Comment.new(comment_params)
		post = Post.find(params[:post_id])

		comment.post = post

		if comment.save
			redirect_to post_path(post)
		else
			render :new
		end
	end

	def comment_params
		params.require(:comment).permit(:body)
	end
end
