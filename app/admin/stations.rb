ActiveAdmin.register Station do

  actions :index, :edit, :update, :new, :create, :show, :destroy 
  permit_params :station_name,:arrival,:departure,:distance,:seats

  index do
    selectable_column
    id_column
    column :station_name
    column :arrival
    column :departure
    column :distance
    column :seats
    column :route_id
    column :created_at 
    actions
  end

  filter :station_name
  filter :arrival
  filter :departure
  filter :distance
  filter :seats
  filter :route_id
  filter :created_at

  form do |f|
    f.inputs do
      f.input :station_name
      f.input :arrival
      f.input :departure
      f.input :distance
      f.input :seats
      f.input :route_id, lable:'train', as: :select, collection: Route.all.collect{|r| [r.name,r.id] },include_blank: "select train "  
    end
    f.actions
  end
  
end
