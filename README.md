# Rolling Release Stable Kernel for WSL2

[![Stable Kernel CI](https://img.shields.io/github/actions/workflow/status/Nevuly/WSL2-Linux-Kernel-Rolling/build.yml?label=github%20actions%20build&logo=github-actions&logoColor=%23FFFFFF&style=for-the-badge&labelColor=%23000000)](https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/actions/workflows/build.yml)
[![Release](https://img.shields.io/github/v/release/Nevuly/WSL2-Linux-Kernel-Rolling?display_name=tag&label=LATEST&logo=Linux&logoColor=%23FFFFFF&style=for-the-badge&labelColor=%23000000)](https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/releases/latest)

Maintainer: Yang Jeong Hun (Nevuly)

## Current Kernel Status

| Kernel Version | Status |
|:--------------:|:------:|
| [Linux 6.6.x][wsl2-kernel-6.6] | Support |

## Introduction

The [WSL2-Linux-Kernel-Rolling][wsl2-kernel-rolling] repo contains the latest stable kernel source code and
configuration files for the [WSL2][about-wsl2].

This kernel is automatically built via [Github Actions][gh-actions] CI whenever a [newer stable kernel is released][kernel-stable].

## Reporting Bugs

If you discover an issue relating to WSL or the WSL2 kernel, please report it on
the [Issues tab][issue].

## Feature Requests

If you want to fix a bug or add new features, Please use the [Pull Request][pr].

## Build Instructions

Instructions for building an x86_64 WSL2 kernel with an Arch Linux distribution are
as follows:

1. Install the build dependencies (Arch Linux):  
   `$ sudo pacman -S aarch64-linux-gnu-gcc bc bison curl flex gcc git pahole python unzip wget zip`

2. Build the kernel using the WSL2 kernel configuration (x86):  
   `$ make KCONFIG_CONFIG=arch/x86/config/config-wsl-x86`

3. Build the kernel using the WSL2 kernel configuration (arm64):  
   `$ export ARCH=arm64 && export CROSS_COMPILE=aarch64-linux-gnu-`  
   `$ make KCONFIG_CONFIG=arch/arm64/config/config-wsl-arm64`

4. Save the module to a separate folder:  
   `$ mkdir -p modules_install && make modules_install INSTALL_MOD_PATH=modules_install`

## Install Instructions

Please see the documentation on the [.wslconfig configuration
file][install-inst] for information on using a custom built kernel.

[wsl2-kernel-6.6]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/tree/wsl-6.6-rolling
[wsl2-kernel-rolling]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling
[about-wsl2]: https://docs.microsoft.com/en-us/windows/wsl/about#what-is-wsl-2
[gh-actions]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/actions
[kernel-stable]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/?h=linux-6.6.y
[issue]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/issues
[pr]: https://github.com/Nevuly/WSL2-Linux-Kernel-Rolling/pulls
[install-inst]: https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig
