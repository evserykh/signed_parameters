require 'signed_parameters/version'
require 'signed_parameters/builder'

module SignedParameters
  def self.to_query(parameters, secret)
    Builder.new(parameters, secret).to_query
  end
end
