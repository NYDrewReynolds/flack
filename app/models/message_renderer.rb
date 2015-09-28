require 'render_anywhere'

class MessageRenderer
  include RenderAnywhere
  
  attr_reader :message
  
  def initialize(message)
    @message = message
  end
  
  def render_partial
    render :partial => "shared/message", :format => "html", :locals => {message: message}
  end
end
