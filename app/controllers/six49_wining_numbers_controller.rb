class Six49WiningNumbersController < ApplicationController
  before_action :set_six49WiningNumber, only: [:show, :edit, :update, :destroy]
  
  def index
    @six49WiningNumber = Six49WiningNumber.all
  end

  private

    def six49WiningNumber_params
      params.permit(:numar => [])
    end

    def set_six49WiningNumber
      @six49WiningNumber = Six49WiningNumber.find(params[:id])
    end

end
