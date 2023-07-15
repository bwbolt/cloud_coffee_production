require 'rails_helper'

RSpec.describe "blend_logs/edit", type: :view do
  before(:each) do
    @blend_log = assign(:blend_log, BlendLog.create!(
      blend: nil,
      log: nil
    ))
  end

  it "renders the edit blend_log form" do
    render

    assert_select "form[action=?][method=?]", blend_log_path(@blend_log), "post" do

      assert_select "input[name=?]", "blend_log[blend_id]"

      assert_select "input[name=?]", "blend_log[log_id]"
    end
  end
end
