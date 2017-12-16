module Jindabsb  
  class InstallGenerator < Rails::Generators::Base
    desc "Install jinda adminbsb theme to existing Jinda app "
    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    def setup_app
      inside("public") { run "mv index.html index.html.bak" }
      inside("app/views/layouts") { run "mv application.haml application.haml.bak" }
      inside("app/assets/javascripts") { run "mv application.js application.js.bak" }
      inside("app/assets/stylesheets") { run "mv application.scss application.scss.bak" }
    end

    def copy_theme
      copy_file "application.js","app/assets/javascripts/application.js"
      copy_file "application.scss","app/assets/stylesheets/application.scss"
      copy_file "application.haml","app/views/layouts/application.haml"
      copy_file "jindabsb.js","app/assets/javascripts/jindabsb.js"
      copy_file "jindabsb.css","app/assets/stylesheets/jindabsb.css"

    end

    def finish        
      puts "----------------------------------------\n"
      puts "                                        \n"
      puts "Jinda-adminbsb theme installation finish\n"
      puts "                                        \n"
      puts "----------------------------------------\n"
    end
  end
end

