ActiveAdmin.register Healthcheck do
  permit_params do
    [:name]
  end

  menu priority: 1

  # Make it work with friendly id
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  index do
    selectable_column
    column :name
    column :created_at
    column "URL" do |hc|
      healthcheck_ping_url(hc)
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
      row :slug
      row("URL") do |hc|
        healthcheck_ping_url(hc)
      end
    end
    active_admin_comments
  end

end
