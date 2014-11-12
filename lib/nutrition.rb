require 'nutrition/engine'

module Nutrition
  mattr_accessor :engine_routing
  @@engine_routing = false

  mattr_accessor :per_page
  @@per_page = 5

  mattr_accessor :article_class
  @@article_class = false

  mattr_accessor :article_sweeper
  @@article_sweeper = false

  mattr_accessor :engine_active_admin
  @@engine_active_admin = true

  mattr_accessor :image_styles
  @@image_styles = {
      main: '200x200#',
      thumb: '70x70#'
    }

  class Engine < Rails::Engine
    isolate_namespace Nutrition

    initializer :nutrition do
      ActiveAdmin.application.load_paths.unshift Dir[Nutrition::Engine.root.join('app', 'admin')] if defined?(ActiveAdmin)
    end
  end

  def self.config(&block)
    yield self if block
    return self
  end
end
