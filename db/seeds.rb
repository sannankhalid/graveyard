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


create_admin_user
seed_relationships