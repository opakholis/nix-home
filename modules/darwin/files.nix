{ user, config }:

let
  xdg_config = "${config.users.users.${user}.home}/.config";
in
{
  "${xdg_config}/ytfzf/conf.sh" = {
    text = ''
      show_thumbnails=0
      thumbnail_quality=medium
      fzf_preview_side=up
    '';
  };
}
