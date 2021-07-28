require 'fileutils'

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

      print symlink_path

      unless(File.exists?(symlink_path))
        File.symlink(full_path, symlink_path)
      end
      puts " \xE2\x9C\x94\n"
    end
  end

  desc "Configure global git stuff"
  task :gitconfig => [:dotfiles] do
    `git config --global core.excludesfile ~/.gitignore`
  end

  desc "Install vim plugins via symlink"
  task :vim do
    FileUtils.mkdir_p File.join(home, ".vim", "bundle")

    unless File.exist?(File.join(home, ".vim", "bundle", "Vundle.vim"))
      %x( git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim )
    end

    puts "To finish installing vim + vundle, run: \n`vim +PluginInstall +qall`"
  end

  namespace :packages do
    desc "Install ubuntu packages"
    task :ubuntu do
      %x( sudo apt-get install vim-nox )
    end
  end
end

task :install => ["install:all"]
task default: :install
