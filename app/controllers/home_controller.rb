class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'uri'

    websites = [
      { name: '메인', url: 'https://uos.ac.kr', description: '메인 페이지입니다.' },
      { name: '와이즈', url: 'https://wise.uos.ac.kr', description: '행정 정보를 처리하는 페이지입니다.' },
      { name: '포탈', url: 'https://portal.uos.ac.kr', description: '로그인이 필요한 메인 페이지입니다.' },
      { name: 'UOS Story', url: 'https://uostory.uos.ac.kr', description: '다양한 유틸리티를 제공합니다.' },
      { name: '도서관', url: 'https://library.uos.ac.kr', description: '도서관 홈페이지입니다.' },
      { name: 'JBS', url: 'https://jbs.uos.ac.kr', description: '신문을 제작하는 학생자치의 홈페이지입니다.' },
      { name: '대학보건소', url: 'https://health.uos.ac.kr', description: '보건소 페이지입니다.' },
      { name: '장학금', url: 'https://scholarship.uos.ac.kr', description: '장학금 페이지입니다.' },
      { name: '기숙사', url: 'https://dormitory.uos.ac.kr', description: '기숙사 페이지입니다.' },
      { name: '체육관', url: 'https://physical.uos.ac.kr', description: '체육 시설 예약 등을 제공하는 페이지입니다.'},
      { name: '발전기금', url: 'https://fund.uos.ac.kr', description: '발전기금 후원 페이지입니다.'},
      { name: 'Times', url: 'https://times.uos.ac.kr', description: '영문으로 만든 신문을 제공하는 페이지입니다.' },
      # { name: '현장실습', url: 'https://field.uos.ac.kr', description: '현장실습 페이지입니다.' },
      # { name: 'Press', url: 'https://press.uos.ac.kr', description: '서울시립대학교 신문 홈페이지입니다.' },

      # { name: 'HRC', url: 'https://hrc.uos.ac.kr' },
      # { name: 'USI', url: 'https://usi.uos.ac.kr' },
      # { name: 'CIS', url: 'https://cis.uos.ac.kr' },
      # { name: 'OIA', url: 'https://oia.uos.ac.kr' },
      # { name: 'ICE', url: 'https://ice.uos.ac.kr' },
      # { name: 'CRF', url: 'https://crf.uos.ac.kr' },
      # { name: '100th', url: 'https://100th.uos.ac.kr' },
      # { name: 'Abeek', url: 'https://abeek.uos.ac.kr' },
      # { name: '행복인문학', url: 'https://aph.uos.ac.kr'},
      # http
      # { name: '교수학습', url: 'http://ctl.uos.ac.kr'},
      # { name: '창업지원단', url: 'http://startup.uos.ac.kr'},

    ]

    @website_statuses = {}
    websites.each do |website|
      uri = URI.parse(website[:url])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = (uri.scheme == 'https')
      response = http.request(Net::HTTP::Get.new(uri.request_uri))
      @website_statuses[website[:name]] = [response.code, website[:url], website[:description]]
    end
  end
end
