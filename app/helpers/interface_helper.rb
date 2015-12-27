module InterfaceHelper

  #галочка
  def check_mark(property)
  	if property == true
  		'<i class="material-icons uk-text-success md-24">&#xE834;</i>'.html_safe
  	elsif property == false
  		'<i class="material-icons uk-text-muted md-24">&#xE835;</i>'.html_safe
  	end		
  end

end
