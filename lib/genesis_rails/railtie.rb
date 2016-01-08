module GenesisRails
  class Railtie < Rails::Railtie
    config.app_generators do |g|
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end

    initializer "magic-view" do |app|
      ActionController::Base.send :include, GenesisRails::AutoInclude::Methods
      ActionController::Base.after_action :auto_include_magic_view_data_attr
    end
  end
end
