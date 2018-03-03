def create_admin_user
  admin_user = User.where(email:'admin@firdousiaqabristan.com').first
  User.create!(first_name: 'Admin', last_name:'Firdousia',email:'admin@firdousiaqabristan.com', is_deleted: false,
              is_admin:true, password: 12345678, password_confirmation: 12345678) if admin_user.blank?
end


create_admin_user