# $:.unshift File.expand_path '.', File.dirname(__FILE__) # ???

require "test_helper"

class ScrapboxTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Scrapbox::VERSION
  end

  def test_project
    project = Scrapbox::Project.new("GitHelp")
    pages = project.pages
    assert pages.class == Array
    assert pages.length > 0
    page = Scrapbox::Page.new(project,"args")
    text = page.text
    assert text.class == String
    assert text.length > 0
    code = page.code("args.rb")
    assert code.class == String
    assert code.length > 0
  end
end

