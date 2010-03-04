class XMLObject::CollectionProxy # :nodoc:
  instance_methods.each do |m|
    meth_str, meth_sym = m.to_s, m.to_sym # Ruby 1.8 and 1.9 differ, so...

    undef_method meth_sym unless meth_str =~ /^__/        ||
                                 meth_str =~ /^instance_/ ||
                                 meth_sym == :is_a?       ||
                                 meth_sym == :extend      ||
                                 meth_sym == :nil?        ||
                                 meth_sym == :object_id
  end

  def initialize(xml) # :nodoc:
    @__children, @__attributes = {}, {}
    @__target_kid = xml.children[0].name.to_sym
  end

  private ##################################################################

  def method_missing(m, *a, &b) # :nodoc:
    dispatched = __question_dispatch(m, *a, &b)
    dispatched = __dot_notation_dispatch(m, *a, &b) if dispatched.nil?

    if dispatched.nil? && @__children[@__target_kid].respond_to?(m)
      dispatched = @__children[@__target_kid].__send__(m, *a, &b)

      unless nil == dispatched
        # All is fair in Love and War. And 100% coverage.
        instance_eval \
          %{ def #{m}(*a, &b); @__children[@__target_kid].#{m}(*a, &b); end }
      end
    end

    (nil == dispatched) ? raise(NameError.new(m.to_s)) : dispatched
  end
end