module Scrapbox

  class Page
    attr_reader :title, :project
    
    def initialize(project,title)
      if project.class == String
        @project = Project.new(project)
      else
        @project = project
      end
      @title = title
      @text = nil
      @code = nil
    end

    def text
      unless @text
        @text = Scrapbox.__getsbdata("#{project.host}/api/pages/#{project.name}/#{URI.encode(title).gsub(/\//,'%2f')}/text")
      end
      @text
    end

    def code(src)
      unless @code
        @code = Scrapbox.__getsbdata("#{project.host}/api/code/#{project.name}/#{URI.encode(title)}/#{src}")
      end
      @code
    end

  end

end
