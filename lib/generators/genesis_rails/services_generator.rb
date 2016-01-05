require 'rails/generators'
module GenesisRails
  class ServicesGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def create_services_files
      template "create.rb", "app/services/#{file_name}_services/create.rb"
      template "update.rb", "app/services/#{file_name}_services/update.rb"
      template "destroy.rb", "app/services/#{file_name}_services/destroy.rb"
      template "helper.rb", "app/services/#{file_name}_services/helper.rb"
    end
  end
end

