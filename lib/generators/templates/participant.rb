<% module_namespacing do -%>
class <%= class_name %> < RuoteTrail::ActiveRecord::Base
<% attributes.select(&:reference?).each do |attribute| -%>
  belongs_to :<%= attribute.name %><%= ', polymorphic: true' if attribute.polymorphic? %>
<% end -%>
end
<% end -%>