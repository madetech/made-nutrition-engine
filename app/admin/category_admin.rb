if defined?(ActiveAdmin) and Nutrition.config.engine_active_admin
  ActiveAdmin.register Nutrition.config.category_class, { sort_order: :order } do
    actions :all, except: [:show]

    controller do
      cache_sweeper Nutrition.config.category_sweeper if Nutrition.config.category_sweeper
      defaults finder: :find_by_url
    end

    filter :title

    menu label: 'Category', parent: 'Nutrition', priority: 2

    index do
      column :title
      column :created_at
      column :updated_at
      column :text do |category|
        category.text[0, 100]
      end
      column :lead_image do |category|
        unless category.lead_image.blank?
          image_tag category.lead_image(:thumb)
        end
      end

      default_actions
    end

    form do |f|
      f.inputs 'Category' do
        f.input :title
        f.input :page_title
        f.input :text
        f.input :order
        f.input :lead_image, as: :file
      end

      f.actions
    end
  end
end
