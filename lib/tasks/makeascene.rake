
namespace :makeascene do
  
  desc 'reprocess all photos'
  task :reprocess_photos => :environment do
    Photo.all.map(&:image).map &:reprocess!
  end
  
end
