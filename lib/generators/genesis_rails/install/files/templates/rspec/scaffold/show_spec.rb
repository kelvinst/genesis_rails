require 'rails_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
RSpec.describe "<%= ns_table_name %>/show", <%= type_metatag(:view) %> do
  before(:each) do
    @<%= ns_file_name %> = assign(:<%= ns_file_name %>, FactoryGirl.create(:<%= ns_file_name %>))
  end

  it "renders attributes in <p>" do
    render
<% for attribute in output_attributes -%>
    expect(rendered).to match(/<%= raw_value_for(attribute) %>/)
<% end -%>
  end
end
