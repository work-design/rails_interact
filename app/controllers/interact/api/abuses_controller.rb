class Interact::Api::AbusesController < Interact::Api::BaseController
  before_action :set_abuse, only: [:show, :update, :destroy]

  def index
    @abuses = Abuse.page(params[:page])

    render json: @abuses
  end

  def show
    render json: @abuse
  end

  def create
    @abuse = Abuse.new(abuse_params)

    if @abuse.save
      render json: @abuse, status: :created
    else
      render json: @abuse.errors, status: :unprocessable_entity
    end
  end

  def update
    if @abuse.update(abuse_params)
      render json: @abuse
    else
      render json: @abuse.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @abuse.destroy
  end

  private
  def abuse_params
    params.permit(
      :abusement_type,
      :abusement_id,
      :content
    )
  end
end
