class Domain
  class NotFound < StandardError
    def initialize(name)
      super "Application not found for domain '#{name}'"
    end
  end
end
