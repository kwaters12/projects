class DiscussionsController < ApplicationController
  before_action :set_discussion, only: [:flag]
  
  def index
    @discussions = Discussion.find(:all)
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    @discussion.save
    redirect_to discussions_path
  end

  def update
    @discussion = Discussion.find(params[:id])
    @discussion.update_attributes(discussion_params)
    redirect_to discussion_url
  end

  def discussion_params
    params.require(:discussion).permit(:title, :body)
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to discussions_path
  end

  # Build a custom action for discussions controller 
  # with “post” called “flag” and requires an id to be 
  # passed
  def flag
    @discussion = Discussion.find(params[:id])
    @discussion.save
  end

end
