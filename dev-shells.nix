{ pkgs }:
{
  # https://bun.sh/
  bun = pkgs.mkShell {
    name = "bun";
    packages = with pkgs; [ bun ];
  };
}
