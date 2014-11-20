require 'stringex'

module Nutrition
  class Category < ActiveRecord::Base
    attr_accessible :text,
                    :url,
                    :page_title,
                    :title,
                    :lead_image,
                    :created_at,
                    :updated_at,
                    :order

    has_attached_file :lead_image, styles: Nutrition.config.image_styles

    has_many :articles

    acts_as_url :title

    default_scope order: '`order` ASC'

    validates_uniqueness_of :url

    def to_param
      url
    end

    def to_s
      title
    end
  end
end
