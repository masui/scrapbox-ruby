module Scrapbox

  class Project
    attr_reader :name, :host
    
    def initialize(name,host='https://scrapbox.io')
      @name = name
      @host = host
    end

    def pages
      data = Scrapbox.__getsbdata("#{@host}/api/pages/#{@name}")
      JSON.parse(data)['pages'].collect { |page|
        page['title']
      }
    end
  end

end
