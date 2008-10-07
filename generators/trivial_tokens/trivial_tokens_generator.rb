class TrivialTokensGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions( [:Token, class_name] )

      m.directory "app/models"
      m.directory "app/lib"

      m.template "login.erb", "lib/trivial_login.rb"
      m.template "token.erb", "app/models/token.rb"
      m.template "user.erb", "app/models/#{singular_name}.rb"

      m.migration_template "migration.erb", "db/migrate", :migration_file_name => "create_tokens"
      m.migration_template "users.erb", "db/migrate", :migration_file_name => "create_#{table_name}"
    end
  end
end
