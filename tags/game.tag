<game>
  <div class="container-fluid">
    <div class="row">
      <h1 style="background-color:{ pickedColor };">The Great
	    <br>
	    <span id="colorDisplay">{ rgbDisplay }</span>
	    <br>
        Color Game
      </h1>
    </div>
    <div id="stripe" class="form-row">
      <div class="form-group">
        <button type="button" onclick={ generateRandomColors } disabled={ buttonClicked || !this.level }>{ message }</button>
        <select onchange={ setLevel }>
          <option value="" disabled selected>Select Level</option>
  				<option value="1">Easy Mode</option>
  				<option value="2">Medium Mode</option>
  				<option value="3">Hard Mode</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <color-block each={ block, i in colorBlocks } onclick={ selectBlock }></color-block>
      </div>
    </div>
  </div>

  <!-- script -->
  <script>
    let tag = this;
    console.log(this);

    this.rgbDisplay = "RGB";
    this.colorBlocks = [];
    this.level = "";
    this.pickedColor = "steelblue"
    this.message = "NEW COLORS"

    var that = this;
    // observable listening for "messageChange" event.
    observable.on('messageChange', function(){
        that.update();
    });

    selectBlock(event) {
      this.message = "test"
      let backgroundColor = event.target.style["background-color"]
      if (backgroundColor.toUpperCase()==this.rgbDisplay.toUpperCase()) {
          this.message="Correct! Play Again?"
          this.pickedColor = backgroundColor
          for(var i = 0; i < this.colorBlocks.length; i++){
          		//change each color to match given color
          		this.colorBlocks[i] = backgroundColor;
        	}

          observable.trigger('messageChange');

          //resetButton.textContent = "Play Again?"
          //changeColors(clickedColor);
          //h1.style.background = clickedColor;
      } else {
          event.target.style["background-color"] = 'white'
          this.message = "Try Again!"
          observable.trigger('messageChange');

          //this.style.background = "#232323";
          //messageDisplay.textContent = "Try Again"
      }
      console.log(this.message)
      console.log(backgroundColor.toUpperCase() + ' -- ' + this.rgbDisplay.toUpperCase())

    }
    // to get color objects
    randomColors(numColors) {
      let colors = [];
      let rStart;
      let gStart;
      let bStart;
      let gradRange = 255 / (numColors - 1);

      //for level 1
      if (this.level == 1) {
        let index = [0, 1, 2];
        let  j = Math.floor(Math.random() * 3);

        if (index[j] == 0) {
          rStart = 0;
          gStart = Math.floor(Math.random() * 256);
          bStart = gStart;

          for (var i = 0; i < numColors; i++) {
            colors.push({r: Math.floor(rStart + (gradRange * i)), g: gStart, b: bStart});
          }
        } else if (index[j] == 1) {
          rStart = Math.floor(Math.random() * 256);
          gStart = 0;
          bStart = rStart;

          for (var i = 0; i < numColors; i++) {
            colors.push({r: rStart, g: Math.floor(gStart + (gradRange * i)), b: bStart});
          }
        } else if (index[j] == 2) {
          rStart = Math.floor(Math.random() * 256);
          gStart = rStart;
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
            colors.push({r: rStart, g: gStart, b: Math.floor(bStart + (gradRange * i))});
          }
        }
      }

      //for level 2
      if (this.level == 2) {
        let index = [0, 1, 2];
        let  j = Math.floor(Math.random() * 3);

        if (index[j] == 0) {
          rStart = 0;
          gStart = 0;
          bStart = Math.floor(Math.random() * 256);

          for (var i = 0; i < numColors; i++) {
            colors.push({r: Math.floor(rStart + (gradRange * i)), g: Math.floor(gStart + (gradRange * i)), b: bStart});
          }
        } else if (index[j] == 1) {
          rStart = 0;
          gStart = Math.floor(Math.random() * 256);
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
            colors.push({r: Math.floor(rStart + (gradRange * i)), g: gStart, b: Math.floor(bStart + (gradRange * i))});
          }
        } else if (index[j] == 2) {
          rStart = Math.floor(Math.random() * 256);
          gStart = 0;
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
            colors.push({r: rStart, g: Math.floor(gStart + (gradRange * i)), b: Math.floor(bStart + (gradRange * i))});
          }
        }
      }

      //for level 3
      if (this.level == 3) {
        rStart = Math.floor(Math.random() * 256);
        gStart = Math.floor(Math.random() * 256);
        bStart = Math.floor(Math.random() * 256);

        for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart, g: gStart, b: bStart});
        }
      }

      return colors;
    }

    generateRandomColors(colorArr) {
      colorArr = this.randomColors(6);
      this.colorBlocks = _.shuffle(colorArr.map(color => "RGB(" + color.r + ", " + color.g + ", " + color.b + ")"));
      this.pickColor()
      this.pickedColor = "steelblue"
      this.message = "NEW COLORS"
      return this.colorBlocks;
    }


    //change levels
    setLevel(event) {
      this.level = Number(event.target.value);
      //this.generateRandomColors()
      //this.pickedColor = this.pickColor()
    }

    pickColor(){
    	var random = Math.floor(Math.random() * this.colorBlocks.length);
      this.rgbDisplay = this.colorBlocks[random]
    	return this.colorBlocks[random];
    }

  </script>

  <!-- CSS style -->
  <style>
    :scope {
      background-color: #232323;
  	  margin: 0px;
  	  font-family: times;
    }
    .container-fluid {
  	  margin: 20px auto;
      width: 100%;
    }
    h1 {
  	  color: white;
  	  text-align: center;
  	  margin: 0px;
  	  font-weight: normal;
  	  text-transform: uppercase;
  	  padding: 20px 0;
      width: 100%;
    }
    #colorDisplay {
  	  font-size: 200%;
    }
    #stripe {
  	  background-color: white;
  	  text-align: center;
  	  color: black;
      display: inline-block;
      width: 100%;
      margin: 0px;
      padding: 5px;
    }
    button {
  	  border: none;
      margin: auto 100px;
  	  background: none;
  	  text-transform: uppercase;
  	  height: 100%;
  	  font-weight: 700;
  	  color: steelblue;
  	  letter-spacing: 1px;
  	  font-size: inherit;
  	  transition: all 0.3s;
  	  -webkit-transition: all 0.3s;
        -moz-transition: all 0.3s;
        outline: none;
    }
    button:hover {
  	  color: white;
  	  background-color: steelblue;
    }
    select {
      margin: auto 100px;
      outline: none;
    }
    .row {
      text-align: center;
    }
    .col {
      max-width: 600px;
      margin: 20px auto;
    }
    color-block {
      display:inline-block;
    }
  </style>
</game>
