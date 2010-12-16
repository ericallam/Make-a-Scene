module Paperclip
  module Storage
    module S3
     # def to_file style = default_style
     #   return @queued_for_write[style] if @queued_for_write[style]
     #   file = Tempfile.new(path(style))
     #   file.binmode
     #   file.write(AWS::S3::S3Object.value(path(style), bucket_name))
     #   file.rewind
     #   return file
     # end
    end
  end
end

