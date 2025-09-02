{
  importFoldersExcept = lib: path: excludedFolders: let
    directories = lib.filterAttrs (name: type: 
      type == "directory" && !(builtins.elem name excludedFolders)
    ) (builtins.readDir path);
  in map (name: path + "/${name}") (lib.attrNames directories);

  importNixFiles = lib: path: excludedFiles: let
    nixFiles = lib.filterAttrs (name: type:
      type == "regular" && 
      lib.hasSuffix ".nix" name && 
      !(builtins.elem name excludedFiles)
    ) (builtins.readDir path);
  in map (name: path + "/${name}") (lib.attrNames nixFiles);
}
