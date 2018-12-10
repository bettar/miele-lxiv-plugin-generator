# miele-lxiv-plugin-generator
Xcode project template to start developing a plugin for Miele-LXIV

- Choose any directory, for example `~/Downloads` and clone this repository to it 

		$ cd ~/Downloads
		$ git clone --depth 1 https://github.com/bettar/miele-lxiv-plugin-generator.git MPIG
		$ cd MPIG

## Step 1 - Installing the project template for Xcode

First install the Xcode template. You have to do this step once only.

- The available Xcode templates are displayed in groups. Let's say for example that we want this template to be shown in a group named "Custom", then we do:

		$ export GROUP=Custom

- You can to install the template in one of two possible locations:

	- either for your own PC account 

			$ export DST_DIR=$(realpath "$HOME/Library/Developer/Xcode")/Templates
			
	- or for all users of your PC

			$ export DST_DIR="/Library/Developer/Xcode/Templates"

- unzip the framework

		$ export FRAMEWORK=
		$ unzip MieleAPI.framework.zip
		$ rm -r MieleAPI.framework.zip
		$ rm -r __MACOSX

- finally copy the template into place

		$ mkdir -p $DST_DIR/$GROUP
		$ export TEMPLATE="Miele Plugin.xctemplate"
		$ cp -r "$TEMPLATE" "$DST_DIR/$GROUP/$TEMPLATE"

- That's all. Now you are ready to create new Xcode projects based on the template. A convenience script `install.sh` is provided to perform the above steps. Feel free to tweak it to your requirements before you run it.

---
## Step 2 Generate a new plugin project

Do the following only once, for each new plugin that you want to start developing:

- Create a new Xcode project from the installed template

	- Xcode, File, New, Project...
	- select macOS and scroll down to the Custom group and select "Miele Plugin", click Next
	- Type the Product Name (typically ending in `Filter`), the Menu Title, and select the type. Click Next and select the location for your project. (It's recommended at this point to also select the option to create the git repository.) Click Create.

- Don't start using the newly created Xcode project as yet. Close Xcode.
- The template is still under development, therefore a few steps are required to fix things up after you have generated the project.

	- Locate your new Xcode project in Finder and open the File `Info.plist` with a text editor. Find and delete the following 3 lines. They appear twice. So in total delete 6 lines, something like line 38..40 and line 34..36

			<string>BNDL</string>
			<key>NSPrincipalClass</key>
			<string>...PlugInLoader</string>
		
		Save the file and quit the text editor.

- Finally open the project in Xcode and adjust these settings. You have to do this only once:

	- PROJECT, Info, Deployment Target, from 10.14 to 10.9
	- TARGETS, Build Settings (All | Combined), Linking, Other Linker Flags, `-undefined dynamic_lookup`
	- Remove from the project `AppDelegate.m` and `AppDelegate.m` and `main.m`

	Now you should be able to build the plugin and start developing your code.
