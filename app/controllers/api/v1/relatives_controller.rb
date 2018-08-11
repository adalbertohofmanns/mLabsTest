class Api::V1::RelativesController < Api::V1::ApiController

  before_action :set_relative, only: [:show, :update, :destroy]
  before_action :require_authorization!, only: [:show, :update, :destroy]

  # GET /api/v1/relatives
  def index
    @relatives = current_user.relatives
    render json: @relatives
  end

  # GET /api/v1/relatives/1
  def show
    render json: @relative
  end

  # POST /api/v1/relatives
  def create
    @relative = Relative.new(relative_params.merge(user: current_user))
    if @relative.save
      render json: @relative, status: :created
    else
      render json: @relative.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/relatives/1
  def update
    if @relative.update(relative_params)
      render json: @relative
    else
      render json: @relative.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/relatives/1
  def destroy
    @relative.destroy
  end

  private

  def set_relative
    @relative = Relative.find(params[:id])
  end

  # Params Permitted.
  def relative_params
    params.require(:relative).permit(:name, :kinship)
  end
  def require_authorization!
    unless current_user == @relative.user
      render json: {}, status: :forbidden
    end
  end
end
