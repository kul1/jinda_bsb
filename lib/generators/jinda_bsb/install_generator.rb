module Jinda_bsb  
  class InstallGenerator < Rails::Generators::Base
    desc "Install jinda adminbsb theme to existing Jinda app "
    def self.source_root
      File.dirname(__FILE__) + "/templates"
    end

    def setup_app
      inside("app/views/layouts") { run "mv application.haml application.haml.bak" }
      inside("app/views/layouts") { run "mv bsb bsb.bak" }
      inside("app/assets") { run "mv jinda_assets ../../tmp/cache" }
      inside("app/assets") { run "mv javascripts javascripts.bak" }
      inside("app/assets") { run "mv stylesheets stylesheets.bak" }
      inside("app/jinda") { run "mv index.mm index.mm.bak"}
      directory "app/assets/jinda_assets"
      directory "app/views/adminbsbs"
      directory "app/views/layouts/bsb"  
    end

    def copy_theme
      copy_file "application.js","app/assets/javascripts/application.js"
      copy_file "jindabsb.js","app/assets/javascripts/jindabsb.js"
      copy_file "application.scss","app/assets/stylesheets/application.scss"
      copy_file "jindabsb.css","app/assets/stylesheets/jindabsb.css"
      copy_file "application.haml","app/views/layouts/application.haml"
      copy_file "adminbsbs_controller.rb","app/controllers/adminbsbs_controller.rb"
      copy_file "index.mm","app/jinda/index.mm"
  end

    def finish        
      puts "------------------------------------------------\n"
      puts "                                                \n"
      puts "  Jinda Theme installation finished             \n"
      puts "  Note: last jinda_assets was move to tmp/cache \n"
      puts "  To delte run the following command            \n"
      puts "                                                \n"
      puts "rake tmp:cache:clear                            \n"
      puts "------------------------------------------------\n"
    end
  end
end

