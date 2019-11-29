class ItemsImagesController < ApplicationController
  before_action :set_items_image, only: [:show, :edit, :update, :destroy]

  # GET /items_images
  # GET /items_images.json
  def index
    @items_images = ItemsImage.all
  end

  # GET /items_images/1
  # GET /items_images/1.json
  def show
  end

  # GET /items_images/new
  def new
    @items_image = ItemsImage.new
  end

  # GET /items_images/1/edit
  def edit
  end

  # POST /items_images
  # POST /items_images.json
  def create
    @item = Item.find(params[:item_id])
    @item.item_image.attach(params[:item_image])
    redirect_to(item_path(@item))
  end

  # PATCH/PUT /items_images/1
  # PATCH/PUT /items_images/1.json
  def update
    respond_to do |format|
      if @items_image.update(items_image_params)
        format.html { redirect_to @items_image, notice: 'Items image was successfully updated.' }
        format.json { render :show, status: :ok, location: @items_image }
      else
        format.html { render :edit }
        format.json { render json: @items_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items_images/1
  # DELETE /items_images/1.json
  def destroy
    @items_image.destroy
    respond_to do |format|
      format.html { redirect_to items_images_url, notice: 'Items image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_image
      @items_image = ItemsImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def items_image_params
      params.fetch(:items_image, {})
    end
end
