class Admin::AbusesController < Admin::BaseController
  before_action :set_abuse, only: [:show, :edit, :update, :destroy]

  def index
    @abuses = Abuse.page(params[:page])
  end

  def new
    @abuse = Abuse.new
  end

  def create
    @abuse = Abuse.new(abuse_params)

    if @abuse.save
      redirect_to admin_abuses_url, notice: 'Abuse was successfully created.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @abuse.update(abuse_params)
      redirect_to admin_abuses_url, notice: 'Abuse was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @abuse.destroy
    redirect_to admin_abuses_url, notice: 'Abuse was successfully destroyed.'
  end

  private
  def set_abuse
    @abuse = Abuse.find(params[:id])
  end

  def abuse_params
    params.fetch(:abuse, {}).permit(
      :abusement,
      :state,
      :note,
      :user,
    )
  end

end