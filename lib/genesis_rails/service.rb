module GenesisRails
  class Service
    def initialize(model)
      @model = model
    end

    def create
      @model.save
    end

    def update
      @model.save
    end

    def delete
      @model.destroy
    end
  end
end
