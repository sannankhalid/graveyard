def create_admin_user
  admin_user = User.where(email:'admin@firdousiaqabristan.com').first
  User.create!(first_name: 'Admin', last_name:'Firdousia',email:'admin@firdousiaqabristan.com', is_deleted: false,
              is_admin:true, password: 12345678, password_confirmation: 12345678) if admin_user.blank?
end

def seed_relationships
  relation_slug = ['F/O', 'M/O', 'Son/O', 'H/O', 'Wife/O', 'Brother/O', 'Sister/O']
  %w(Father Mother Son Husband Wife Brother Sister).each_with_index do |name,i|
    relation = Relationship.where(name: name).first
    Relationship.create(name: name, slug: relation_slug[i]) if relation.blank?
  end

end

def seed_castes
  castes = AppConfig['pakistan_caste']
  if castes.present?
    castes.each do |caste|
      Caste.where(name: caste).first_or_create
    end
  end
end


create_admin_user
seed_relationships
seed_castes