module ApplicationHelper
  def flash_class(level)
    case level
    when :notice then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    end
  end
      
  def field_status(resource, field)
    'has-error' if resource.errors.has_key? field
  end
      
  def field_status_message(resource, field)
    if resource.errors.has_key? field
      status_message = resource.errors.full_message(field, resource.errors.get(field)[0])
      raw('<span class="help-block">'+status_message+'</span>')
    else
      ''
    end
  end
        
end
