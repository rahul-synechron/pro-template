require 'spec_helper'

describe "blog_entries/show" do
  before(:each) do
    @blog_entry = assign(:blog_entry, stub_model(BlogEntry,
      :subject => "Subject",
      :content => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Subject/)
    rendered.should match(/MyText/)
  end
end
