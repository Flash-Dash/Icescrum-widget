require 'net/http'
require "rexml/document"
require 'nokogiri'
include REXML


SCHEDULER.every '10m', :first_in => 0 do |job|

%x{curl -v -H "Content-Type: application/xml" -X POST --data "@filename.xml" -u username:password http://url.ca:8080/icescrum/ --output result.xml}

vel =
cap =

f = File.open("result.xml")
doc = Nokogiri::XML(f)

puts "== Capacity"
expression = "sprint/capacity"
nodes = doc.xpath(expression)
cap = nodes.text.to_f

nodes.each do |node|
  p node.text
end

f = File.open("result.xml")
doc = Nokogiri::XML(f)

puts "== Velocity"
expression = "sprint/velocity"
nodes = doc.xpath(expression)
vel = nodes.text.to_f

nodes.each do |node|
  p node.text
 
end

f = File.open("result.xml")
doc = Nokogiri::XML(f)

puts "== Activation Date"
expression = "sprint/activationDate"
nodes = doc.xpath(expression)

nodes.each do |node|
  p node.text
end

f = File.open("result.xml")
doc = Nokogiri::XML(f)

puts "== Close Date"
expression = "sprint/closeDate"
nodes = doc.xpath(expression)

nodes.each do |node|
  p node.text
end

  if vel == 0
    issuesinProgress = 0
    moreinfo = "No sprint currently in progress"
  else
    issuesinProgress = (vel/cap *100).to_i
    moreinfo = "#{vel.to_i} / #{cap.to_i}"
  end

send_event('ice_scrum', value: issuesinProgress, moreinfo: moreinfo )

end
