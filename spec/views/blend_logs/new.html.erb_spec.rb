require 'rails_helper'

RSpec.describe "blend_logs/new", type: :view do
  before(:each) do
    assign(:blend_log, BlendLog.new(
      blend: nil,
      log: nil
    ))
  end

  it "renders new blend_log form" do
    render

    assert_select "form[action=?][method=?]", blend_logs_path, "post" do

      assert_select "input[name=?]", "blend_log[blend_id]"

      assert_select "input[name=?]", "blend_log[log_id]"
    end
  end
end
