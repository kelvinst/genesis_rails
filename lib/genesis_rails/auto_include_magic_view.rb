module GenesisRails
  module AutoInclude
    module Methods
      def auto_include_magic_view_data_attr
        GenesisRails::AutoInclude::MagicView.add_data_attr(self)
      end
    end

    class MagicView
      OPENING_BODY_TAG = "<body"

      attr_reader :controller

      def self.add_data_attr(controller)
        data_attr_include = new(controller)
        data_attr_include.include_magic_view_classes!
      end

      def initialize(kontroller)
        @controller = kontroller
      end

      def include_magic_view_classes!
        response.body = response.body.gsub(
          OPENING_BODY_TAG,
          '\\0' + " data-action-view=\"#{action_class_name}View\"
          data-controller-view=\"#{controller_class_name}View\"")
      end

      private

      def response
        controller.response
      end

      def action_class_name
        action = case controller.action_name
                 when "create" then "new"
                 when "update" then "edit"
                 else
                   controller.action_name
                 end
        action = action.camelize
        "#{controller_class_name}#{action}"
      end

      def controller_class_name
        controller.class.name.gsub('::', '').gsub(/Controller$/, '')
      end
    end
  end
end
