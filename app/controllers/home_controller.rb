class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'uri'

    @uos_code = check_status('https://uos.ac.kr')
    @wise_code = check_status('https://wise.uos.ac.kr')
    @health_code = check_status('https://health.uos.ac.kr')
  end

  private def check_status(url)
    require 'net/http'
    require 'uri'

    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    return response.code
  end

end
