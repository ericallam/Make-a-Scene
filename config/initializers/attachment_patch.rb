module Paperclip
  class Attachment
    def post_process_styles #:nodoc:
      styles.each do |name, style|
        begin
          raise RuntimeError.new("Style #{name} has no processors defined.") if style.processors.blank?
          @queued_for_write[name] = style.processors.inject(@queued_for_write[:original]) do |file, processor|
            puts 'style: ' + style.processor_options.inspect
            Paperclip.processor(processor).make(file, style.processor_options, self)
          end
        rescue PaperclipError => e
          log("An error was received while processing: #{e.inspect}")
          (@errors[:processing] ||= []) << e.message if @whiny
        end
      end
    end
  end
end
