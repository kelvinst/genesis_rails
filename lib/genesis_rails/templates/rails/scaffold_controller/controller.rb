<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/authenticated_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < AuthenticatedController
  respond_to :html

  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
  end

  def show
    load_<%= singular_table_name %>
  end

  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  def edit
    load_<%= singular_table_name %>
  end

  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    <%= controller_class_name %>Service.new(@<%= singular_table_name %>).create

    respond_with @<%= singular_table_name %>
  end

  def update
    load_<%= singular_table_name %>
    @<%= singular_table_name %>.attributes = <%= singular_table_name %>_params
    <%= controller_class_name %>Service.new(@<%= singular_table_name %>).update

    respond_with @<%= singular_table_name %>
  end

  def destroy
    load_<%= singular_table_name %>
    <%= controller_class_name %>Service.new(@<%= singular_table_name %>).delete

    respond_with @<%= singular_table_name %>
  end

  private

  def load_<%= singular_table_name %>
    @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
  end

  def <%= "#{singular_table_name}_params" %>
    <%- if attributes_names.empty? -%>
    params.fetch(:<%= singular_table_name %>, {})
    <%- else -%>
    params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
    <%- end -%>
  end
end
<% end -%>

