# Rolling Release Stable Kernel for WSL2

[![Stable Kernel CI](https://img.shields.io/github/actions/workflow/status/Nevuly/WSL2-Linux-Kernel-Rolling/build.yml?label=github%20actions%20build&logo=github-actions&logoColor=%23FFFFFF&style=for-the-badge&labelColor=%23000000)](https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/actions/workflows/build.yml)
[![Release](https://img.shields.io/github/v/release/Nevuly/WSL2-Linux-Kernel-Rolling?display_name=tag&label=LATEST&logo=Linux&logoColor=%23FFFFFF&style=for-the-badge&labelColor=%23000000)](https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/releases/latest)

Maintainer: Yang Jeong Hun (Nevuly)

# Current Kernel Status
| Kernel Version | Status |
|:--------------:|:------:|
| [Linux 6.13.x][wsl2-kernel-6.13] | Stable Support |

# Introduction
The [WSL2-Linux-Kernel-Rolling][wsl2-kernel-rolling] repo contains the latest stable kernel source code and
configuration files for the [WSL2][about-wsl2].

This kernel is automatically built via [Github Actions][gh-actions] CI whenever a [newer stable kernel is released][kernel-stable].

# Install Instructions
## 1. Kernel Image
### 1-1. Manual Installation
1. Download kernel image from [releases page][releases-page].
2. Place it to somewhere appropriate. (e.g. `D:\WSL2\Kernel\bzImage-x86_64`)
3. Save the `.wslconfig` in current user's home directory with following content:

```ini
[wsl2]
kernel=the\\path\\to\\bzImage
; e.g.
; kernel=D:\\WSL2\\Kernel\\bzImage-x86_64
;
; Note that all `\` should be escaped with `\\`.
```

4. Reboot your WSL2 and check kernel version using `uname -a` in WSL2 terminal.

### 1-2. Install via Scoop
**NOTICE**
 * You have to reboot your WSL2 system using `wsl --shutdown` after install or update kernel with using scoop.

[Scoop][scoop-page] is a command-line installer on windows. If you have scoop installed, then you can install this kernel with following commands:

```bash
scoop bucket add frostbite https://github.com/Nevuly/frostbite

scoop install frostbite/wsl2-rolling-kernel-stable
```

Scoop will automatically set kernel in `.wslconfig`.

### 1-3. Update Kernel Image
 * If you installed kernel via scoop, you can use `scoop update *` in Powershell.
 * If you installed kernel manually, download kernel image from [releases page][releases-page], and replace it.

## 2. Kernel Additional Package
**NOTICE**
 * This guide must be proceed in your WSL2 system.
 * Kernel additional package is optional. If you don't need it, just skip this guide.
 * Additional package contains kernel modules, headers and documents.
 * **If you try to use VHDX image, you must use WSL version 2.5.1 or later.**

### 2-1. Install Additional Package in WSL2 Directly
```bash
# Please change latest version of kernel and select your architecture
wget https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/releases/download/linux-wsl-stable-**x.x.x**/bzImage-**arch**-addon_install.tar.gz

tar -xzvf bzImage-**arch**-addon_install.tar.gz

cd bzImage-**arch**-addon_install

sudo ./addon-install.sh
```

After execute installation script, please reboot your WSL2 system to load kernel modules correctly.

### 2-2. Install Additional Package using VHDX Image
1. Download kernel additional package VHDX image from [releases page][releases-page].
2. Place it to somewhere appropriate. (e.g. `D:\WSL2\Kernel\bzImage-x86_64-addon.vhdx`)
3. Save the `.wslconfig` in current user's home directory with following content:

```ini
[wsl2]
kernelModules=the\\path\\to\\bzImage-addon.vhdx
; e.g.
; kernelModules=D:\\WSL2\\Kernel\\bzImage-x86_64-addon.vhdx
;
; Note that all `\` should be escaped with `\\`.
```

# Reporting Bugs
If you discover an issue relating to WSL or the WSL2 kernel, please report it on
the [Issues tab][issue].

# Feature Requests
If you want to fix a bug or add new features, Please use the [Pull Request][pr].

# Build Instructions
Instructions for building WSL2 kernel with an Arch Linux distribution are
as follows:

1. Install the build dependencies (Arch Linux):  
   `$ sudo pacman -S aarch64-linux-gnu-gcc bc bison curl flex gcc git pahole python unzip wget zip`

2. Build the kernel using the WSL2 kernel configuration (x86):  
   `$ make KCONFIG_CONFIG=arch/x86/configs/config-wsl-x86`

3. Build the kernel using the WSL2 kernel configuration (arm64):  
   `$ export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-gnu-`  
   `$ make KCONFIG_CONFIG=arch/arm64/configs/config-wsl-arm64`

4. Save the module to a separate folder (Optional. Only for local build):  
   `$ sudo make modules_install`

# Credits
 * The Linux community who created a awesome kernel.
 * Microsoft which produced WSL2 and dxgkrnl patches.

[wsl2-kernel-6.13]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/tree/wsl-6.13-rolling
[wsl2-kernel-rolling]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling
[about-wsl2]: https://docs.microsoft.com/en-us/windows/wsl/about#what-is-wsl-2
[gh-actions]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/actions
[kernel-stable]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-6.13.y
[issue]: https://github.com/Nevuly/WSL2-Rolling-Kernel-Issue/issues
[pr]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/pulls
[releases-page]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/releases/latest
[scoop-page]: https://scoop.sh/