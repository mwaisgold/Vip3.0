require 'spec_helper'

describe "/califications/edit.html.erb" do
  include CalificationsHelper

  before(:each) do
    assigns[:calification] = @calification = stub_model(Calification,
      :new_record? => false,
      :customer => 1,
      :item => 1,
      :texto_calif => "value for texto_calif",
      :value_calif => 1
    )
  end

  it "renders the edit calification form" do
    render

    response.should have_tag("form[action=#{calification_path(@calification)}][method=post]") do
      with_tag('input#calification_customer[name=?]', "calification[customer]")
      with_tag('input#calification_item[name=?]', "calification[item]")
      with_tag('textarea#calification_texto_calif[name=?]', "calification[texto_calif]")
      with_tag('input#calification_value_calif[name=?]', "calification[value_calif]")
    end
  end
end
