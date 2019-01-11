class Comment::My::AttitudesController < Comment::My::BaseController
  before_action :set_attitude, only: [:show, :edit, :update, :destroy]

  def index
    @attitudes = Attitude.page(params[:page])
  end

  def new
    @attitude = Attitude.new
  end

  def like
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type],
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
    @attitude.opinion = 'liked'

    respond_to do |format|
      if @attitude.save
        format.js { @attitudinal = @attitude.attitudinal }
        format.json { render json: @attitude.as_json(root: true), status: :created }
      else
        format.js
        format.json { process_errors(@attitude) }
      end
    end
  end

  def dislike
    @attitude = Attitude.find_or_initialize_by(
      attitudinal_type: params[:attitudinal_type],
      attitudinal_id: params[:attitudinal_id],
      user_id: current_user.id
    )
    @attitude.opinion = 'disliked'

    respond_to do |format|
      if @attitude.save
        format.js
        format.json { render json: @attitude.as_json(root: true), status: :accepted }
      else
        format.js
        format.json { process_errors(@attitude) }
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @attitude.update(attitude_params)
      redirect_to my_attitudes_url, notice: 'Attitude was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @attitude.destroy
    redirect_to my_attitudes_url, notice: 'Attitude was successfully destroyed.'
  end

  private
  def set_attitude
    @attitude = Attitude.find(params[:id])
  end

end
