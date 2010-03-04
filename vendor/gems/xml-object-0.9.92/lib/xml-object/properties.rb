module XMLObject::Properties
  # Array-bracket (+[]+) notation access to elements and attributes. Use
  # when the element or attribute you need to reach is not reachable via dot
  # notation (because it's not a valid method name, or because the method
  # exists, such as +id+ or +class+).
  #
  # It also supports a hash key, which is used to reach attributes named
  # the same as elements in the same depth level (which otherwise go first)
  #
  # All of this is a lot easier to explain by example:
  #
  #   <article id="main_article" author="j-random">
  #     <author>J. Random Hacker</author>
  #   </article>
  #
  #   article.id                 => 9314390            # Object#id
  #   article[:id]               => "main_article"     # id attribute
  #   article[:author]           => "J. Random Hacker" # <author> element
  #   article[:attr => 'author'] => "j-random"         # author attribute
  #
  # Valid keys for the hash notation are +:attr+ and +:elem+.
  def [](duck)
    if @__target_kid && duck.is_a?(Numeric)
      @__children[@__target_kid][duck]
    elsif duck.is_a?(Hash)
      raise NameError.new('only one key allowed') if duck.keys.size != 1
      key, name = duck.keys[0].to_sym, duck.values[0].to_sym

      unless ( (key == :elem) || (:attr == key) )
        raise NameError.new("Invalid key :#{key.to_s}. Use :elem or :attr")
      end

      value = (key == :elem) ? @__children[name] : @__attributes[name]
      value.nil? ? raise(NameError.new(name.to_s)) : value
    else
      key = duck.to_s.to_sym

      case
        when (not @__children[key].nil?)   then @__children[key]
        when (not @__attributes[key].nil?) then @__attributes[key]
        else raise NameError.new(key.to_s)
      end
    end
  end

  private ##################################################################

  def __question_dispatch(meth, *args, &block)
    return nil unless meth.to_s.match(/\?$/) && args.empty? && block.nil?

    method_sans_question = meth.to_s.chomp('?').to_sym

    if boolish = __send__(method_sans_question)
      bool = case
        when %w[ true yes t y ].include?(boolish.downcase) then true
        when %w[ false no f n ].include?(boolish.downcase) then false
        else nil
      end

      unless bool.nil?
        instance_eval %{ def #{meth}; #{bool ? 'true' : 'false'}; end }
      end

      bool
    end
  end

  def __dot_notation_dispatch(meth, *args, &block)
    return nil unless args.empty? && block.nil?

    if @__children.has_key?(meth)
      instance_eval %{ def #{meth}; @__children[%s|#{meth}|]; end }
      @__children[meth]

    elsif @__attributes.has_key?(meth)
      instance_eval %{ def #{meth}; @__attributes[%s|#{meth}|]; end }
      @__attributes[meth]

    elsif @__children.has_key?(naive_sing = meth.to_s.chomp('s').to_sym) &&
          @__children[naive_sing].is_a?(Array)

      instance_eval %{ def #{meth}; @__children[%s|#{naive_sing}|]; end }
      @__children[naive_sing]

    elsif defined?(ActiveSupport::Inflector)                            &&
          @__children.has_key?(singular = meth.to_s.singularize.to_sym) &&
          @__children[singular].is_a?(Array)

      instance_eval %{ def #{meth}; @__children[%s|#{singular}|]; end }
      @__children[singular]
    else
      nil
    end
  end
end