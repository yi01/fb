class TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topic = Topic.new
    @topics = Topic.order("created_at DESC")
  end

  def new
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      redirect_to action: :index, notice: "ブログを作成しました！"
      NoticeMailer.sendmail_topic(@topic).deliver
    else
      redirect_to action: :index
    end
  end

  def show

  end

  def edit
    #code
  end

  def update
    if @topic.update(topics_params)
    redirect_to topics_path
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path
  end

private
  def topics_params
    params.require(:topic).permit(:content)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
