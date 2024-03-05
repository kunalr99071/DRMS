ActiveAdmin.register Route do
  actions :index, :edit, :update,:new,:create, :show,:destroy

 permit_params :name

  index do
    selectable_column
    id_column
    column :name
    # column :current_sign_in_at
    # column :sign_in_count
    #  column :created_at
    actions
  end


  filter :name
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at
  form do |f|
    f.inputs do
      f.input :name
      # f.input :password
      # f.input :password_confirmation
    end
    f.actions
  end

  show do 
    attributes_table do
    row 'station' do |route|
      route.stations.any? ?route.stations.map { |station| "&bull; #{station.station_name}" }.join('<br>').html_safe : content_tag(:span, 'N.A.')
    end
  end
end
end
