{
  inputs = {
    garnix-lib.url = "github:garnix-io/garnix-lib?ref=ed90ee8a52715b5e0e35b304b21dc64f4ceb30a5";
    Haskell.url = "github:garnix-io/haskell-module?ref=aa07899f92fddcb722f0c9c16c38d72723f6aba0";
  };

  outputs = inputs: inputs.garnix-lib.lib.mkModules {
    modules = [
      inputs.Haskell.garnixModules.default
    ];

    config = { pkgs, ... }: {
      haskell = {
        haskell-project = {
          buildDependencies = [  ];
          devTools = [  ];
          ghcVersion = "9.8";
          runtimeDependencies = [  ];
          src = ./.;
          webServer = null;
        };
      };

      garnix.deployBranch = "master";
    };
  };
}
