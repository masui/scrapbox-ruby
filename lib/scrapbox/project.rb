module Scrapbox

  class Project
    attr_reader :name, :host
    
    def initialize(name,host='https://scrapbox.io')
      @name = name
      @host = host
      @titles = nil
      @pages = nil
    end

    def titles
      data = Scrapbox.__getsbdata("#{@host}/api/pages/#{@name}")
      unless @titles
        @titles = JSON.parse(data)['pages'].collect { |page|
          page['title']
        }
      end
      @titles
    end

    def pages
      unless @pages
        @pages = {}
        titles.each { |title|
          page = Scrapbox::Page.new(self,title)
          @pages[title] = page
        }
      end
      @pages
    end
  end
  
end
