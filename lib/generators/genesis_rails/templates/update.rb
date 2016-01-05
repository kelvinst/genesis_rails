<% module_namespacing do -%>
module <%= class_name %>Services
  class Update < GenesisRails::Services::Update
    # overwrite this method if you want to do something more when you are
    # updating a <%= human_name %>
    # def execute
    #   # put shared methods between services on the helper class
    #   # behind the path /app/services/<%= file_name %>_services/helper.rb
    #   Helper.handle_values(@model)
    #
    #   # then you can call `super` to invoke the update itself
    #   super
    #
    #   # and of course, you can do anything you want after doing it too
    #   Helper.update_something_else(@model)
    # end
  end
end
<% end -%>
