class CommentsController < ApplicationController

  respond_to :html, :json

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # # GET /comments
  # # GET /comments.json
  # def index
  #   @comments = Comment.all
  # end

  # GET /posts/:post_id/comments
  # GET /posts/:post_id/comments.xml
  def index
    require 'pry'
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you get all the comments of this post
    @comments = post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # # GET /comments/1
  # # GET /comments/1.json
  # def show
  # end

  # GET /posts/:post_id/comments/:id
  # GET /comments/:id.xml
  def show    
    #1st you retrieve the post thanks to params[:post_id]
    @post = Post.find(params[:post_id])
    #render plain: params[:post_id].inspect
    #2nd you retrieve the comment thanks to params[:id]
    @comment = @post.comments.find(params[:id])
    #render plain: @comment.inspect
    #binding.pry
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # # GET /comments/new
  # def new
  #   @comment = Comment.new
  # end

  # GET /posts/:post_id/comments/new
  # GET /posts/:post_id/comments/new.xml
  def new
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you build a new one
    @comment = post.comments.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # # GET /comments/1/edit
  # def edit
  # end

  # GET /posts/:post_id/comments/:id/edit
  def edit
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])
  end


  # # POST /comments
  # # POST /comments.json
  # def create
  #   @comment = Comment.new(comment_params)
  #
  #   respond_to do |format|
  #     if @comment.save
  #       format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
  #       format.json { render :show, status: :created, location: @comment }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # POST /posts/:post_id/comments
  # POST /posts/:post_id/comments.xml
  def create
    #render plain: params[:post_id].inspect    
    #1st you retrieve the post thanks to params[:post_id]
    @post = Post.find(params[:post_id])
    #render plain: @post.inspect
    #2nd you create the comment with arguments in params[:comment]
    #render plain: params[:comment].inspect
    #render plain: params[:comment].methods.sort - Object.methods
    #render plain: post.comments.create(params[:comment])
    #@comment = @post.comments.create(params[:comment])
    @comment = @post.comments.create(comment_params)
    #render plain: @comment.inspect

    respond_to do |format|
      if @comment.save
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully created.') }
        #the key :location is associated to an array in order to build the correct route to the nested resource comment
        format.xml  { render :xml => @comment, :status => :created, :location => [@comment.post, @comment] }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # # PATCH/PUT /comments/1
  # # PATCH/PUT /comments/1.json
  # def update
  #   respond_to do |format|
  #     if @comment.update(comment_params)
  #       format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @comment }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @comment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PUT /posts/:post_id/comments/:id
  # PUT /posts/:post_id/comments/:id.xml
  def update
    #1st you retrieve the post thanks to params[:post_id]
    post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        #1st argument of redirect_to is an array, in order to build the correct route to the nested resource comment
        format.html { redirect_to([@comment.post, @comment], :notice => 'Comment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # # DELETE /comments/1
  # # DELETE /comments/1.json
  # def destroy
  #   @comment.destroy
  #   respond_to do |format|
  #     format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  
  # DELETE /posts/:post_id/comments/1
  # DELETE /posts/:post_id/comments/1.xml
  def destroy   
    
    #1st you retrieve the post thanks to params[:post_id]
    #render plain: params[:post_id].inspect
    @post = Post.find(params[:post_id])
    #2nd you retrieve the comment thanks to params[:id]
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    #binding.pry
    respond_to do |format|
      #1st argument reference the path /posts/:post_id/comments/
      format.html { redirect_to(post_comments_url) }
      format.xml  { head :ok }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commenter, :body, :post_id)
    end
end
