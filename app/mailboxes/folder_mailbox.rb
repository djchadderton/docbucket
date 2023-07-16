class FolderMailbox < ApplicationMailbox
  MATCHER = /^folder-(\d+)-(\d+)@/i
  def process
    folder.posts.create(title: mail.subject, user: sender, body: post_body)
    Folder.reset_counters(folder_id, :posts)
  end

  def folder
    Folder.find(folder_id)
  end

  def folder_id
    recipients[MATCHER, 1]
  end

  def user_id
    recipients[MATCHER, 2]
  end

  def sender
    User.find(user_id)
  end

  def from
    @from ||= mail.from_address
  end

  def post_body
    "From: #{from}\n" + body
  end

  def recipients
    @recipients ||= (mail.recipients + Array(mail[:resent_to]).map(&:to_s)).find { |recipient| MATCHER.match?(recipient) }
  end
end
