require 'stringex'

module Nutrition
  class Article < ActiveRecord::Base
    if Nutrition.config.engine_routing
      include Nutrition::Engine.routes.url_helpers
    else
      include Rails.application.routes.url_helpers
    end

    attr_accessible :text,
                    :url,
                    :page_title,
                    :title,
                    :lead_image,
                    :related_links_attributes,
                    :created_at,
                    :updated_at,
                    :published,
                    :order

    has_attached_file :lead_image, styles: Nutrition.config.image_styles

    has_many :related_links
    accepts_nested_attributes_for :related_links, allow_destroy: true

    acts_as_url :title

    default_scope order: '`order` DESC'

    validates_uniqueness_of :url

    def to_param
      url
    end

    def to_s
      title
    end

    def self.paginated(page)
      where(published: true).page(page).per(Nutrition.config.per_page)
    end
  end
end
