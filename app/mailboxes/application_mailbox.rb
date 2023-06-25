class ApplicationMailbox < ActionMailbox::Base
  routing FolderMailbox::MATCHER => :folder
  routing all: :folder

  def from
    @from ||= mail.from.first
  end

  def body
    if mail.multipart? && mail.html_part
      mail.html_part.body.decoded
    elsif mail.multipart? && mail.text_part
      mail.text_part.body.decoded
    else
      mail.decoded
    end
  end
end
