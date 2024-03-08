# SantaNetScanner

SantaNetScanner is a bash script designed for ethical network scanning and vulnerability detection, utilizing `nmap`. It's developed for cybersecurity enthusiasts and professionals to scan authorized networks or their own networks to identify open ports and potential vulnerabilities.

## Features

- Scans individual IP addresses, ranges, or entire subnets.
- Outputs scan results in multiple formats: TXT, XML, CSV, and JSON.
- Includes vulnerability scanning with `nmap` scripts.
- Interactive language selection: English and Italian support for user messages.

## Prerequisites

Ensure `nmap` and `xsltproc` are installed on your system. You can install these on most Linux distributions with bash:

- `sudo apt-get install nmap`

- `sudo apt-get install xsltproc`

## Usage

Clone the repository or download the script.
Make the script executable: `chmod +x port_scan.sh`

Run the script and follow the interactive prompts: `./port_scan.sh`

## Configuration
No external configuration is required. All options are selected interactively at runtime.

## License
This project is licensed under the MIT License - see the `LICENSE` file for details.

## Disclaimer
This script is currently in development and has not been extensively tested. If you're keen on testing SantaNetScanner and encounter any bugs, or if you have suggestions or modifications to propose, I'd love to hear from you. Your feedback is crucial for enhancing this tool. Please check out `CONTRIBUTING` file for details on how to report issues, suggest improvements, or make contributions. Your input is greatly appreciated in helping to refine and improve SantaNetScanner for everyone.

Ivan Santagati ("the author") does not assume any responsibility for the use of this script. It is intended for educational and ethical use only on networks you are authorized to test or own. Unauthorized use of this tool for scanning networks without permission is illegal and against the terms of use.

