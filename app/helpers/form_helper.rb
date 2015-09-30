module FormHelper

    def f_label(f, field, text=nil)
      text ||= field.to_s.humanize
      error = f.object.errors[field].join(', ') rescue ''
      return f.label(field, "#{text} <span class='label-error'>#{error}</span>".html_safe).html_safe
    end

end
