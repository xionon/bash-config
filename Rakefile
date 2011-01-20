def home
  File.expand_path("~")
end

namespace :install do
  desc "Install symlinks and vim plugins"
  task :all => [:gitconfig, :vim]

  desc "Symlink dotfiles from the home directory to the dotfiles directory"
  task :dotfiles do
    Dir.glob("./dotfiles/*").each do |f|
      full_path = File.expand_path(f)
      symlink_path = File.join(home, "." + File.basename(f))
      print symlink_path + " --- "

      if(File.exists?(symlink_path)) 
        File.delete(symlink_path)
      end
      File.symlink(full_path, symlink_path)

      puts File.exists?(symlink_path)
    end

  end

  desc "Configure global git stuff"
  task :gitconfig => [:dotfiles] do
    `git config --global core.excludesfile ~/.gitignore` 
  end

  # TODO: update plugins automatically?
  desc "Install vim plugins via symlink"
  task :vim do
    vim_path = File.join(home, ".vim")
    full_path = File.expand_path("./vim")
    if(File.exists?(vim_path))
      File.delete(vim_path)
    end
    File.symlink full_path, vim_path
  end
end
