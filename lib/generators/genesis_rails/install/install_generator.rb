require 'rails/generators'
module GenesisRails
  class InstallGenerator < Rails::Generators::Base
    def self.source_root
      @source_root ||= GenesisRails::Engine.root.join "lib/generators/genesis_rails/install/files"
    end

    def install_files
      templates = self.class.source_root.join "templates"
      Dir[templates.join "**/*.*"].each do |file|
        copy_file file, "lib/templates/#{file.gsub(templates.to_s, "")}"
      end

      spec_support = self.class.source_root.join "spec/support"
      Dir[spec_support.join "**/*.*"].each do |file|
        copy_file file, "spec/support/#{file.gsub(spec_support.to_s, "")}"
      end
    end
  end
end


