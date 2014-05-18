require 'active_support/core_ext/string'

module SignedParameters
  class Builder
    def initialize(parameters, secret, separator = ';')
      @parameters = parameters
      @secret = secret
      @separator = separator
    end

    def sign
      md5
    end

    def parameters_with_sign
      used_parameters.merge :sign => sign
    end

    def to_query
      parameters_with_sign.to_query
    end

    private

    def used_parameters
      @parameters.select { |k, v| v.present? }
    end

    def sorted_parameters_values
      used_parameters.values.map(&:to_s).sort
    end

    def string_for_sign
      (sorted_parameters_values + [@secret]).join @separator
    end

    def sha1
      Digest::SHA1.hexdigest string_for_sign
    end

    def md5
      Digest::MD5.hexdigest sha1
    end
  end
end
