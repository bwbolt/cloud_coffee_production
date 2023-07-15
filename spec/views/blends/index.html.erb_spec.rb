require 'rails_helper'

RSpec.describe "blends/index", type: :view do
  before(:each) do
    assign(:blends, [
      Blend.create!(
        name: "Name",
        notes: "Notes",
        user: nil
      ),
      Blend.create!(
        name: "Name",
        notes: "Notes",
        user: nil
      )
    ])
  end

  it "renders a list of blends" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Notes".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
