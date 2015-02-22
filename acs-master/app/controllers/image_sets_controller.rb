class ImageSetsController < ApplicationController
  def create
  end

  def delete
  end

  def classify
    @images = GameImage.all
  end

  def import
  end

  def import_post
    images = []
    params[:image_data].each do |uploaded_image|
      images << GameImage.create(:image_data => uploaded_image)
    end

    flash[:notice] = "Created game images: #{images.map { |i| i.image_data.url }.join(", ")}"
    redirect_to :action => :import
  end
end
