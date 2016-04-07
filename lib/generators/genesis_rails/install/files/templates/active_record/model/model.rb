<% module_namespacing do -%>
class <%= class_name %> < <%= parent_class_name.classify %>
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %><%= ', required: true' if attribute.required? %>
<% end -%>
<% if attributes.any?(&:password_digest?) -%>
  has_secure_password
<% end -%>
<%
  attributes_to_show = attributes.reject(&:password_digest?)
  title_attribute = attributes_to_show.find do |attr|
    ["name", "title"].include? attr.name
  end || attributes_to_show.first
-%>
<% if title_attribute.present? -%>
  def to_s
    <%= title_attribute.name %>
  end
<% end -%>
end
<% end -%>

