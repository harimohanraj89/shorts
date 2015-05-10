class ShortsController < ApplicationController
  def home
    @short = Short.new
  end

  def create
    @short = Short.find_or_create_by(short_params)
    if @short.persisted?
      @disp = [
        request.protocol,
        request.host,
        ':',
        request.port,
        '/s/',
        @short.short
      ].join
    else
      @disp = 'Try Again'
    end
  end

  def redirect
    short = Short.find_by(short: params[:short])
    if short
      redirect_to short.url
    else
      render text: 'Nope'
    end
  end

  private
  def short_params
    params.require(:short).permit(:url)
  end
end
