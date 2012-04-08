require 'spec_helper'

describe "comments/show.html.erb" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :tee_id => 1,
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain("MyText".to_s)
  end
end
