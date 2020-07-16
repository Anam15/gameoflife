# Game of Life (Assembly 8086)

### Rules
`1. Any live cell with fewer than two live neighbours dies, as if by underpopulation.
 2. Any live cell with two or three live neighbours lives on to the next generation.
 3) Any live cell with more than three live neighbours dies, as if by overpopulation.
 4) Any dead cell with exactly three live neighbours becomes a live cell, as if by
 Please reference the following link to read more about the rules:
 

### App Walk-though

<img src"https://i.imgur.com/7GhYcMV.gif" width=200><br>

### Required User Stories
- [x] 1. User sees custom text in a label - Hello from {name}!
- [x] 2. User see's custom background color.
- [x] 3. User can tap a button to change the text color of the label.

### Optional User Stories
- [x] 1. User can tap a button to change the color of the background view.  
- [ ] 2. User can tap a button to change the text string of the label - Android is Awesome!  
- [x] 3. User can tap on the background view to reset all views to default settings.  
- [x] 4. User can update the label text with custom text entered into the text field.  
   - [x] a. User can enter text into a text field using the keyboard.  
   - [x] b. User can tap the "Change text string" button to update the label with the text from the text field.  
   - [x] c. If the text field is empty, update label with default text string.  



Please reference the following link to read more about the rules:
https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life?fbclid=IwAR2VbPeFDLWS0jLoL5
Bbjm0QYxKsjZjEQBuVLAR8Qx4pBPji3JZrmPNSz5
Prerequisites
1. Install DOSBOX on your machine using the following link: https://www.dosbox.com/
2. Install 8086 zip file by clicking the following link:
https://drive.google.com/file/d/0B001eXddyriFbFBhclB5QmVvaVE/view
Installing
1. Go, to your Download, click on the 8086 zip file and move the 8086 folder into your C
drive
2. Open your DOSBOX and type in the following commands:
a) mount c c:/8086
b) c:
c) edit filename.asm
d) Type in your assembly code here
e) masm filename.asm
f) Enter ;
g) link filename
h) Enter ;
i) filename
Once you are in the file ,
a) Press Enter to go from the title page (initial screen) to the screen where you can
draw the initial configuration using the mouse
b) Right click and then drag the mouse around the screen to draw the initial
configuration (NOTE: make sure you fill the screen a lot to see the results).
Following is the picture of a recommended amount of initial configuration
drawn:
Note: If you are not satisfied with the initial condition you drew, press SPACE to reset the
screen. Once the screen is reset , draw your initial condition again.
c) Right click to make the mouse disappear.
d) Press any key from the keyboard to play the game
e) Press Esc to go to the exit page
Note: User also has the ability to go from the exit screen to the screen where the user can
draw the initial configuration. The user can do so by pressing SPACE.
Note: To exit DOSBOX, meaning get the control of your mouse outside of DOSBOX, press
Ctrl + F10
Built With
Visual Studio Code - used to write assembly code
DOSBOX - used to run the assembly code
Author
Anam Munawar
