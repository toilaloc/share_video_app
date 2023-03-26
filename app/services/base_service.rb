# frozen_string_literal: true

class BaseService
  extend ActiveSupport::Concern

  def self.call(*args)
    new(*args).call
  end
end
