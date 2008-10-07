class TrivialTokensGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      check_for_class_collisions m
      create_directories m
      copy_templates m
      copy_migration_templates m
      add_routes m
    end
  end

  protected

  def check_for_class_collisions(m)
    m.class_collisions( [:Token, class_name] )
  end

  def create_directories(m)
    m.directory "app/models"
    m.directory "app/controllers"
    m.directory "app/views/#{plural_name}"
    m.directory "app/lib"
  end

  def copy_templates(m)
    m.template "login.erb", "lib/trivial_login.rb"
    m.template "token.erb", "app/models/token.rb"
    m.template "user.erb", "app/models/#{singular_name}.rb"
    m.template "users_controller.erb", "app/controllers/#{plural_name}_controller.rb"
    m.template "new_user_form.erb", "app/views/#{plural_name}/_new_#{singular_name}.html.erb"
    m.template "holding_new.erb", "app/views/#{plural_name}/new.html.erb"
  end

  def copy_migration_templates(m)
    m.migration_template "token_migration.erb", "db/migrate", :migration_file_name => "create_tokens"
    m.migration_template "user_migration.erb", "db/migrate", :migration_file_name => "create_#{table_name}"
  end

  def add_routes(m)
    m.route_resources plural_name
  end
end
