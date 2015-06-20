require 'spec_helper'

describe 'sentences/show.html.haml' do
  before(:each) do
    @sentence = assign(:sentence, stub_model(Sentence,
                                             text: 'Text',
                                             type: 'Type'
                                            ))
  end

  it 'renders attributes in <p>' do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Text/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/Type/)
  end
end
