class TrivialTokensGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions( [:Token] )
      m.directory "app/models"
      m.template "token.erb", "app/models/token.rb"
      m.migration_template "migration.erb", "db/migrate", :migration_file_name => "create_tokens"
    end
  end
end
