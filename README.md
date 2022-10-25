# Port_Scan_Utility

Nmap is an open source program that is used to scan network ports and is widely used in the field of cybersecurity, for example, to carry out security audits. The ```nmap``` utility sometimes gets a bit cumbersome to read, so this utility has been created in bash to make it easier to read the port scan of a victim machine.

## Description of the script:

The ```ports_scan.sh``` script scans the open TCP ports of a victim machine and displays them on the screen, as well as the services to which they correspond.

## Requirements

In order to use this bash utility, the following requirements must be taken into account:

- A Linux-based operating system
- Have the ```nmap``` utility installed


## Installation of nmap:

For ```Arch``` distributions:
```bash
sudo pacman -S nmap
```

For ```Red Hat``` distributions:
```bash
sudo dnf -y install nmap
```

or


```bash
sudo yum -y install nmap
```

For ```Debian``` distributions:
```bash
sudo apt install nmap -y
```


## Usage:
***Step1***: Download the bash script
```bash
sudo wget https://raw.githubusercontent.com/Danilooo99/Port_Scan_Utility/master/script/ports_scan.sh 
```

***Step 2***: Assignment of execution permissions of the script
```bash
sudo chmod +x /download_directory/ports_scan.sh
```

***Step 3***: Script execution
```bash
./download_directory/ports_scan.sh
```

## Example:

![image](https://user-images.githubusercontent.com/55488676/197856788-e15b93c0-3593-4d0e-ab2a-89db5f9a67d6.png)


## Script utilities:

| Software                                                              | Utility                       |
| --------------------------------------------------------------------- | ----------------------------- |
| **[nmap](https://nmap.org/)**                                         | Utility to scan network ports |

