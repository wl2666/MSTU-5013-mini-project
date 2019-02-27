var numSquares = 6;
var colors = generateRandomColors(numSquares);
var squares = document.querySelectorAll(".square");
var pickedColor = pickColor();
var colorDisplay = document.getElementById("colorDisplay");
var messageDisplay = document.getElementById("message");
var h1 = document.querySelector("h1");
var newColorsButton = document.getElementById("reset");
var modeButtons = document.querySelectorAll(".mode");



//to display the pickedColor in h1
colorDisplay.textContent = pickedColor;

for (var i = 0; i < squares.length; i ++) {
	//add initial colors to squares
	squares[i].style.backgroundColor = colors[i];

	//add click listeners to squares
	squares[i].addEventListener("click", function(){
      //grab color of the clicked sqaure
      var clickedColor = this.style.backgroundColor;

      //compare color to pickedColor
      if(clickedColor === pickedColor) {
      	changeColors(clickedColor);
      	message.textContent = "Correct!";
      	newColorsButton.textContent = "Play Again?"
      	h1.style.backgroundColor = clickedColor;
      } else {
      	this.style.backgroundColor = "#232323";
      	message.textContent = "Try again!";
      }
	});
}

//change all the squares to the selected color
function changeColors(color) {
	for (var i = 0; i < squares.length; i++) {
		squares[i].style.backgroundColor = color;
	}
}

//pick a random color as the correct one
function pickColor() {
	var random = Math.floor(Math.random() * colors.length);
	return colors[random];
}


//make the random colors into an array
function generateRandomColors(num) {
	//build an array
	var arr = [];
	//push random colors into the array
	for (var i = 0; i < num; i++) {
		arr.push(randomColors());
	};
	//return the array
	return arr;
}

//to get random colors
function randomColors() {
	//red 
	var r = Math.floor(Math.random() * 256);
	//green
	var g = Math.floor(Math.random() * 256);
	//blue
	var b = Math.floor(Math.random() * 256);
    //rgb(r, g, b)
	return "rgb(" + r + ", " + g + ", " + b + ")";
}

//add event listener to the new colors button
newColorsButton.addEventListener("click", function() {
	reset();

});


for (var i = 0; i < modeButtons.length; i++) {
	modeButtons[i].addEventListener("click", function() {
		//make all buttons not selected
		modeButtons[0].classList.remove("selected");
		modeButtons[1].classList.remove("selected");

		//when buttons are selected
		this.classList.add("selected");

		//to judge the number of squares
		this.textContent === "Easy" ? numSquares = 3: numSquares = 6;

		//an alternative way to write a code to judge
		// if(this.textContent === "Easy") {
		// 	numSquares = 3;
		// } else {
		// 	numSquares = 6;
		// };

		//set the game to start status
		reset();
		
    });
};


function reset() {
	//generate new colors
	colors = generateRandomColors(numSquares);

	//pick a new random color from the array
	pickedColor = pickColor();

	//change colorDisplay to match pickedColor
	colorDisplay.textContent = pickedColor;

	//change color of squares
	for (var i = 0; i < squares.length; i ++) {
		if(colors[i]) {
			squares[i].style.display = "block";
			squares[i].style.backgroundColor = colors[i];
		} else {
			squares[i].style.display = "none";
		}
	
	};

	//hide the message after displaying
	messageDisplay.textContent = "";

	//change newColorsButton's text back to New Colors
	newColorsButton.textContent = "New Colors";

	//reset h1 bg-color back to steelblue
	h1.style.backgroundColor = "steelblue";

}
        

