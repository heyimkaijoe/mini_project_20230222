class ShortUrlsController < ApplicationController

    before_action :authenticate_admin!, except: %i[ index redirect ]
    before_action :find_short_url, only: %i[ show edit update destroy ]

  def index
    @short_urls = ShortUrl.all
  end

  def new
    @short_url = ShortUrl.new
  end

  def create
    @short_url = ShortUrl.new(short_url_params)

    if @short_url.save
      redirect_to root_path, notice: 'Short URL was successfully created!'
    else
      render :new, alert: 'Please try again'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @short_url.update(short_url_params)
        redirect_to root_path, notice: 'Short URL was successfully updated!'
    else
      render :edit, alert: 'Please try again'
    end
  end

  def destroy
    @short_url.destroy if @short_url

    redirect_to root_path, notice: 'Short URL was successfully deleted!'
  end

  def redirect
    @short_url = ShortUrl.find_by(code: params[:code])

    if @short_url.present?
      @short_url.visit_histories.create(ip_address: request.remote_ip)
      @short_url.increment(:click_count)
      @short_url.save

      redirect_to short_url_path(@short_url)
    else
      redirect_to root_path, alert: 'Short URL not found'
    end
  end

  def check_visit_histories
    @short_url = ShortUrl.find(params[:short_url_id])
    @visit_histories = @short_url.visit_histories
  end

  private

  def short_url_params
    params.require(:short_url).permit(:full_url)
  end

  def find_short_url
    @short_url = ShortUrl.find(params[:id])
  end

  def authenticate_admin!
    current_user.admin?
  end

end
