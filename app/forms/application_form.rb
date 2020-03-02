class ApplicationForm < AuxiliaryRails::Application::Form
  include ActiveModel::Attributes
  include ActiveModel::Model

  def self.call(*args)
    new(*args).perform
  end

  def perform
    raise NotImplementedError
  end
end
