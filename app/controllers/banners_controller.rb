class BannersController < ApplicationController
  include ApplicationHelper

  before_filter :cors_set_access_control_headers
  after_filter :cors_set_access_control_headers

  def incr_showing
    banner = Banner.find_by(id: params[:id])

    if banner
      banner.increment!(:showed)
      banner.reload

      if banner.max_showing > banner.showed
        response = { success: true, show: 'yes' }
      else
        response = { success: true, show: 'no' }
      end
    else
      response = { success: false, errors: 'no banner' }
    end

    render json: response.to_json
  end

  def incr_clicks
    banner = Banner.find_by(id: params[:id])
    banner.increment!(:clicks) if banner

    render nothing: true
  end
end