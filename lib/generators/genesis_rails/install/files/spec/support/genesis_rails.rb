module ActiveRecord
  class Base
    # this method returns the attributes to use on controller tests
    def test_attributes
      attributes.delete_if do |key, value|
        ["id", "created_at", "updated_at"].include? key
      end
    end
  end
end

def create_session(user = nil)
  # You'll probably need to do something like this:
  #
  # controller.sign_in(user || FactoryGirl.create(:user))
  #
  # Or if you are using devise:
  #
  # sign_in(user || FactoryGirl.create(:user))
  #
  # If you don't need a user logged in, just leave this method as it is now
end

def valid_session_hash(user = nil)
  # You'll probably need to do something like this:
  #
  # user ||= FactoryGirl.create(:user)
  # {user_id: user.id}
  #
  # If you don't need a user logged in, just leave this method as it is now
  {}
end

