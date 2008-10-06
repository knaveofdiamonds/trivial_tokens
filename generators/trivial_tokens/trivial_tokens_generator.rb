class TrivialTokensGenerator < Rails::Generator::NamedBase
  def manifest
    record do |m|
      m.class_collisions( [:Token] )
      m.directory "app/models"
      m.template "token.erb", "app/models/token.rb"
      m.migration_template "token_migration.erb", "db/migrate"
    end
  end
end
