# LIFred
LIFred is a highly customizable workflow for [Alfred][1] to control your [LIFX][2] smart bulbs from anywhere in the world.

![LIFred][image-1]

## Requirements
* At least one [LIFX][3] smart bulb
* [Alfred][4]
* [Alfred Powerpack][5]
* Internet Connection

## Getting Started
* [Download][6] the [Alfred][7] workflow
* Import the workflow into [Alfred][8] by double clicking it
* Get a LIFX client token
	* Go to [https://cloud.lifx.com/settings/][9] and generate a new token
	* Make sure to copy it to your clipboard
* Open [Alfred][10] and type `configure lifred`
* Paste your client token
* Select `Set Client Token` and press Enter
* You should receive a notification as soon as the token was set successfully.

## LIFred Configuration
| Title | Description |
|-------|-------------|
| Set Client Token | You need to enter the client token and press enter to actually set the client token. |
| Show/Hide `all Bulbs` entries | Shows/Hides the entries to control all bulbs. |
| Show/Hide individual Bulb entries | Shows/Hides the entries to control bulbs individually. |
| Show/Hide Scenes | Shows/Hides Scenes. |
| Show/Hide Power On | Shows/Hides the function to power on any bulb. |
| Show/Hide Power Off | Shows/Hides the function to power off any bulb. |
| Show/Hide Toggle | Shows/Hides the function to toggle any bulbs power state. |
| Show/Hide Breathe | Shows/Hides the function to let any bulb breathe a given color. |
| Show/Hide Pulse | Shows/Hides the function to let any bulb pulse a given color. |
| Show/Hide Color | Shows/Hides the function to set any bulb to a given color. |
| Refresh Bulbs and Scenes | Refreshes all your bulbs and Scenes. |
| More Information | Redirects you to a website that gives you more information about this workflow. |

## Using LIFred
### LIFred itself
* Type `lifred` to show all actions
	* If you want to use any action that needs a color as parameter, just enter the color separated by a space
* Press enter to execute the action
* You will receive a notification to check if the action was performed successfully.
* Select `Refresh Bulbs` if you added a bulb or the any of your bulbs is not in the list.

#### Color options
All possible color options are listed here: [http://developer.lifx.com/#colors][11]

### LIFred configuration
 * Type `configure lifred`
* Show the items you need
* Hide the items you do not need (all are shown by default)

## Contact
If you have any problems send me an email: [support@bieg-software.de][12]

[1]:	http://www.alfredapp.com "Alfred"
[2]:	http://lifx.co "LIFX"
[3]:	http://lifx.co "LIFX"
[4]:	http://www.alfredapp.com "Alfred"
[5]:	http://www.alfredapp.com/powerpack/ "Alfred"
[6]:	https://github.com/0x6368/LIFred/releases "Download LIFred"
[7]:	http://www.alfredapp.com "Alfred"
[8]:	http://www.alfredapp.com "Alfred"
[9]:	https://cloud.lifx.com
[10]:	http://www.alfredapp.com "Alfred"
[11]:	http://developer.lifx.com/#colors
[12]:	mailto:support@bieg-software.de

[image-1]:	https://raw.github.com/0x6368/LIFred/master/screenshots/LIFred.png
