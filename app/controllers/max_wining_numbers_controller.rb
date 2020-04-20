class MaxWiningNumbersController < ApplicationController
  before_action :set_maxWiningNumber, only: [:show, :edit, :update, :destroy]
  
  def index
    @maxWiningNumber = MaxWiningNumber.all
  end

  def new
    @maxWiningNumber = MaxWiningNumber.new
  end

  def edit
    @maxWiningNumber = MaxWiningNumber.find(params[:id])
  end

  def create
    @maxWiningNumber = MaxWiningNumber.new(maxWiningNumber_params)
    @maxWiningNumber.save

    if @maxWiningNumber.save
      redirect_to max_wining_numbers_path, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show
  end

private

  def maxWiningNumber_params
    params.permit(:numar => [])
  end

  def set_user
    @maxWiningNumber = MaxWiningNumber.find(params[:id])
  end
end
