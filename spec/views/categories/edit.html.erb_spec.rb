require 'spec_helper'

describe "/categories/edit.html.erb" do
  include CategoriesHelper

  before(:each) do
    assigns[:category] = @category = stub_model(Category,
      :new_record? => false,
      :name => "value for name",
      :Category => ,
      :accept_items => false
    )
  end

  it "renders the edit category form" do
    render

    response.should have_tag("form[action=#{category_path(@category)}][method=post]") do
      with_tag('input#category_name[name=?]', "category[name]")
      with_tag('input#category_Category[name=?]', "category[Category]")
      with_tag('input#category_accept_items[name=?]', "category[accept_items]")
    end
  end
end
