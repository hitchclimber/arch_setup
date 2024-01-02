# Partitioning and Filesystems

Partition as usual (root + boot). For dual boot, there should be three Windows partitions, in the remaining space create two new partitions, boot (512M) and root (rest of space).

## Boot

```bash
mkfs.fat -F32 /dev/<device>
```

### Root

After partitioning, encrypt the partition, then create the filesystem.

```bash
cryptsetup luksFormat /dev/<device>
cryptsetup open /dev/<device> cryptroot
mkfs.btfs /dev/mapper/cryptroot
```

## Mounting

```bash
mount /dev/mapper/cryptroot /mnt
cd /mnt
btrfs subvolume create @   # Create root subvolume
btrfs subvolume create @home   # Create home subvolume
cd
umount /mnt
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@ /dev/mapper/cryptroot /mnt
mkdir /mnt/home
mount -o noatime,compress=zstd,space_cache,discard=async,subvol=@home /dev/mapper/cryptroot /mnt/home
mkdir -p /mnt/boot/efi
mount /dev/<boot partition> /mnt/boot
mount /dev/<windows efi> /mnt/boot/efi 
```

## Pacstrap

```bash
pacstrap /mnt base base-devel linux linux-firmware nvim btrfs-progs git intel-ucode reflector sudo grub efibootmgr networkmanager yay   # verify it's intel
```

## Fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```
## chroot
    
```bash
arch-chroot /mnt
git clone <setup repo>
```
## mkinitcpio

Add 'btrfs' to `MODULES` in `/etc/mkinitcpio.conf`.
Add `encrypt` and `btrfs` to `HOOKS` in `/etc/mkinitcpio.conf`, then run `mkinitcpio -P`. Make sure 'encrypt' is before 'filesystem' in the list and move 'keyboard' after 'autodetect'.

Now we can run `mkinicpio -p linux`. Missing firmware modules can be installed via yay (mkinicpio-firmware) and pacman, then rerun the command.

## GRUB

Find UUIDs of root and EFI partitions (using `blkid`) and add them to `/etc/default/grub`:

```bash
GRUB_CMDLINE_LINUX="cryptdevice=UUID=<root UUID>:cryptroot root=/dev/mapper/cryptroot"
```

Put `40_custom` in `/etc/grub.d/` and make it executable.
Then install and configure GRUB as per usual.

## Pacman hooks

Move the hooks file from repo to `/etc/pacman.d/hooks/` and make it executable.

## Time synchronization

Configure `/etc/systemd/timesyncd.conf` and enable the service. Might be necessary to run `timedatectl set-ntp true` as well.

## User profile


`.profile` -> `.zprofile` -> `.xinitrc`

`.profile` sets the login shell (zsh) and sources `.zprofile` which executes `startx` which reads settings from `.xinitrc`.

- add oh-my-zsh and fast-syntax-highlighting to `.zshrc`
- get polybar settings from [here](https://gitlab.com/stephan-raabe/dotfiles)

## DWM

### Patches

- alwayscenter
- fibonacci
- fullscreen
- movestack
- vanitygaps
- activetagindicator
- status2d
- shift tools
- systray
- alpha
- status2d -> check out [](https://github.com/sipi/dwmstatus)
- splitstatus

### st

- scrollback
- alpha
- boxdraw
- clipboard
- font2
- ligatures
- wide glyphs
- xresources

## install fonts and missing scripts

- nerd fonts
- scripts in `~/.local/bin/`





