require 'nokogiri'
require 'prime'
class Lab10Controller < ApplicationController
  def input
  end

  def view
    n=params[:n].to_i
    @arr=(1..Float::INFINITY).lazy.map{|x| 2**x - 1}.take_while{|x| x < n}.select{|x| Prime.prime?(x)}.to_a
    respond_to do |format|
      format.xml {render xml:@arr}
      format.rss { render xml: @arr}
      format.any
    end
  end
end



#  format.xml do
#       @arr.each_with_index do |x,ind|
#        render xml: {id:ind,number:x}
#      end
#end

=begin     builder = Nokogiri::XML::Builder.new do |xml|
      xml.root {
        xml.products {
          xml.widget {
            xml.id_ "10"
            xml.name "Awesome widget"
          }
        }
      }
=end

=begin    @builder = Nokogiri::XML::Builder.new do |xml|
      xml.root {
        @arr.each_with_index {|x,ind|
          xml.number {
            xml.id (ind+1).to_s
            xml.name x.to_s
        }
        }
      }
    end
    @file.puts(string)
    @file.write(@builder.to_xml)
    @file.close
=end
