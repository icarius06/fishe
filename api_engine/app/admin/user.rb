ActiveAdmin.register User do
  permit_params :cellnum, :password, :password_confirmation

  menu priority: 6
  index do
    selectable_column
    id_column
    column :cellnum
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :cellnum
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :cellnum
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
