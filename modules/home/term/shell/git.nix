{
  flake.modules.homeManager.git =
    { ... }:
    {
      programs.git = {
        enable = true;
        ignores = [
          ".#*"
          "node_modules"
          ".direnv"
        ];
        signing.format = null;
        settings = {
          init.defaultBranch = "main";
          user = {
            name = "Saif Al-Din Samy";
            email = "saifowlenzz@gmail.com";
            username = "owlenz";
          };
          url = {
            "git@github.com:" = {
              insteadOf = "https://github.com/";
            };
          };
          core = {
            editor = "vim";
            credential.helper = "store";
          };
        };
      };
    };
}
