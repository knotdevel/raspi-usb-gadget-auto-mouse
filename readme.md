# raspi-usb-gadget-auto-mouse
-----------------------------
I am working from my home. My PC provided by company, goes to sleep if I don't move the mouse for more than 5 minutes. When it goes to sleep, "Microsoft Teams" status becomes "Away" and my colleagues know that I'm not working. To avoid this, I created a device that automatically moves the mouse using Raspberry Pi. Just plug it into the PC, it will move the mouse by one pixel every two minutes. My PC no longer sleeps at all. Enjoy:)

## Prerequisite
You need below equipments to build this device.
- Linux machine to build the SD card image (I'm using Intel PC installed Ubuntu 20.04.)
- Raspberry Pi (Zero or Zero-W is recommended.)
- Micro SD card (4GB or larger)
- USB cable (USB A connector <---> USB micro B connector) to connect the PC and the Raspberry Pi

## Usage
1. Clone this repo into Linux machine.
1. Run 00.build-image.sh script. You will get usb-gadget-auto-mouse.img in the same directory.
1. Write this image to micro SD card, then insert it to Raspberry Pi.
1. Connect the PC USB Type-A connector and the RasPi USB micro-B connector. Raspberry Pi Zero and Zero-W have 2 USB micro B connectors which are named "PWR IN" and "USB". You need to connect the USB cable to "USB" connector.
![connection](https://user-images.githubusercontent.com/518577/105632797-7d96b200-5e98-11eb-8007-0a50006ae411.png)
1. Turn on your PC and wait. It takes long time (about 3 or 5 minites) to detect device at the 1st time.

## Reference
This is using USB Gadget API in the Linux. There are many articles about USB Gadget API and examples in the Internet. I referred below pages. I'm deeply grateful to engineers writing nice articles.
- https://www.kernel.org/doc/html/latest/driver-api/usb/gadget.html
- https://gist.github.com/gbaman/50b6cca61dd1c3f88f41
- https://github.com/aidantwoods/RPi0w-keyboard
- http://www.isticktoit.net/?p=1383
- https://qiita.com/sgrk/items/7a818b2a059d5b06b209

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
