class LineItemsController < ApplicationController
include CurrentCart
before_action :set_cart, only: [:create]
before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
  end

  def show
  end

  def new
    @line_item = LineItem.new
  end

  def edit
  end

def create
  product = Store.find(params[:store_id]) 
  @line_item = @cart.add_product( product)
  session[:amount]=@cart.total_price
  respond_to do |format| 
    if @line_item.save
      format.html { redirect_to @line_item.cart, notice: 'Successfully added to cart!!.' }
      format.json { render :show,
      status: :created, location: @line_item }
    else
      format.html { render :new }
      format.json { render json: @line_item.errors,
      status: :unprocessable_entity }
    end
  end
end

  # PATCH/PUT /line_items/1 or /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to line_item_url(@line_item), notice: "Line item was successfully updated." }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to line_items_url, notice: "Line item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def line_item_params
      params.require(:line_item).permit(:store_id)
    end
end
