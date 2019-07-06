if [ -d "/home/linuxbrew/.linuxbrew" ]
  set -g linuxbrew_base_path "/home/linuxbrew/.linuxbrew"
else if [ -d "$HOME/.linuxbrew" ]
  set -g linuxbrew_base_path "$HOME/.linuxbrew"
end

if set -q linuxbrew_base_path
  set -l linuxbrew_bin_path "$linuxbrew_base_path/bin"
  set -l linuxbrew_sbin_path "$linuxbrew_base_path/sbin"
  set -l linuxbrew_manpath "$linuxbrew_base_path/share/man"
  set -l linuxbrew_infopath "$linuxbrew_base_path/share/info"
  
  contains -- $linuxbrew_bin_path $PATH
    or set -gx PATH $linuxbrew_bin_path $PATH
  
  contains -- $linuxbrew_sbin_path $PATH
    or set -gx PATH $linuxbrew_sbin_path $PATH
  
  contains -- $linuxbrew_manpath $MANPATH
    or set -gx MANPATH $linuxbrew_manpath $MANPATH
  
  contains -- $linuxbrew_infopath $INFOPATH
    or set -gx INFOPATH $linuxbrew_infopath $INFOPATH
end

set -e linuxbrew_base_path
