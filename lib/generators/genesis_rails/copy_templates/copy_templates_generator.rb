require 'rails/generators'
module GenesisRails
  class CopyTemplatesGenerator < Rails::Generators::Base
    def self.source_root
      @source_root ||= GenesisRails::Engine.root.join "lib/genesis_rails/templates"
    end

    def copy_template_files
      root = self.class.source_root
      Dir[root.join "**/*.*"].each do |file|
        copy_file file, "lib/templates/#{file.gsub(root.to_s, "")}"
      end
    end
  end
end


