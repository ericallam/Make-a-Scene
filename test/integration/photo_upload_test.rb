require 'test_helper'

class PhotoUploadTest < ActionDispatch::IntegrationTest

  context 'logging in as an admin' do
    
    setup do
      @admin = Factory :admin
      
      sign_in @admin
    end
    
    context 'and then creating an event' do
      
      setup do
        get new_admin_event_path
        
        assert_equal 200, status
        
        post admin_events_path, :event => {:name => 'A New Event'}
        
        follow_redirect!
        
        @event = Event.find_by_name('A New Event')
      end
      
      should "be back on the events list" do
        assert_equal path, admin_events_path
      end
      
      should "have created a new event" do
        assert !@event.new_record?
      end
      
      should "not be live" do
        assert !@event.live?
      end
      
      should "not be private" do
        assert !@event.private?
      end
      
      context 'and then clicking on upload photos' do
        
        setup do
          get new_admin_event_photo_upload_path(@event)
          
          assert_equal 200, status
        end
        
        context 'and then uploading a zip file with photos inside' do
          
          setup do
            post admin_event_photo_uploads_path(@event), :photo_upload => {
              :archive => fixture_file_upload('test2.zip', 'application/zip')
            }
            
            follow_redirect!
            
            @photo_upload = @event.photo_uploads.first
          end
          
          should "be on the event page" do
            assert_equal admin_event_path(@event), path
          end
          
          should "create a photo upload record attached to the event" do
            assert_equal 'test2.zip', @photo_upload.archive_file_name
            assert_equal 'application/zip', @photo_upload.archive_content_type
          end
          
          should "create a photo for each image in the zip" do
            assert_equal 7, @event.photos.count
          end
          
          should "delete the zip file images" do
            assert !File.exists?(File.join(Rails.root, 'tmp', 'photos', Rails.env, "photo_upload_#{@photo_upload.id}", 'test2', 'IMG_0150.jpg'))
          end
          
        end
        
      end
      
    end
    
  end
end
