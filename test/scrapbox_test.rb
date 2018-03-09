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
    assert pages.values[0].class == Scrapbox::Page
  end

  def test_page
    project = Scrapbox::Project.new("GitHelp")
    
    page = project.pages['args']
    text = page.text
    assert text.class == String
    assert text.length > 0
    
    page = Scrapbox::Page.new("GitHelp","args")
    text = page.text
    assert text.class == String
    assert text.length > 0

    page = Scrapbox::Page.new(project,"args")
    text = page.text
    assert text.class == String
    assert text.length > 0
  end

  def test_code
    project = Scrapbox::Project.new("GitHelp")
    page = project.pages['args']
    code = page.code("args.rb")
    assert code.class == String
    assert code.length > 0
    
    code = Scrapbox::Page.new("GitHelp","args").code("args.rb")
    assert code.class == String
    assert code.length > 0
  end
end
