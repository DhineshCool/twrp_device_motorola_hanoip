# TWRP Device configuration for Moto G40/G60

## Device specifications

Basic   | Spec Sheet
-------:|:-------------------------
CPU     | Octa-core (2x2.3 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)
CHIPSET | Qualcomm sm6150 Snapdragon 732G
GPU     | Adreno 618
Memory  | 4 / 6GB
Shipped Android Version | 11
Storage | 128GB
Battery | 6000 mAh
Dimensions | 169 x 75.9 x 9.8 mm
Display | 1080 x 2460 pixels, 6.8" LTPS IPS LCD, HDR10
G40 Rear Camera  | 64 MP (f/1.8) + 8 MP (ultrawide) + 2 MP (depth)

G60 Rear Camera  | 108 MP (f/1.9) + 8 MP (ultrawide) + 2 MP (depth)

Front Camera | 16/32 MP (f/2.2)


### Kernel Source


### How to compile

```sh
. build/envsetup.sh
export LC_ALL=C
lunch omni_hanoip-eng
make -j4 recoveryimage
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
