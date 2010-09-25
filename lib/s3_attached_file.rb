module S3AttachedFile
  
  S3_OPTIONS = {
    :storage        => :s3,
    :s3_credentials => File.join(Rails.root, 'config', 's3_credentials.yml'),
    :url            => ":s3_path_url",
    :s3_headers     => { 'Expires' => 1.year.from_now.httpdate },
    :path           => "photos/:event_id/:id-:style.jpg"
  }
  
  def has_attached_s3_file(name, options = {})
    if Rails.env.production? or Rails.env.development?
      has_attached_file name, S3_OPTIONS.merge(options)
    else
      has_attached_file name, options
    end
  end
  
end
