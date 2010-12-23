# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def show_flash
      f_names = [:success, :info, :warning, :error]
      fl = ''

      for name in f_names
          if flash[name]
              fl = fl + "<div class=\"flash-#{name}\">#{flash[name]}</div>"
          end
          flash[name] = nil;
      end
      return fl
  end
  
end
