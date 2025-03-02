#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This install script must run as root." 1>&2
    exit 1
else
    echo ""
    echo ""
    echo " WSL2 Kernel modules package installer "
    echo " Made by Nevuly "
    echo ""
    echo ""
    echo " Start to install kernel modules package. "

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
    echo " Checking kernel module files... [14 Modules] "
    echo ""
    echo ""

    if [[ $channel == "stable" ]]; then
        if [[ ! -d "lib/modules/$version-WSL2-STABLE+/kernel" ]]; then
            echo ""
            echo ""
            echo " !!-- [1/14] kernel directory Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [1/14] kernel directory OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.alias" ]]; then
            echo ""
            echo ""
            echo " !!-- [2/14] modules.alias Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [2/14] modules.alias OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [3/14] modules.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [3/14] modules.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin" ]]; then
            echo ""
            echo ""
            echo " !!-- [4/14] modules.builtin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [4/14] modules.builtin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [5/14] modules.builtin.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [5/14] modules.builtin.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [6/14] modules.builtin.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [6/14] modules.builtin.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.builtin.modinfo" ]]; then
            echo ""
            echo ""
            echo " !!-- [7/14] modules.builtin.modinfo Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [7/14] modules.builtin.modinfo OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.dep" ]]; then
            echo ""
            echo ""
            echo " !!-- [8/14] modules.dep Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [8/14] modules.dep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.dep.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [9/14] modules.dep.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [9/14] modules.dep.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.devname" ]]; then
            echo ""
            echo ""
            echo " !!-- [10/14] modules.devname Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [10/14] modules.devname OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.order" ]]; then
            echo ""
            echo ""
            echo " !!-- [11/14] modules.order Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [11/14] modules.order OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.softdep" ]]; then
            echo ""
            echo ""
            echo " !!-- [12/14] modules.softdep Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [12/14] modules.softdep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.symbols" ]]; then
            echo ""
            echo ""
            echo " !!-- [13/14] modules.symbols Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [13/14] modules.symbols OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-STABLE+/modules.symbols.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [14/14] modules.symbols.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [14/14] modules.symbols.bin OK. "
        fi
    else
        if [[ ! -d "lib/modules/$version-WSL2-LTS+/kernel" ]]; then
            echo ""
            echo ""
            echo " !!-- [1/14] kernel directory Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [1/14] kernel directory OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.alias" ]]; then
            echo ""
            echo ""
            echo " !!-- [2/14] modules.alias Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [2/14] modules.alias OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [3/14] modules.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [3/14] modules.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin" ]]; then
            echo ""
            echo ""
            echo " !!-- [4/14] modules.builtin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [4/14] modules.builtin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.alias.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [5/14] modules.builtin.alias.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [5/14] modules.builtin.alias.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [6/14] modules.builtin.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [6/14] modules.builtin.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.builtin.modinfo" ]]; then
            echo ""
            echo ""
            echo " !!-- [7/14] modules.builtin.modinfo Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [7/14] modules.builtin.modinfo OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.dep" ]]; then
            echo ""
            echo ""
            echo " !!-- [8/14] modules.dep Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [8/14] modules.dep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.dep.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [9/14] modules.dep.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [9/14] modules.dep.bin OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.devname" ]]; then
            echo ""
            echo ""
            echo " !!-- [10/14] modules.devname Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [10/14] modules.devname OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.order" ]]; then
            echo ""
            echo ""
            echo " !!-- [11/14] modules.order Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [11/14] modules.order OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.softdep" ]]; then
            echo ""
            echo ""
            echo " !!-- [12/14] modules.softdep Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [12/14] modules.softdep OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.symbols" ]]; then
            echo ""
            echo ""
            echo " !!-- [13/14] modules.symbols Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [13/14] modules.symbols OK. "
        fi

        if [[ ! -e "lib/modules/$version-WSL2-LTS+/modules.symbols.bin" ]]; then
            echo ""
            echo ""
            echo " !!-- [14/14] modules.symbols.bin Not Exist! --!! "
            echo " !!-- Abort install kernel modules package --!! "
            echo ""
            echo ""
            exit 1
        else
            echo " [14/14] modules.symbols.bin OK. "
        fi
    fi

    echo ""
    echo ""
    echo " Check kernel modules package directory... "

    if [[ ! -d "/lib/modules" ]]; then
        modules_loc_1=0
    else
        modules_loc_1=1
    fi

    if [[ ! -d "/usr/lib/modules" ]]; then
        modules_loc_2=0
    else
        modules_loc_2=1
    fi

    if [[ $modules_loc_1 == "1" && $modules_loc_2 == "1" ]]; then
        echo ""
        echo ""
        echo " Kernel modules package directory found. "
    else
        if [[ $modules_loc_1 == "0" && $modules_loc_2 == "1" ]]; then
            echo ""
            echo ""
            echo " /lib/modules directory not exists. Make new one "
            sudo mkdir -p /lib/modules
            sudo chown root:root /lib/modules
            sudo chmod 755 /lib/modules
        else
            if [[ $modules_loc_1 == "1" && $modules_loc_2 == "0" ]]; then
                echo ""
                echo ""
                echo " /usr/lib/modules directory not exists. Make new one "
                sudo mkdir -p /usr/lib/modules
                sudo chown root:root /usr/lib/modules
                sudo chmod 755 /usr/lib/modules
            else
                echo ""
                echo ""
                echo " /lib/modules and /usr/lib/modules directory not exists. Make new one "
                sudo mkdir -p /usr/lib/modules
                sudo chown root:root /usr/lib/modules
                sudo chmod 755 /usr/lib/modules
                sudo mkdir -p /usr/lib/modules
                sudo chown root:root /usr/lib/modules
                sudo chmod 755 /usr/lib/modules
            fi
        fi
    fi

    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " /usr/lib/modules directory files: "
    echo ""
    echo ""
    ls -la /usr/lib/modules

    echo ""
    echo ""
    echo " Remove old kernel modules packages... "
    sudo rm -rf /lib/modules/*-WSL2-STABLE+
    sudo rm -rf /lib/modules/*-WSL2-LTS+
    sudo rm -rf /usr/lib/modules/*-WSL2-STABLE+
    sudo rm -rf /usr/lib/modules/*-WSL2-LTS+
    
    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " /usr/lib/modules directory files: "
    echo ""
    echo ""
    ls -la /usr/lib/modules

    echo ""
    echo ""
    echo " Copy new kernel modules package... "
    if [[ $channel == "stable" ]]; then
        sudo cp -r lib/modules/$version-WSL2-STABLE+ /lib/modules/
        sudo cp -r lib/modules/$version-WSL2-STABLE+ /usr/lib/modules/
        sudo chown -R root:root /lib/modules/$version-WSL2-STABLE+
        sudo chown -R root:root /usr/lib/modules/$version-WSL2-STABLE+
    else
        sudo cp -r lib/modules/$version-WSL2-LTS+ /lib/modules/
        sudo cp -r lib/modules/$version-WSL2-LTS+ /usr/lib/modules/
        sudo chown -R root:root /lib/modules/$version-WSL2-LTS+
        sudo chown -R root:root /usr/lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " /lib/modules directory files: "
    echo ""
    echo ""
    ls -la /lib/modules

    echo ""
    echo ""
    echo " /usr/lib/modules directory files: "
    echo ""
    echo ""
    ls -la /usr/lib/modules

    echo ""
    echo ""
    echo " New kernel modules package in /lib/modules: "
    echo ""
    echo ""
    if [[ $channel == "stable" ]]; then
        ls -la /lib/modules/$version-WSL2-STABLE+
    else
        ls -la /lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " New kernel modules package in /usr/lib/modules: "
    echo ""
    echo ""
    if [[ $channel == "stable" ]]; then
        ls -la /usr/lib/modules/$version-WSL2-STABLE+
    else
        ls -la /usr/lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " Done. You must reboot your WSL2 system. "
    echo ""
    echo ""
    exit 0
fi
