require 'rails/generators'
module GenesisRails
  class InstallGenerator < Rails::Generators::Base
    def self.source_root
      @source_root ||= File.expand_path('../files', __FILE__)
    end

    def install_files
      templates = self.class.source_root.join "templates"
      Dir[templates.join "**/*.*"].each do |file|
        copy_file file, "lib/templates/#{file.gsub(root.to_s, "")}"
      end

      spec_support = self.class.source_root.join "spec/support"
      Dir[spec_support.join "**/*.*"].each do |file|
        copy_file file, "spec/support/#{file.gsub(root.to_s, "")}"
      end
    end
  end
end


