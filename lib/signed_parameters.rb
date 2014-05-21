require 'signed_parameters/version'
require 'signed_parameters/builder'

module SignedParameters
  def self.sign(parameters, secret)
    Builder.new(parameters, secret).sign
  end

  def self.parameters_with_sign(parameters, secret)
    Builder.new(parameters, secret).parameters_with_sign
  end

  def self.to_query(parameters, secret)
    Builder.new(parameters, secret).to_query
  end
end
