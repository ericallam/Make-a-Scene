class Admin::PhotosController < Admin::ResourcesController

  def create
    @item = Photo.new(params[:photo])

    if @item.save
      redirect_to :controller => 'admin/photos', :action => :edit, :id => @item
    else
      render :template => 'admin/resources/new'
    end
  end
end
