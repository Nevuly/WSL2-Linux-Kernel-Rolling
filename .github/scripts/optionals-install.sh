#!/bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "This install script must run as root." 1>&2
    exit 1
else
    echo ""
    echo ""
    echo " WSL2 Kernel optionals package (header, docs) installer "
    echo " Made by Nevuly "
    echo ""
    echo ""
    echo " Start to install kernel optionals package. "

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
    echo " Checking kernel modules and optionals package folder and files... "
    if [[ ! -d "/lib/modules/$version-WSL2-STABLE+" ]]; then
        if [[ ! -d "/lib/modules/$version-WSL2-LTS+" ]]; then
            echo ""
            echo ""
            echo " !!-- Kernel modules package folder not found! --!! "
            echo " !!-- Abort install kernel optionals package --!! "
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

    if [[ ! -e "build/Module.symvers" ]]; then
        file_checker=0
    else
        file_checker=1
    fi

    if [[ $file_checker == "1" ]]; then
        echo ""
        echo ""
        echo " Kernel optionals package files found. "
    else
        echo ""
        echo ""
        echo " !!-- Some kernel optionals package files not found! --!! "
        echo " !!-- Abort install kernel optionals package --!! "
        echo ""
        echo ""
        exit 1
    fi

    echo ""
    echo ""
    echo " Check kernel optionals package install directory... "

    if [[ $channel == "stable" ]]; then
        if [[ ! -d "/lib/modules/$version-WSL2-STABLE+/build" ]]; then
            optionals_loc_1=0
        else
            optionals_loc_1=1
        fi

        if [[ ! -d "/usr/lib/modules/$version-WSL2-STABLE+/build" ]]; then
            optionals_loc_2=0
        else
            optionals_loc_2=1
        fi

        if [[ $optionals_loc_1 == "0" && $optionals_loc_2 == "0" ]]; then
            echo ""
            echo ""
            echo " Kernel optionals package install directory not found. "
            echo " Ready to install it. "
        else
            if [[ $optionals_loc_1 == "0" && $optionals_loc_2 == "1" ]]; then
                echo ""
                echo ""
                echo " /usr/lib/modules/$version-WSL2-STABLE+/build directory already exists. Remove it. "
                sudo rm -rf /usr/lib/modules/$version-WSL2-STABLE+/build
            else
                if [[ $optionals_loc_1 == "1" && $optionals_loc_2 == "0" ]]; then
                    echo ""
                    echo ""
                    echo " /lib/modules/$version-WSL2-STABLE+/build directory already exists. Remove it. "
                    sudo rm -rf /lib/modules/$version-WSL2-STABLE+/build
                else
                    echo ""
                    echo ""
                    echo " /lib/modules/$version-WSL2-STABLE+/build and /usr/lib/modules/$version-WSL2-STABLE+/build directory already exists. Remove it. "
                    sudo rm -rf /usr/lib/modules/$version-WSL2-STABLE+/build
                    sudo rm -rf /lib/modules/$version-WSL2-STABLE+/build
                fi
            fi
        fi
    else
        if [[ ! -d "/lib/modules/$version-WSL2-LTS+/build" ]]; then
            optionals_loc_1=0
        else
            optionals_loc_1=1
        fi

        if [[ ! -d "/usr/lib/modules/$version-WSL2-LTS+/build" ]]; then
            optionals_loc_2=0
        else
            optionals_loc_2=1
        fi

        if [[ $optionals_loc_1 == "0" && $optionals_loc_2 == "0" ]]; then
            echo ""
            echo ""
            echo " Kernel optionals package install directory not found. "
            echo " Ready to install it. "
        else
            if [[ $optionals_loc_1 == "0" && $optionals_loc_2 == "1" ]]; then
                echo ""
                echo ""
                echo " /usr/lib/modules/$version-WSL2-LTS+/build directory already exists. Remove it. "
                sudo rm -rf /usr/lib/modules/$version-WSL2-LTS+/build
            else
                if [[ $optionals_loc_1 == "1" && $optionals_loc_2 == "0" ]]; then
                    echo ""
                    echo ""
                    echo " /lib/modules/$version-WSL2-LTS+/build directory already exists. Remove it. "
                    sudo rm -rf /lib/modules/$version-WSL2-LTS+/build
                else
                    echo ""
                    echo ""
                    echo " /lib/modules/$version-WSL2-LTS+/build and /usr/lib/modules/$version-WSL2-LTS+/build directory already exists. Remove it. "
                    sudo rm -rf /usr/lib/modules/$version-WSL2-LTS+/build
                    sudo rm -rf /lib/modules/$version-WSL2-LTS+/build
                fi
            fi
        fi
    fi

    if [[ $channel == "stable" ]]; then
        echo ""
        echo ""
        echo " /lib/modules/$version-WSL2-STABLE+ directory files: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-STABLE+

        echo ""
        echo ""
        echo " /usr/lib/modules/$version-WSL2-STABLE+ directory files: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-STABLE+
    else
        echo ""
        echo ""
        echo " /lib/modules/$version-WSL2-LTS+ directory files: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-LTS+

        echo ""
        echo ""
        echo " /usr/lib/modules/$version-WSL2-LTS+ directory files: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-LTS+
    fi

    echo ""
    echo ""
    echo " Copy new kernel optionals package... "
    if [[ $channel == "stable" ]]; then
        sudo cp -r build /lib/modules/$version-WSL2-STABLE+/
        sudo cp -r build /usr/lib/modules/$version-WSL2-STABLE+/
        sudo chown -R root:root /lib/modules/$version-WSL2-STABLE+/build
        sudo chown -R root:root /usr/lib/modules/$version-WSL2-STABLE+/build
    else
        sudo cp -r build /lib/modules/$version-WSL2-LTS+
        sudo cp -r build /usr/lib/modules/$version-WSL2-LTS+
        sudo chown -R root:root /lib/modules/$version-WSL2-LTS+/build
        sudo chown -R root:root /usr/lib/modules/$version-WSL2-LTS+/build
    fi

    if [[ $channel == "stable" ]]; then
        echo ""
        echo ""
        echo " /lib/modules/$version-WSL2-STABLE+ directory files: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-STABLE+

        echo ""
        echo ""
        echo " /usr/lib/modules/$version-WSL2-STABLE+ directory files: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-STABLE+
    else
        echo ""
        echo ""
        echo " /lib/modules/$version-WSL2-LTS+ directory files: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-LTS+

        echo ""
        echo ""
        echo " /usr/lib/modules/$version-WSL2-LTS+ directory files: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-LTS+
    fi

    if [[ $channel == "stable" ]]; then
        echo ""
        echo ""
        echo " New kernel optionals package in /lib/modules/$version-WSL2-STABLE+: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-STABLE+/build

        echo ""
        echo ""
        echo " New kernel optionals package in /usr/lib/modules/$version-WSL2-STABLE+: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-STABLE+/build
    else
        echo ""
        echo ""
        echo " New kernel optionals package in /lib/modules/$version-WSL2-LTS+: "
        echo ""
        echo ""
        ls -la /lib/modules/$version-WSL2-LTS+/build

        echo ""
        echo ""
        echo " New kernel optionals package in /usr/lib/modules/$version-WSL2-LTS+: "
        echo ""
        echo ""
        ls -la /usr/lib/modules/$version-WSL2-LTS+/build
    fi

    echo ""
    echo ""
    echo " Done. You must reboot your WSL2 system. "
    echo ""
    echo ""
    exit 0
fi
