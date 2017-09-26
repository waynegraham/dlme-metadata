require 'net/http'
require 'uri'
require 'ostruct'
require 'json'

class Connection
  # @see http://danknox.github.io/2013/01/27/using-rubys-native-nethttp-library/
  ENDPOINT = 'https://api.sketchfab.com'.freeze

  VERB_MAP = {
    get:    Net::HTTP::Get,
    post:   Net::HTTP::Post,
    put:    Net::HTTP::Put,
    delete: Net::HTTP::Delete
  }.freeze

  def initialize(endpoint = ENDPOINT)
    uri = URI.parse(endpoint)
    @http = Net::HTTP.new(uri.host, uri.port)
    @http.use_ssl = true
  end

  def get(path, params = {})
    request_json :get, path, params
  end

  def post(path, params = {})
    request_json :post, path, params
  end

  def put(path, params = {})
    request_json :put, path, params
  end

  def delete(path, params = {})
    request_json :delete, path, params
  end

  private

  def request_json(method, path, params)
    response = request(method, path, params)
    body = JSON.parse(response.body)

    OpenStruct.new(code: response.code, body: body)
  rescue JSON::ParserError
    response
  end

  def request(method, path, params = {})
    case method
    when :get
      full_path = encode_path_params(path, params)
      request = VERB_MAP[method.to_sym].new(full_path)
    else
      request = VERB_MAP[method.to_sym].new(path)
      request.set_form_data(params)
    end

    @http.request(request)
  end

  def encode_path_params(path, params)
    encoded = URI.encode_www_form(params)
    [path, encoded].join('?')
  end
end
