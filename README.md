# homeassistant addon cups airprint
CUPS addon with working Avahi in reflector mode 

Tested with Home Assistant version **2023.9**

CUPS administrator login: **print**, password: **print** (can be changed in the Dockerfile)

Configuration data is stored in **/data/cups** folder

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fzajac-grzegorz%2Fhomeassistant-addon-cups-airprint)

### Epson Printer Driver
This add-on includes the `epson-inkjet-printer-escpr_1.8.4_armhf.deb` package to ensure compatibility with a wide range of Epson printers. This software is covered by the GNU General Public License (GPL), which allows for free use, modification, and distribution under the same license.

#### Source Code and GPL License
- The source code for this driver can be obtained directly from [Epson's Download Center](https://download.ebz.epson.net/dsc/du/02/DriverDownloadInfo.do?LG2=JA&CN2=US&CTI=176&PRN=Linux%20deb%2032bit%20Raspbian%20package&OSC=LX&DL). 
- For more information about the GNU General Public License (GPL) and your rights under it, please visit the [GNU Licenses Page](https://www.gnu.org/licenses/gpl-3.0.html).
