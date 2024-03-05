ActiveAdmin.register Ticket do

  actions :index, :edit, :update, :create, :destroy,:show
  permit_params :from,:to,:date,:mobile,:email,:pnr

  index do
    selectable_column
    id_column
    column :from
    column :to
    column :date
    column :mobile
    column :email
    column :pnr
    column :created_at 
    actions
  end

  filter :from
  filter :to
  filter :date
  filter :mobile
  filter :email
  filter :pnr
  filter :created_at

  form do |f|
    f.inputs do
      f.input :from
      f.input :to
      f.input :date
      f.input :mobile
      f.input :email
    end
    f.actions
  end
  
  
  show do 
    attributes_table do
    row 'passenger' do |ticket|
      ticket.passengers.any? ?ticket.passengers.map { |passenger| "&bull; #{passenger.name}" }.join('<br>').html_safe : content_tag(:span, 'N.A.')
    end
  end
end

end
