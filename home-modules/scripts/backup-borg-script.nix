{ pkgs, ... }:
{
  home.packages = [
    pkgs.borgbackup
    (pkgs.writeShellScriptBin "backup" "borg create --progress --compression zlib,1 --exclude '**/*@' --exclude '.cache/' --exclude 'Games/'   /run/media/ambrozic/Transcend/backup::home-$(date +%Y%m%d) /home/")
  ];

}
