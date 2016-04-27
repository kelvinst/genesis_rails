require 'rails_helper'

<% output_attributes = attributes.reject{|attribute| [:datetime, :timestamp, :time, :date].index(attribute.type) } -%>
RSpec.describe "<%= ns_table_name %>/index", <%= type_metatag(:view) %> do
  before(:each) do
    assign(:<%= table_name %>, [
      FactoryGirl.create(:<%= ns_file_name %>),
      FactoryGirl.create(:<%= ns_file_name %>)
    ])
  end

  it "renders a list of <%= ns_table_name %>" do
    render
<% for attribute in output_attributes -%>
    assert_select "tr>td", :text => <%= value_for(attribute) %>.to_s, :count => 2
<% end -%>
  end
end
