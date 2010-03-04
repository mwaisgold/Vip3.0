require 'rexml/document'

module XMLObject::Adapters::REXML
  # Can take a String of XML data, or anything that responds to
  # either +read+ or +to_s+.
  def self.new(duck)
    case
      when duck.respond_to?(:read)
        then Element.new(::REXML::Document.new(duck.read).root)
      when duck.respond_to?(:to_s)
        then Element.new(::REXML::Document.new(duck.to_s).root)
      else raise "Don't know how to deal with '#{duck.class}' object"
    end
  end

  private ##################################################################

  class Element < XMLObject::Adapters::Base::Element # :nodoc:
    def initialize(xml)
      @raw, @name, @attributes = xml, xml.name, xml.attributes

      @element_nodes = xml.elements

      @text_nodes = xml.children.select do |child|
        child.class == ::REXML::Text
      end.map! { |child| child.to_s }

      @cdata_nodes = xml.children.select do |child|
        child.class == ::REXML::CData
      end.map! { |child| child.to_s }

      super
    end
  end
end

::XMLObject.adapter = ::XMLObject::Adapters::REXML