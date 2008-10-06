# TrivialTokens
module KnaveOfDiamonds
  # To be mixed into ApplicationController
  #
  # If a <tt>token</tt> url parameter is supplied and exists, it will be
  # available in <tt>provided_token</tt>.
  module TrivialTokens
    def self.included(base)
      base.before_filter :identify_by_token
      base.send :attr_accessor, :provided_token
    end

    private
    
    def identify_by_token
      @provided_token = Token.find_by_value(params[:token]) if params[:token]
    end
  end
end
