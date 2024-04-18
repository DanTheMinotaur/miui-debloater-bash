# miui-debloater-bash
A bash script to remove/disable pre-installed apps on Xiaomi MIUI devices.

## Details

Saw this [miui debloater project](https://github.com/kirthandev/MIUI-Debloater-official), didn't want to run some random jar file or install the JVM. 

This project is just a copy of that as a bash script. 

> [!NOTE]
> If you know of any other packages that can be disabled by default open a PR or issue. 


## Prerequistes

- Android Debug Bridge (adb) [install instructions](https://www.xda-developers.com/install-adb-windows-macos-linux/)
- [Enable Developer Mode on Device](https://www.google.com/search?q=xiaomi+enable+developer+mode)
- Shell that can run bash scripts

### OS' tested

Tested on a Redmi Note 10 Pro

#### Linux 

Tested on arch distribution, should work on any distro. 

#### Windows

TODO 

#### MacOS

I don't have mac, but it'll probably work.

## Install 

```shell
git clone git@github.com:DanTheMinotaur/miui-debloater-bash.git && cd miui-debloater-bash
chmod +x debloat.sh
```

## Usage

> [!WARNING]
> By default the script reads package names from `apps.yml` and will attempt to remove or disable any of these packages. 
> Comment out packages or create your own `apps.yml` file with the packages to remove. 

```shell
# reads from apps.yml
bash debloat.sh
# or read from a custom file
bash debloat.sh myapps.yml
```
