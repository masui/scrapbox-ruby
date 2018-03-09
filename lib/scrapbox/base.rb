module Scrapbox

  def self.__getsbdata(u)
    # uri = URI.parse("#{@host}/api#{api}")
    uri = URI.parse(u)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Get.new(uri.path)
    res = http.request(req)
    res.body.force_encoding("utf-8")
  end
  
end
