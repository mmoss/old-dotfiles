require 'fileutils'
require 'rake'
require 'erb'

desc "Install all dot files and dependencies"
task install: %i(osx brew gitconfig misc zsh vim)

desc "Install OSX cusotmizations"
task :osx do
  Dir['osx/*'].each do |f|
    `./#{f}`
  end
end

desc "Install or update homebrew & packages"
task :brew do
  if executable_in_path? 'brew'
    msg "Updating existing homebrew installation"
    puts `brew update && brew upgrade`
  else
    msg "Installing homebrew"
    eval `curl -fsSL https://raw.github.com/mxcl/homebrew/go`
    puts `brew doctor`
    brew_packages = %w(git rbenv rbenv-gem-rehash ruby-build tmux vim zsh)
    puts `brew install #{brew_packages.join ' '}`
  end
end

desc "Install ZSH"
task zsh: :brew do
  msg "Installing zsh configuration"
  install_dotfiles 'zsh*'
  puts `chsh -s /bin/zsh`
end

desc "Install SSH config for use (for multiple ssh hosts)"
task :ssh do
  msg "Installing ssh config with multi-host support"
  mkdir_p "#{ENV['HOME']}/.ssh"
  install_file 'ssh/config.erb'
end

desc "Install miscellanious stuffs"
task :gitconfig do
  %w(gitconfig.erb).each do |f|
    msg "Installing #{f}"
    install_dotfiles f
  end
end

desc "Install miscellanious stuffs"
task :misc do
  %w(inputrc Xresources).each do |f|
    msg "Installing #{f}"
    install_dotfiles f
  end
end

desc "Install vim"
task :vim do
  msg "Installing vim configuration"
  mkdir_p "#{ENV['HOME']}/.vim/bundle"
  install_dotfiles 'vim/*.vim'
  install_dotfiles 'vimrc'
  rm_rf "#{ENV['HOME']}/.vim/bundle/vundle"
  sh "git clone https://github.com/gmarik/vundle.git #{ENV['HOME']}/.vim/bundle/vundle"
  sh "vim +BundleClean +qall"
  sh "vim +BundleInstall +qall"
end

def msg(m)
  puts ""
  puts "+++ #{m}"
end

def install_dotfiles(dir_pattern)
  replace_all = false
  Dir[dir_pattern].each do |file|
    if File.exist? File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "Found identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file file
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp  
        when 'a'
          replace_all = true
          replace_file file
        when 'y'
          replace_file file
        when 'q'
          exit
        else
          puts "Skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      install_file file
    end
  end
end

def install_file(file)
  if file =~ /\.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    ln_s "#{File.dirname(__FILE__)}/#{file}", "#{ENV['HOME']}/.#{file}"
  end
end

def replace_file(file)
  rm_rf "#{ENV['HOME']}/.#{file.sub('.erb', '')}"
  install_file file
end

def executable_in_path?(executable_name)
  path = ENV['PATH'].
    split(':').collect { |d| Dir.entries d if Dir.exists? d }.flatten
  path.include? executable_name
end