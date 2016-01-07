require 'rails/generators'
module GenesisRails
  class ServiceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    def create_services_files
      template "service.rb", "app/services/#{file_name.pluralize}_service.rb"
    end
  end
end

