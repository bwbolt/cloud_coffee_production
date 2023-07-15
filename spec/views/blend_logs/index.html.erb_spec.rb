require 'rails_helper'

RSpec.describe "blend_logs/index", type: :view do
  before(:each) do
    assign(:blend_logs, [
      BlendLog.create!(
        blend: nil,
        log: nil
      ),
      BlendLog.create!(
        blend: nil,
        log: nil
      )
    ])
  end

  it "renders a list of blend_logs" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
