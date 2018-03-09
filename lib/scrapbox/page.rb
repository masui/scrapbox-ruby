module Scrapbox

  class Page
    attr_reader :title, :project
    
    def initialize(project,title)
      @project = project
      @title = title
    end

    def text
      text = Scrapbox.__getsbdata("#{project.host}/api/pages/#{project.name}/#{URI.encode(title).gsub(/\//,'%2f')}/text")
    end

    def code(src)
      Scrapbox.__getsbdata("#{project.host}/api/code/#{project.name}/#{URI.encode(title)}/#{src}")
    end

  end

end
