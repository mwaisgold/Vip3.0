# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :set_locale
  before_filter :take_stamp
  after_filter  :set_charset
  def take_stamp
    @stamp = Time.new
  end

  def set_locale
    I18n.locale = params[:locale]
  end

  def cache(key)
    unless output = Rails.cache.read(key)
      output = yield
      Rails.cache.write(key, output)
    end
    return output
  end

  def set_charset
    content_type = headers["Content-Type"] || 'text/html'
    if /^text\//.match(content_type)
      headers["Content-Type"] = "#{content_type}; charset=ISO-8859-1"
    end
  end

end
