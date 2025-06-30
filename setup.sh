# !/bin/bash
#
#
#
#
#
#██████████         █████            █████                                     ████                           █████
#░░███░░░░███       ░░███            ░░███                                     ░░███                          ░░███
# ░███   ░░███       ░███             ░███████   █████ ████ ████████  ████████  ░███   ██████   ████████    ███████
# ░███    ░███       ░███  ██████████ ░███░░███ ░░███ ░███ ░░███░░███░░███░░███ ░███  ░░░░░███ ░░███░░███  ███░░███
# ░███    ░███       ░███ ░░░░░░░░░░  ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░░░  ░███   ███████  ░███ ░███ ░███ ░███
# ░███    ███  ███   ░███             ░███ ░███  ░███ ░███  ░███ ░███ ░███      ░███  ███░░███  ░███ ░███ ░███ ░███
# ██████████  ░░████████              ████ █████ ░░███████  ░███████  █████     █████░░████████ ████ █████░░████████
#░░░░░░░░░░    ░░░░░░░░              ░░░░ ░░░░░   ░░░░░███  ░███░░░  ░░░░░     ░░░░░  ░░░░░░░░ ░░░░ ░░░░░  ░░░░░░░░
#                                                 ███ ░███  ░███
#                                                ░░██████   █████
#                                                 ░░░░░░   ░░░░░
#
#
# DJ-hyprland by djstillxyz - https://github.com/djstillxyz
#----------------------------------------------------------------------------------

base_packages=(
    qt5-wayland
    qt5ct
    qt6-wayland
    qt6ct
    qt5-svg
    qt5-quickcontrols2
    qt5-graphicaleffects
    gtk3
    jq
    wl-clipboard
    cliphist
    python-requests
    pacman-contrib
    xdg-desktop-portal-hyprland
)

main_packages=(
    mpv                        # video player
    kitty                      # terminal emulator
    waybar                     # taskbar (but for wayland)
    hyprpaper                  # wallpaper manager
    swaylock-effects           # screenlock program
    wlogout                    # logout program
    gvfs
    brightnessctl              # program to adjust screen brightness
    grim                       # wayland screenshot utility
    slurp                      # screen capture program (used alongside grim)
    yazi                       # TUI file manager
    btop                       # system monitoring
    pulsemixer                 # volume mixer
    ttf-jetbrains-mono-nerd    # emojis and fonts
    fish                       # shell
    swaync                     # notification center / manager
    swaync-widgets-git         # extension for swaync
    xorg-xrandr                # dependency for finding screen size
    pamixer                    # dependency for clicking on waybar tools
    comic-mono                 # font used for swaylock
    noto-fonts-emoji           # emoji font
    file-roller                # archive manager
    aspell-en                  # english dictionary (spell checking in emacs)
    basedpyright               # lsp for emacs (better fork of pyright)
    calcurse                   # calendar
    rofi-wayland               # dynamic window manager
    toipe                      # typeracer in terminal
    wf-recorder                # lightweight screen-recorder
    impala                     # minimal wifi interface
    hyprpicker                 # color picker
    vim                        # text editor
)


for str in ${myArray[@]}; do
  echo $str
done


NOTE="[\e[1;38;5;142mNOTE\e[0m]"        # Gruvbox light greenish (8ec07c)
OK="[\e[1;38;5;114mOK\e[0m]"          # Gruvbox yellow-green (b8bb26)
ERROR="[\e[1;38;5;168mERROR\e[0m]"       # Gruvbox red (fb4934)
ATTENTION="[\e[1;38;5;249mATTENTION\e[0m]"   # Gruvbox light beige (d5c4a1)
WARNING="[\e[1;38;5;174mWARNING\e[0m]"     # Gruvbox magenta (d3869b)
ACTION="[\e[1;38;5;214mACTION\e[0m]"      # Gruvbox yellow (fabd2f)
INSTLOG="install.log"


# Progress Bar
show_progress() {
    local pid=$1
    local spin='|/-\'
    local i=0
    while ps | grep $pid &> /dev/null; do
        printf "\r${spin:i%4:1}"
        i=$((i+1))
        sleep 0.2
    done
    echo -e "\rDone!"
}


# function that will test for a package and if not found it will attempt to install it
install_software() {
    # First lets see if the package is there
    if paru -Q $1 &>> /dev/null ; then
        echo -e "$OK - $1 is already installed."
    else
        # no package found so installing
        echo -en "$NOTE - Now installing $1 ."
        paru -S --noconfirm $1 &>> $INSTLOG &
        show_progress $!
        # test to make sure package installed
        if paru -Q $1 &>> /dev/null ; then
            echo -e "\e[1A\e[K$OK - $1 was installed."
        else
            # if this is hit then a package is missing, exit to review log
            echo -e "\e[1A\e[K$ERROR - $1 install had failed, please check the install.log"
            exit
        fi
    fi
}

# clear the screen
clear

echo "
██████████         █████            █████                                     ████                           █████
░░███░░░░███       ░░███            ░░███                                     ░░███                          ░░███
 ░███   ░░███       ░███             ░███████   █████ ████ ████████  ████████  ░███   ██████   ████████    ███████
 ░███    ░███       ░███  ██████████ ░███░░███ ░░███ ░███ ░░███░░███░░███░░███ ░███  ░░░░░███ ░░███░░███  ███░░███
 ░███    ░███       ░███ ░░░░░░░░░░  ░███ ░███  ░███ ░███  ░███ ░███ ░███ ░░░  ░███   ███████  ░███ ░███ ░███ ░███
 ░███    ███  ███   ░███             ░███ ░███  ░███ ░███  ░███ ░███ ░███      ░███  ███░░███  ░███ ░███ ░███ ░███
 ██████████  ░░████████              ████ █████ ░░███████  ░███████  █████     █████░░████████ ████ █████░░████████
░░░░░░░░░░    ░░░░░░░░              ░░░░ ░░░░░   ░░░░░███  ░███░░░  ░░░░░     ░░░░░  ░░░░░░░░ ░░░░ ░░░░░  ░░░░░░░░
                                                 ███ ░███  ░███
                                                ░░██████   █████
                                                 ░░░░░░   ░░░░░
"

# create directories
cd ~ && mkdir git && cd git && mkdir public private

# install paru
if [ ! -f /sbin/paru ]; then
    echo -e "$NOTE - Configuring paru (This may take a while...)"
    cd ~/git/public
    git clone https://aur.archlinux.org/paru.git &>> "$INSTLOG"
    cd paru
    makepkg -si --noconfirm &>> "../$INSTLOG" &
    show_progress $!

    if [ -f /sbin/paru ]; then
        echo -e "$OK - paru configured"
        cd ..
        echo -e "$NOTE - Updating paru."
        paru -Suy --noconfirm &>> "$INSTLOG" &
        show_progress $!
        echo -e "$OK - paru updated."
    else
        echo -e "$ERROR - paru install failed, please check the install.log"
        exit 1
    fi
fi

### Install all of the above pacakges ####
for PACKAGE in ${base_packages[@]}; do
    install_software $PACKAGE
done

# Install Hyprland
install_software hyprland

# Stage 1 - main components
for PACKAGE in ${main_packages[@]}; do
    install_software $PACKAGE
done

# Clean out conflicting xdg portals
paru -R --noconfirm xdg-desktop-portal-gnome xdg-desktop-portal-gtk &>> $INSTLOG

### Copy Config Files ###
mkdir -p ~/.dotfiles && cd ~/.config/DJ-hyprland/dotfiles && cp -r * ~/.dotfiles
chmod +x --noconfirm ~/.config/DJ-hyprland/scripts/symlink.sh && sh ~/.config/DJ-hyprland/scripts/symlink.sh && echo "dotfiles linked!"
gsettings set org.gnome.desktop.interface gtk-theme "Everforest-Light"
gsettings set org.gnome.desktop.interface icon-theme "Zafiro-Nord-Dark-Grey"

#--------------------------------------------------------------------------------------------------#

# Miniconda3
##############################################################
mkdir -p ~/git/public/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/git/public/miniconda3/miniconda.sh
bash ~/git/public/miniconda3/miniconda.sh -b -u -p ~/git/public/miniconda3
rm ~/git/public/miniconda3/miniconda.sh

sh ~/git/public/miniconda3/bin/conda init --all

sh source ~/.dotfiles/fish/config.fish
###############################################################

# Emacs
###############################################################
cd ~/git/public

# emacs core dependencies
sudo pacman -S cmake gd libotf m17n-lib tree-sitter libgccjit

# other dependencies, can maybe be lumped in with above
sudo pacman -S libgccjit libgccjit-devel gtk3 gtk3-devel gtk4 gtk4-devel libtree-sitter libtree-sitter-devel \
     jansson-devel libvterm-devel webkit2gtk5.0-devel gnutls-devel

# dependencies for pdf-tools
sudo pacman -S poppler poppler-glib

git clone --single-branch --branch=emacs-30 git://git.sv.gnu.org/emacs.git emacs-30

cd emacs-30/

sh autogen.sh

./configure --without-compress-install \
            --with-pgtk \
            --without-libotf \
            --with-x-toolkit=no \
            --with-cairo \
            --with-native-compilation=aot \
            --with-tree-sitter \
            --with-mailutils \
            --with-rsvg \
            CFLAGS="-O2 -mtune=native -march=native -fomit-frame-pointer" \
            --prefix=/usr/local

make -j16

make check

sudo make install
###############################################################

# Doom Emacs
###############################################################
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
sudo rm -r ~/.emacs.d
doom sync
###############################################################

# Uninstall dolphin and related packages
sudo pacman -Rns --noconfirm dolphin wofi nano htop dunst

# Finishing touches
sh ~/.config/DJ-hyprland/scripts/symlink.sh

# Configure screen size and wallpaper
sh ~/.config/DJ-hyprland/scripts/monitor.sh

sh ~/.config/DJ-hyprland/scripts/timezone.sh

### Script is done ###
echo -e "$NOTE - Script had completed, reboot your system now!"

echo -e "$ATTENTION - Reboot your system now!"
