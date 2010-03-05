require 'spec_helper'

describe "/categories/new.html.erb" do
  include CategoriesHelper

  before(:each) do
    assigns[:category] = stub_model(Category,
      :new_record? => true,
      :name => "value for name",
      :Category => ,
      :accept_items => false
    )
  end

  it "renders new category form" do
    render

    response.should have_tag("form[action=?][method=post]", categories_path) do
      with_tag("input#category_name[name=?]", "category[name]")
      with_tag("input#category_Category[name=?]", "category[Category]")
      with_tag("input#category_accept_items[name=?]", "category[accept_items]")
    end
  end
end
