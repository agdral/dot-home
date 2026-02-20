{
  lib,
  import-tree,
  ...
}: {
  imports = [
    (import-tree.filter (path: lib.hasSuffix "default.nix" path) ./.)
  ];
}
