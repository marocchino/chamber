require 'spec_helper'

describe "sentences/edit.html.haml" do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
      :text => "MyString",
      :type => "MyString"
    ))
  end

  it "renders the edit sentence form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sentences_path(@sentence), :method => "post" do
      assert_select "input#sentence_text", :name => "sentence[text]"
      assert_select "input#sentence_type", :name => "sentence[type]"
    end
  end
end
