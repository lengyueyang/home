{ emacsWithPackages, ... }:
(emacsWithPackages (emacsPackages: with {
  elpa = emacsPackages.elpaPackages;
  melpa = emacsPackages.melpaPackages;
}; with melpa; [
  back-button
  centered-window-mode
  diff-hl
  elixir-mode
  fill-column-indicator
  flycheck
  flycheck-haskell
  ghc
  haskell-mode
  helm
  helm-projectile
  ido-ubiquitous
  js2-mode
  json-mode
  markdown-mode
  magit
  mwim
  neotree
  nix-sandbox
  nix-mode
  elpa.org
  projectile
  python-mode
  scala-mode2
  scss-mode
  tabbar
  transpose-frame
  workgroups2
  ws-butler
  yaml-mode
]))