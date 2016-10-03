class TopicsController < ApplicationController
  def index
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end
  
  def create
     @topic = Topic.new
     @topic.title = params[:topic][:title]
     @topic.body = params[:topic][:body]

     if @topic.save
       flash[:notice] = "Topic was saved successfully."
       redirect_to @topic
     else
       flash.now[:alert] = "There was an error saving the topic. Please try again."
       render :new
     end
   end

  def edit
  end
end
