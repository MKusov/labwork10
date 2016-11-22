require 'nokogiri'
require 'open-uri'
class NumberController < ApplicationController
  def input
  end

  def view
    @xml = Nokogiri::XML(open('http://0.0.0.0:3000/lab10/view.xml?n='+params[:n].to_s))
    if params[:server]
      template = Nokogiri::XSLT(File.read('template.xslt'))
      @res = template.transform(@xml)
    elsif params[:client]
      render xml: @xml
    end
  end
end

#transformed_document = template.transform(@xml)
# render _html: template.transform(@xml)
#@res.inner_html(template.transform(@xml))
# doc = Nokogiri::HTML(open('http://0.0.0.0:3001/number/view'))
# doc.css("div.div-table-col:first").inner_html('<p>test</p>')#(template.transform(@xml))
