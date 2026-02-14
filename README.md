
# 1.0: Introduction

Welcome to **omarchy-installers**. This package is composed of two programs: `pacfetch` and `aurfetch`. These programs are ports of the TUI wrappers Omarchy uses for package installation, but now for every other Arch-based distribution.

*   **pacfetch:** Fetches packages from the official Arch repositories.
*   **aurfetch:** Fetches packages from the Arch User Repository (AUR).

# 1.1: Installation

### Automatic installation (From the AUR):

~~~bash
yay -S omarchy-installers
# OR
paru -S omarchy-installers
~~~

### Manual installation

Clone the repository, change your working directory to it, and run makepkg -si.

~~~bash
git clone https://aur.archlinux.org/packages/omarchy-installers
cd omarchy-installers
makepkg -si
~~~

