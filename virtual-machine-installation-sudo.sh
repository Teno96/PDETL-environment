# Essentials to C++
apt install build-essential --yes
apt install git cmake --yes

# Install FreeCAD 
add-apt-repository ppa:freecad-maintainers/freecad-stable
apt-get update
apt install freecad --yes

# Install Visual Studio Code
wget https://go.microsoft.com/fwlink/?LinkID=760868 --output-document=$HOME/Downloads/code_1.17_amd64.deb
chown $USER:$USER $HOME/Downloads/code_1.17_amd64.deb
dpkg -i $HOME/Downloads/code_1.17_amd64.deb
apt-get install -f

# Install Remarkable
wget --directory-prefix=$HOME/Downloads https://remarkableapp.github.io/files/remarkable_1.87_all.deb
chown $USER:$USER $HOME/Downloads/remarkable_1.87_all.deb
dpkg -i $HOME/Downloads/remarkable_1.87_all.deb
apt-get install -f
