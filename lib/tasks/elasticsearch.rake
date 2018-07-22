namespace :elasticsearch do
  desc 'create index for pictures'
  task :create_index => :environment do
    Picture.create_index!
  end

  desc 'register index for pictures' # Picture を Elasticsearch に登録
  task :import_article => :environment do
    Picture.import
  end
end
