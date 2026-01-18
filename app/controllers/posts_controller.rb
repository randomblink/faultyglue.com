# /Volumes/Storage/Projects/faultyglue.com/app/controllers/posts_controller.rb
# frozen_string_literal: true

class PostsController < ApplicationController
  # Public can read the blog:
  allow_unauthenticated_access only: %i[index show]

  before_action :set_post, only: %i[show edit update destroy]

  def index
    # Home page requirement: earliest posts at the top
    @posts = Post.order(created_at: :asc)
  end

  def show
  end

  def new
    @post = Post.new(status: "draft")
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    # Auto-set published_at when publishing (optional convenience)
    @post.published_at ||= Time.current if @post.status == "published"

    if @post.save
      redirect_to post_path(@post), notice: "Post created."
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post.assign_attributes(post_params)

    # Auto-set published_at when publishing (optional convenience)
    @post.published_at ||= Time.current if @post.status == "published"

    if @post.save
      redirect_to post_path(@post), notice: "Post updated."
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Post deleted.", status: :see_other
  end

  private

  def set_post
    @post = Post.find_by!(slug: params[:slug])
  end

  def post_params
    params.require(:post).permit(
      :title,
      :slug,
      :status,
      :excerpt,
      :published_at,
      :body
    )
  end
end
