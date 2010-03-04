require 'xml-object/version'
require 'xml-object/adapters'
require 'xml-object/adapters/rexml'
require 'xml-object/properties'
require 'xml-object/collection_proxy'
require 'xml-object/element'

module XMLObject
  # Returns a String or Array object representing the given XML, decorated
  # with methods to access attributes and/or child elements.
  def self.new(duck) # :nodoc:
    case duck
      when @adapter::Element then new_decorated_obj duck
      when Array             then duck.map! { |d| new_decorated_obj d }
      else new @adapter.new(duck)
    end
  end

  private ##################################################################

  # Takes any adapter Element object, and converts it recursively into
  # the corresponding tree of decorated objects.
  def self.new_decorated_obj(xml) # :nodoc:
    # More than one child, empty value, and all children with the same name?
    obj = if xml.children.size > 1 && xml.value !~ /\S/ &&
             xml.children.map { |c| c.name }.uniq.size == 1

      CollectionProxy.new xml # This is an empty array wrap
    else
      Element.new xml # This one is an actual element
    end

    xml.children.each   { |child| add_child obj, child.name, new(child) }
    xml.attributes.each { |name, value|  add_attribute obj, name, value }

    # Let's teach our object how to access its XML elements and attributes
    obj.extend Properties
  end

  # Decorates the given object 'obj' with a method 'name' that returns the
  # given 'element'. If 'name' is already taken, takes care of the array
  # folding behaviour.
  def self.add_child(obj, name, element) # :nodoc:
    key      = name.to_sym
    children = obj.instance_variable_get :@__children

    children[key] = if children[key]

      children[key] = [ children[key] ] unless children[key].is_a? Array
      children[key] << element
    else
      element
    end

    obj.instance_variable_set :@__children, children
    element
  end

  # Decorates the given object 'obj' with a method 'name' that returns the
  # given 'attr_value'.
  def self.add_attribute(obj, name, value) # :nodoc:
    attributes = obj.instance_variable_get :@__attributes
    attributes[key = name.to_sym] = value.strip.gsub /\s+/, ' '

    obj.instance_variable_set :@__attributes, attributes
    value
  end
end