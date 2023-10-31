class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'uri'

    websites = [
      { name: '메인', url: 'https://uos.ac.kr' },
      { name: '와이즈', url: 'https://wise.uos.ac.kr' },
      { name: '대학보건소', url: 'https://health.uos.ac.kr' },
      { name: '포탈', url: 'https://portal.uos.ac.kr' },
      { name: '장학금', url: 'https://scholarship.uos.ac.kr' },
      { name: '현장실습', url: 'https://field.uos.ac.kr' },
      { name: 'UOS Story', url: 'https://uostory.uos.ac.kr' },
      { name: '기숙사', url: 'https://dormitory.uos.ac.kr' },
      { name: '도서관', url: 'https://library.uos.ac.kr' },
      { name: '체육관', url: 'https://physical.uos.ac.kr' },
      { name: 'JBS', url: 'https://jbs.uos.ac.kr' },
      { name: '발전기금', url: 'https://fund.uos.ac.kr'},
      # { name: 'HRC', url: 'https://hrc.uos.ac.kr' },
      # { name: 'USI', url: 'https://usi.uos.ac.kr' },
      # { name: 'CIS', url: 'https://cis.uos.ac.kr' },
      # { name: 'OIA', url: 'https://oia.uos.ac.kr' },
      # { name: 'ICE', url: 'https://ice.uos.ac.kr' },
      # { name: 'Press', url: 'https://press.uos.ac.kr' },
      # { name: 'Times', url: 'https://times.uos.ac.kr' },
      # { name: 'CRF', url: 'https://crf.uos.ac.kr' },
      # { name: '100th', url: 'https://100th.uos.ac.kr' },
      # { name: 'Abeek', url: 'https://abeek.uos.ac.kr' },
    # 기타 웹사이트 추가

    # 행복인문학 최고위과정
    # @aph_code = check_status('https://aph.uos.ac.kr')

    # # 창업지원단 ( using http !! )
    # @startup_code = check_status('http://startup.uos.ac.kr')

    # # 교수학습 개발센터 ( using http !! )
    # @ctl_code = check_status('https://ctl.uos.ac.kr')
    ]

    @website_statuses = {}

    websites.each do |website|
      uri = URI.parse(website[:url])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      response = http.request(Net::HTTP::Get.new(uri.request_uri))
      @website_statuses[website[:name]] = response.code
    end
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
