ActiveAdmin.register Passenger do

  actions :index, :edit, :update, :create, :destroy
  permit_params :name,:age,:mobile,:gender,:ticket_id

  index do
    selectable_column
    id_column
    column :name
    column :age
    column :mobile
    column :gender
    column :ticket_id
    column :created_at 
    actions
  end

  filter :name
  filter :age
  filter :mobile
  filter :gender
  filter :ticket_id
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :age
      f.input :mobile
      f.input :gender
      f.input :ticket_id
    end
    f.actions
  end
  
  
end
