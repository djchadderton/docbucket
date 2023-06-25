class FolderMailbox < ApplicationMailbox
  MATCHER = /^folder-(\d+)-(\d+)@/i
  def process
    folder.posts.create(title: mail.subject, user: sender, body: body)
    Folder.reset_counters(folder_id, :posts)
  end

  def folder
    Folder.find(folder_id)
  end

  def folder_id
    mail.recipients.find { |recipient| MATCHER.match?(recipient) }[MATCHER, 1]
  end

  def user_id
    mail.recipients.find { |recipient| MATCHER.match?(recipient) }[MATCHER, 2]
  end

  def sender
    User.find(user_id)
  end
end
