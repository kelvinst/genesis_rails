module GenesisRails
  module Services
    class Destroy
      def initialize(model)
        @model = model
      end

      def execute
        @model.destroy
      end
    end
  end
end

