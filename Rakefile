require 'fileutils'

def home
  File.expand_path("~")
end

namespace :install do
  desc "Install symlinks and vim plugins"
  task :all => [:gitconfig, :vim, :nvim]

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

  desc "Install nvim with lazy.nvim plugin manager"
  task :nvim do
    # Create nvim config directory
    nvim_config_dir = File.join(home, ".config", "nvim")
    FileUtils.mkdir_p nvim_config_dir

    # Symlink nvim config
    nvim_source = File.expand_path("./dotfiles/nvim")
    unless File.exist?(File.join(nvim_config_dir, "init.lua"))
      Dir.glob("#{nvim_source}/*").each do |f|
        target = File.join(nvim_config_dir, File.basename(f))
        unless File.exist?(target)
          File.symlink(f, target)
        end
      end
      puts "✓ nvim config symlinked"
    else
      puts "✓ nvim config already exists"
    end

    puts "\nTo finish installing nvim plugins, run: \n`nvim --headless '+Lazy! sync' +qa`"
    puts "Or open nvim and plugins will auto-install"
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
