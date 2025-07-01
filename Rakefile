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

  desc "Install vim plugins via vim-plug"
  task :vim do
    # Create vim directories
    FileUtils.mkdir_p File.join(home, ".vim", "autoload")
    FileUtils.mkdir_p File.join(home, ".vim", "plugged")

    # Install vim-plug if not already installed
    plug_path = File.join(home, ".vim", "autoload", "plug.vim")
    unless File.exist?(plug_path)
      puts "Installing vim-plug..."
      %x( curl -fLo #{plug_path} --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim )
      puts "✓ vim-plug installed"
    else
      puts "✓ vim-plug already installed"
    end

    puts "\nTo finish installing vim plugins, run: \n`vim +PlugInstall +qall`"
    puts "Or open vim and run: :PlugInstall"
  end

  namespace :packages do
    desc "Install ubuntu packages (Ubuntu only)"
    task :ubuntu do
      # Check if running on Ubuntu
      unless system("lsb_release -a 2>/dev/null | grep -q Ubuntu")
        puts "Skipping Ubuntu package installation - not running on Ubuntu"
        next
      end

      puts "Installing modern Vim packages..."
      %x( sudo apt-get update )
      %x( sudo apt-get install -y vim-gtk3 neovim curl git )
      puts "✓ Modern Vim packages installed"
    end
  end
end

task :install => ["install:all"]
task default: :install
