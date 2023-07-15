require 'rails_helper'

RSpec.describe "blend_logs/show", type: :view do
  before(:each) do
    @blend_log = assign(:blend_log, BlendLog.create!(
      blend: nil,
      log: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
