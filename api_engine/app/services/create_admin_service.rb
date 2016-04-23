class CreateAdminService
  def call
    user = User.find_or_create_by!(cellnum: "0788485927") do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.email="user@fishe.com"
    end
    
    user.profile.update_attributes(fname: "Michael",lname: "Otieno")
  end
end