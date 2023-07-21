class RhinoFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, :rails_service_blob_url, :rails_direct_uploads_url, :pluralize, to: :@template

  def rhino_editor(name, *args)
    hidden_field(name, id: field_id(name), value: object.send(name).try(:to_trix_html) || object.send(name)) +
      tag("rhino-editor", {input: field_id(name), data: {"blob-url-template": rails_service_blob_url(":signed_id", ":filename"), "direct-upload-url": rails_direct_uploads_url}}.merge(options))
  end

  def error_messages
    return unless object.errors.any?

    tag.div style: "color: red;" do
      tag.h2("#{pluralize(object.errors.count, "error")} prohibited this #{object_name} from being saved:") +
        tag.ul do
          object.errors.full_messages.map { |msg| tag.li(msg) }.join.html_safe
        end
    end
  end
end
