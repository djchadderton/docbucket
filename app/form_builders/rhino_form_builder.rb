class RhinoFormBuilder < ActionView::Helpers::FormBuilder
  delegate :tag, to: :@template

  def rhino_editor(name, *args)
    hidden_field(name, id: field_id(name), value: object.send(name).try(:to_trix_html) || object.send(name)) +
      tag.rhino_editor(input: field_id(name))
  end
end
