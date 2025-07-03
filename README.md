Logitech K380 udev Rules Installer

This repository provides simple install and uninstall scripts to manage a udev rule for the Logitech K380 keyboard on Linux systems. This allows for custom configurations to be applied automatically when the device is connected.
What it Does

The scripts in this repository automate the process of:

    Creating a symbolic link from the 70-logi-k380.rules file in this repository to the system's udev rules directory (/etc/udev/rules.d/).

    Reloading the udev rules so the system recognizes the changes.

    Removing the symbolic link and reloading the rules when you want to uninstall.

This makes it easy to apply and manage custom behavior for the Logitech K380 keyboard without manually copying files into system directories.
The Udev Rule

The included 70-logi-k380.rules file is configured to:

[--- IMPORTANT ---]

    Describe what your rule does here.

    Example 1: "Make the function keys (F1-F12) behave as standard function keys by default, without needing to press the 'Fn' key."

    Example 2: "Remap the 'Insert' key (F12) to a 'Super' key."
    [-----------------]

You can edit the 70-logi-k380.rules file to change its behavior before running the install script.
Prerequisites

    A Linux system using udev.

    sudo or root access to run the scripts.

    The Logitech K380 keyboard.

Installation & Usage

Follow these steps to install and use the scripts.
1. Clone the Repository

First, clone this repository to your local machine:

git clone [https://github.com/YOUR_USERNAME/logi-k380-udev-rules.git](https://github.com/YOUR_USERNAME/logi-k380-udev-rules.git)
cd logi-k380-udev-rules

(Replace YOUR_USERNAME with your actual GitHub username.)
2. Make Scripts Executable

Make the install.sh and uninstall.sh scripts executable:

chmod +x install.sh uninstall.sh

3. Run the Install Script

To create the symbolic link and apply the udev rule, run the install script with sudo:

sudo ./install.sh

The script will confirm that the link has been created and that the udev rules have been reloaded.
4. Apply the Rule

For the changes to take effect on the keyboard, disconnect and reconnect your Logitech K380. This forces udev to apply the new rule to the device.
5. Uninstall

If you wish to remove the custom rule, simply run the uninstall script:

sudo ./uninstall.sh

This will safely remove the symbolic link from your system.
Troubleshooting

    Rule not applying?
    The most common reason a new udev rule doesn't apply to an already-connected device is that udevadm trigger doesn't always work for all rule types. The most reliable solution is to turn your keyboard off and on again, or disconnect and reconnect it via Bluetooth.

Contributing

If you have improvements for the scripts or alternative udev rules for the K380 that others might find useful, feel free to open an issue or submit a pull request!
License

This project is licensed under the MIT License. See the LICENSE file for details.
