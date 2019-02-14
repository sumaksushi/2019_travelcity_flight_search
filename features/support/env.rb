require 'rspec'
require 'page-object'
require 'data_magic'
require_relative 'modules/utilities'


include Utilities

$url = 'www.travelocity.com'
$browser = :chrome

World(PageObject::PageFactory)


