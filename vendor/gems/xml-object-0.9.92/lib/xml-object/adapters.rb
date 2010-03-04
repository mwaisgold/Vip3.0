module XMLObject # :nodoc:
  class << self # :nodoc:
    attr_accessor :adapter # :nodoc:
  end

  module Adapters # :nodoc:
    module Base # :nodoc:
      class Element # :nodoc:
        attr_accessor :raw, :name, :value, :attributes, :children # :nodoc:

        def initialize(*args)

          @children = @element_nodes.map { |node| self.class.new(node) }
          @value = (not (text_value !~ /\S/)) ? text_value : cdata_value
        end

        private ###########################################################

        def text_value
          @text_value_memo ||= @text_nodes.reject { |n| n !~ /\S/ }.join
        end

        def cdata_value
          @cdata_nodes.join
        end
      end
    end
  end
end