module GenesisRails
  module Services
    class Create
      def initialize(model)
        @model = model
      end

      def execute
        @model.save
      end

      def execute!
        @model.save!
      end
    end
  end
end
