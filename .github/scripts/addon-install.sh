#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This install script must run as root." 1>&2
    exit 1
else
    echo ""
    echo ""
    echo " WSL2 Kernel additional package installer "
    echo " Made by Nevuly "
    echo ""
    echo ""
    echo " Start to install kernel additional package. "

    echo ""
    echo ""
    echo " Checking kernel version... "

    if [[ ! -e "kernel_version.txt" ]]; then
        echo ""
        echo ""
        echo " !!-- Kernel version not found! --!! "
        echo " !!-- Abort install kernel modules package --!! "
        echo ""
        echo ""
        exit 1
    else
        version=$(<kernel_version.txt)
        echo ""
        echo ""
        echo " Kernel version found. "
        echo " Kernel version: $version "
    fi

    echo ""
    echo ""
    echo " Checking kernel modules package folder and files... "
    if [[ ! -d "lib/modules/$version-WSL2-STABLE+" ]]; then
        if [[ ! -d "lib/modules/$version-WSL2-LTS+" ]]; then
            echo ""
            echo ""
            echo " !!-- Kernel modules package folder not found! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo ""
            echo ""
            echo " LTS kernel detected. "
            channel=lts
        fi
    else
        echo ""
        echo ""
        echo " Stable kernel detected. "
        channel=stable
    fi

    echo ""
    echo ""
    echo " Checking kernel additional package files... [15 Files] "
    echo ""
    echo ""

    if [[ $channel == "stable" ]]; then
        if [[ ! -d "lib/modules/$version-WSL2-STABLE+/kernel" ]]; then
            echo ""
            echo ""
            echo " !!-- [1/15] kernel directory Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [1/15] kernel directory OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.alias" ]]; then
            echo ""
            echo ""
            echo " !!-- [2/15] modules.alias Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [2/15] modules.alias OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [3/15] modules.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [3/15] modules.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin" ]]; then
            echo ""
            echo ""
            echo " !!-- [4/15] modules.builtin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [4/15] modules.builtin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [5/15] modules.builtin.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [5/15] modules.builtin.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [6/15] modules.builtin.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [6/15] modules.builtin.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.modinfo" ]]; then
            echo ""
            echo ""
            echo " !!-- [7/15] modules.builtin.modinfo Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [7/15] modules.builtin.modinfo OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.dep" ]]; then
            echo ""
            echo ""
            echo " !!-- [8/15] modules.dep Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [8/15] modules.dep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.dep.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [9/15] modules.dep.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [9/15] modules.dep.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.devname" ]]; then
            echo ""
            echo ""
            echo " !!-- [10/15] modules.devname Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [10/15] modules.devname OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.order" ]]; then
            echo ""
            echo ""
            echo " !!-- [11/15] modules.order Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [11/15] modules.order OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.softdep" ]]; then
            echo ""
            echo ""
            echo " !!-- [12/15] modules.softdep Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [12/15] modules.softdep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.symbols" ]]; then
            echo ""
            echo ""
            echo " !!-- [13/15] modules.symbols Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [13/15] modules.symbols OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.symbols.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [14/15] modules.symbols.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [14/15] modules.symbols.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/build/Module.symvers" ]]; then
            echo ""
            echo ""
            echo " !!-- [15/15] Module.symvers Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [15/15] modules.symbols.bin OK. "
        fi
    else
        if [[ ! -d "lib/modules/$version-WSL2-LTS+/kernel" ]]; then
            echo ""
            echo ""
            echo " !!-- [1/15] kernel directory Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [1/15] kernel directory OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.alias" ]]; then
            echo ""
            echo ""
            echo " !!-- [2/15] modules.alias Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [2/15] modules.alias OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [3/15] modules.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [3/15] modules.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin" ]]; then
            echo ""
            echo ""
            echo " !!-- [4/15] modules.builtin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [4/15] modules.builtin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [5/15] modules.builtin.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [5/15] modules.builtin.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [6/15] modules.builtin.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [6/15] modules.builtin.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.modinfo" ]]; then
            echo ""
            echo ""
            echo " !!-- [7/15] modules.builtin.modinfo Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [7/15] modules.builtin.modinfo OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.dep" ]]; then
            echo ""
            echo ""
            echo " !!-- [8/15] modules.dep Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [8/15] modules.dep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.dep.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [9/15] modules.dep.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [9/15] modules.dep.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.devname" ]]; then
            echo ""
            echo ""
            echo " !!-- [10/15] modules.devname Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [10/15] modules.devname OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.order" ]]; then
            echo ""
            echo ""
            echo " !!-- [11/15] modules.order Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [11/15] modules.order OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.softdep" ]]; then
            echo ""
            echo ""
            echo " !!-- [12/15] modules.softdep Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [12/15] modules.softdep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.symbols" ]]; then
            echo ""
            echo ""
            echo " !!-- [13/15] modules.symbols Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [13/15] modules.symbols OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.symbols.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [14/15] modules.symbols.bin Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [14/15] modules.symbols.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/build/Module.symvers" ]]; then
            echo ""
            echo ""
            echo " !!-- [15/15] Module.symvers Not Exist! --!! "
            echo " !!-- Abort install kernel additional package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [15/15] modules.symbols.bin OK. "
        fi
    fi

    echo ""
    echo ""
    echo " Check kernel additional package directory... "

    if [[ ! -d "/lib/modules" ]]; then
        modules_loc=0
    else
        modules_loc=1
    fi

    if [[ $modules_loc == "1" ]]; then
        echo ""
        echo ""
        echo " Kernel additional package directory found. "
    else
        echo ""
        echo ""
        echo " /lib/modules directory not exists. Make new one "
        sudo mkdir -p /lib/modules
        sudo chown root:root /lib/modules
        sudo chmod 755 /lib/modules
    fi

    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " Remove old kernel additional packages... "
    sudo rm -rf /lib/modules/*-WSL2-STABLE+
    sudo rm -rf /lib/modules/*-WSL2-LTS+
    
    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " Copy new kernel additional package... "
    if [[ $channel == "stable" ]]; then
        sudo cp -r lib/modules/$version-WSL2-STABLE+ /lib/modules/
        sudo chown -R root:root /lib/modules/$version-WSL2-STABLE+
    else
        sudo cp -r lib/modules/$version-WSL2-LTS+ /lib/modules/
        sudo chown -R root:root /lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " New kernel additional package in /lib/modules: "
    echo ""
    echo ""
    if [[ $channel == "stable" ]]; then
        ls -la /lib/modules/$version-WSL2-STABLE+
    else
        ls -la /lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " Done. You must reboot your WSL2 system. "
    echo ""
    echo ""
    exit 0
fi
