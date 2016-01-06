<% module_namespacing do -%>
class <%= class_name.pluralize %>Service < GenesisRails::Service
  # you can overwrite these methods if you want to do something more when you
  # are dealing with the <%= class_name %> model
  # def create
  #   super # just don't forget to call super
  # end
  #
  # def update
  #   super # just don't forget to call super
  # end
  #
  # def delete
  #   super # just don't forget to call super
  # end
end
<% end -%>
