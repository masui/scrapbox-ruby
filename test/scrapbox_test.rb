require "test_helper"

class ScrapboxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Scrapbox::VERSION
  end

  def test_project
    project = Scrapbox::Project.new("GitHelp")
    titles = project.titles
    assert titles.class == Array
    assert titles.length > 0
    assert titles[0].class == String
    
    pages = project.pages
    assert pages.class == Hash
    
    page = project.pages['args']
    text = page.text
    assert text.class == String
    assert text.length > 0
    
    page = Scrapbox::Page.new(project,"args")
    text = page.text
    assert text.class == String
    assert text.length > 0
    code = page.code("args.rb")
    assert code.class == String
    assert code.length > 0
  end
end

