require 'spec_helper'

describe "comments/new.html.erb" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :new_record? => true,
      :tee_id => 1,
      :user_id => 1,
      :content => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    rendered.should have_selector("form", :action => comments_path, :method => "post") do |form|
      form.should have_selector("input#comment_tee_id", :name => "comment[tee_id]")
      form.should have_selector("input#comment_user_id", :name => "comment[user_id]")
      form.should have_selector("textarea#comment_content", :name => "comment[content]")
    end
  end
end
