# coding: utf-8

class ScrapboxGyazz < MiniTest::Test

  def test_version
    assert Scrapbox::VERSION >= "0.0.1"
  end

  #def test_wiki_methods
  #  assert Gyazz.wiki('test').class, Gyazz::Wiki
  #end

end

#require 'net/https'
#require 'json'
#
#$:.unshift File.expand_path '.', File.dirname(__FILE__)
#
#require './scrapbox/project'
#require './scrapbox/version'
#
#module Scrapbox
#  if $0 == __FILE__
#    project = Project.new("GitHelp")
#    p project.pages
#    page = Page.new(project,"args")
#    puts page.text
#    puts page.code("args.rb")
#  end
#end
