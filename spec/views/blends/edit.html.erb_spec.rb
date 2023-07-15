require 'rails_helper'

RSpec.describe "blends/edit", type: :view do
  before(:each) do
    @blend = assign(:blend, Blend.create!(
      name: "MyString",
      notes: "MyString",
      user: nil
    ))
  end

  it "renders the edit blend form" do
    render

    assert_select "form[action=?][method=?]", blend_path(@blend), "post" do

      assert_select "input[name=?]", "blend[name]"

      assert_select "input[name=?]", "blend[notes]"

      assert_select "input[name=?]", "blend[user_id]"
    end
  end
end
