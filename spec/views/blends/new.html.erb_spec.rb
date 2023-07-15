require 'rails_helper'

RSpec.describe "blends/new", type: :view do
  before(:each) do
    assign(:blend, Blend.new(
      name: "MyString",
      notes: "MyString",
      user: nil
    ))
  end

  it "renders new blend form" do
    render

    assert_select "form[action=?][method=?]", blends_path, "post" do

      assert_select "input[name=?]", "blend[name]"

      assert_select "input[name=?]", "blend[notes]"

      assert_select "input[name=?]", "blend[user_id]"
    end
  end
end
