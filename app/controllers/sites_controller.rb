class SitesController < ApplicationController
  include ApplicationHelper
  protect_from_forgery :except => :banners

  before_filter :cors_set_access_control_headers
  after_filter :cors_set_access_control_headers

  def banners
    @domain = request.domain
    p @domain
    @site = Site.find params[:site_id]

    cors_set_access_control_headers
    respond_to do |format|
      format.js {
        render :template => "sites/banners.js.erb",
               :layout => false
      }
    end
  end

end