class WorkNotification < ApplicationRecord
  attr_accessor :near_works, :expired_works

  acts_as_notifiable :students,
    # Notification targets as :targets is a necessary option
    # Set to notify to author and users commented to the article, except comment owner self
    targets: ->(work_notification, key) {
      (:near_works)
    },
    # Path to move when the notification is opened by the target user
    # This is an optional configuration since activity_notification uses polymorphic_path as default
    tracked: true



  def get_data

  end

  def set_works

  end
end
