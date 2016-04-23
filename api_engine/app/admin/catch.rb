ActiveAdmin.register Catch do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	menu priority: 2
	permit_params(:user_id, catch_profiles_attributes: [:id, :species, :quantity])

	form do |f|
	    f.inputs 'Details' do
	      f.input :user_id
	      f.has_many :catch_profiles, heading: 'Profile', allow_destroy: true, new_record: true do |a|
	        a.input :species
	        a.input :quantity
	      end
	    end
	    f.actions
	  end
end
