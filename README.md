## Battlescribe Stylesheet for Kill Team

### Instructions for Battlescribe users

1. Download the stylesheet from [here](https://github.com/DaeronAlagos/battlescribe-stylesheets/blob/master/dist/stylesheet.xsl).

2. Create your Kill Team in Battlescribe (Matched Play or Campaign).

3. Export in Battlescribe.
  `File -> Export roster...`
  
4. Browse for the XSL Stylesheet and select the file you downloaded in step 1.

5. Browse for the Destination File and select a folder where you want to save the file. Name the file; eg. mycampaign.html (note the .html here is important).

6. Click 'Export' then 'Done'.

7. Open the html file in your web browser and print as required.

### Instructions for Developers

0. The build process requires Nodejs. Please follow the instructions to install Node LTS on the official website

1. Clone the repository
  `git clone https://github.com/DaeronAlagos/battlescribe-stylesheets.git`

2. Change to the project folder `cd battlescribe-stylesheets`

3. Install the required NPM modules `npm install`

4. Create a roster in Battlescribe and save it as a .ros file, to the battlescribe-stylesheets-wh40k/data folder

5. Rename your roster file to have the .xml file extension

6. Build your first distribution file `gulp build --bsfile YOUR_FILE.xml`

7. Run gulp with browser-sync `gulp --bsfile YOUR_FILE.xml`

8. Edit the files in the src folder and see your changes in the web browser that opened when you started gulp