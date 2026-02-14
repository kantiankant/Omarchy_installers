#!/bin/bash
# Fuzzy-finder for installing packages from pacman repos (including CachyOS repos)
# Actually automatic this time, promise

fzf_args=(
  --multi
  --preview 'pacman -Si {1} 2>/dev/null'
  --preview-label='alt-p: toggle preview, alt-j/k: scroll, tab: multi-select'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --color 'pointer:green,marker:green'
  --header 'Package Installer - Select with Tab, Enter to install'
  --prompt 'Package: '
)

echo "Fetching package list from all repositories (including CachyOS)..."
pkg_names=$(pacman -Slq | fzf "${fzf_args[@]}")

if [[ -n "$pkg_names" ]]; then
  echo ""
  echo "Selected packages:"
  echo "$pkg_names"
  echo ""

  # Install with --noconfirm like the original, because apparently that was important
  echo "$pkg_names" | tr '\n' ' ' | xargs sudo pacman -S --noconfirm

  # Update locate database in the background
  if command -v updatedb &>/dev/null; then
    echo ""
    echo "Updating locate database in background..."
    sudo updatedb &
  fi

  echo ""
  echo "✓ Installation complete!"
  echo ""
else
  echo "No packages selected."
fi
