require 'spec_helper'

describe "comments/index.html.erb" do
  before(:each) do
    assign(:comments, [
      stub_model(Comment,
        :tee_id => 1,
        :user_id => 1,
        :content => "MyText"
      ),
      stub_model(Comment,
        :tee_id => 1,
        :user_id => 1,
        :content => "MyText"
      )
    ])
  end

  it "renders a list of comments" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "MyText".to_s, :count => 2)
  end
end
