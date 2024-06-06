class ListitemsController < ApplicationController
  before_action :set_listitem, only: [:show, :update, :destroy]

  # GET /listitems
  def index
    @listitems = Listitem.all

    render json: @listitems
  end

  # GET /listitems/1
  def show
    render json: @listitem
  end

  # POST /listitems
  def create
   p "in the create method"
    p params
    @listitem = Listitem.new(listitem_params)

    if @listitem.save
      render json: @listitem, status: :created, location: @listitem
    else
      render json: @listitem.errors, status: :unprocessable_entity
    end
  end

   # POST /listitems
   def keap_hook
    p "in the create method"
    p params
    p"after"
    p parameters
    p parameters.item
     @listitem = Listitem.new()
     @listitem.item = parameters.item
 
     if @listitem.save
       render json: @listitem, status: :created, location: @listitem
     else
       render json: @listitem.errors, status: :unprocessable_entity
     end
   end

  # PATCH/PUT /listitems/1
  def update
    if @listitem.update(listitem_params)
      render json: @listitem
    else
      render json: @listitem.errors, status: :unprocessable_entity
    end
  end

  # DELETE /listitems/1
  def destroy
    @listitem.destroy
  end

  def validate
    item = Listitem.find_by(item: params[:item])
    if item 
      render json: item
    else
      render json: {:error => "not valid"}.to_json, :status => 404
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listitem
      @listitem = Listitem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listitem_params
      params.require(:listitem).permit(:item, :snumber, :name)
    end


end
