require 'rails_helper'

RSpec.describe "blends/show", type: :view do
  before(:each) do
    @blend = assign(:blend, Blend.create!(
      name: "Name",
      notes: "Notes",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Notes/)
    expect(rendered).to match(//)
  end
end
