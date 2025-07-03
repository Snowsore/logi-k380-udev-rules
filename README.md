Logitech K380 - Linux udev Rule

A simple script to install a udev rule for the Logitech K380 keyboard on Linux.

The included rule in 70-logi-k380.rules is set to [Describe what your rule does here, e.g., "make the F-keys the default"]. You can edit this file to change the behavior.
How to Use

1. Clone the repository

git clone [https://github.com/YOUR_USERNAME/logi-k380-udev-rules.git](https://github.com/YOUR_USERNAME/logi-k380-udev-rules.git)
cd logi-k380-udev-rules

2. Make scripts executable

chmod +x install.sh uninstall.sh

3. Install the rule

sudo ./install.sh

4. Uninstall the rule

sudo ./uninstall.sh

    Note: After installing, you must disconnect and reconnect your keyboard for the new rule to apply.
