# Domain name that a given React JS application is meant to be served
# on.
class Domain
  attr_reader :id, :name

  def initialize(id: '', name: '')
    @id = id
    @name = name
  end

  # All domains configured in +config/domains.yml+.
  #
  # @return [Array<Domain>]
  def self.all
    @all ||= Rails.configuration.domains.map do |id, name|
      Domain.new(id: id, name: name)
    end
  end

  # Find a given domain by its host.
  #
  # @return [Domain]
  # @throws [Domain::NotFound] when domain name is not configured
  def self.find(name)
    all.find { |domain| domain.name == name } || raise(NotFound, name)
  end
end
