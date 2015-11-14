#\ -p 7399 -o 0.0.0.0

$:.push(File.dirname(__FILE__))

require 'app'

run JSONTemplateAPI::App

