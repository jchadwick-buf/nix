{
  config = {
    home-manager = {
      users.john = import ./home.nix;
    };
    users.users.john.home = "/Users/john";
  };
}
