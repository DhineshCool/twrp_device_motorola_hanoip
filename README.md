# Android Device configuration for Motorola G40/60

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.3 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
CHIPSET | Qualcomm sm6150 Snapdragon 732G
GPU     | Adreno 618
Memory  | 4 / 6GB
Shipped Android Version | 11
Storage | 64/128
Battery | 6000 mAh
Dimensions | 169 x 75.9 x 9.7 mm
Display | 1080 x 2400 pixels, 6.81" LTPS IPS LCD, HDR10
G40
Rear Camera  | 64 MP (f/1.7) + 8 MP (ultrawide) + 2 MP (macro) + 2 MP (depth)
Front Camera | 25 MP (f/2.0)
G60
Rear Camera  | 108 MP (f/1.9) + 8 MP (ultrawide) + 2 MP (macro) + 2 MP (depth)
Front Camera | 32 MP (f/2.0)

![Device Picture](https://fdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g40-fusion-2.jpg)

### Kernel Source

See /prebuilt/README.md

### How to compile

```sh
. build/envsetup.sh
export LC_ALL=C
lunch omni_racer-eng
make -j4 recoveryimage
```

### Build with TWRP installer

To automatically make the twrp installer, you need to import this commit in the build/make path:
```sh
https://gerrit.twrp.me/c/android_build/+/4964
```

Then add @osm0sis' standard twrp_abtemplate repo to a local manifest as indicated below (followed by another `repo sync` to download the repo):
```xml
<project name="osm0sis/twrp_abtemplate" path="bootable/recovery/installer" remote="github" revision="master"/>
```

### Copyright
 ```
  /*
  *  Copyright (C) 2013-21 The OmniROM Project
  *
  * This program is free software: you can redistribute it and/or modify
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation, either version 3 of the License, or
  * (at your option) any later version.
  *
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
  * You should have received a copy of the GNU General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  *
  */
  ```
