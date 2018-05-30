module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_student = find_verified_student
      logger.add_tags 'ActionCable', current_student.name
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      if verified_student = env['warden'].student
        verified_student
      else
        reject_unauthorized_connection
      end
    end
  end
end
