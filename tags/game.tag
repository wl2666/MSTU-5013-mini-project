<game>
  <div class="container-fluid">
    <div class="row">
      <h1>The Great
	    <br>
	    <span id="colorDisplay">{ rgbDisplay }</span>
	    <br>
        Color Game
      </h1>
    </div>
    <div id="stripe" class="form-row">
      <div class="form-group">
        <button type="button" onclick={ generateRandomColors } disabled={ buttonClicked }>NEW COLORS</button>
        <select>
          <option value="" disabled selected>Select Level</option>
  				<option value="1">Easy Mode</option>
  				<option value="2">Medium Mode</option>
  				<option value="3">Hard Mode</option>
        </select>
      </div>
    </div>
    <div class="row">
      <div class="col-6">
        <color-block each={ block, i in colorBlocks }></color-block>
      </div>
    </div>
  </div>

  <!-- script -->
  <script>
    let tag = this;

    this.rgbDisplay = "RGB";
    this.colorBlocks = [];

    //make the random colors into an array
    generateRandomColors() {
      console.log(this);
  	  //push random colors into the array
  	  for (var i = 0; i < 6; i++) {
  		  this.colorBlocks.push(randomColors());
  	  };
      //change the state of button
      this.buttonClicked = true;
  	  //return the color array
  	  return this.colorBlocks;
    }

    //to get random colors
    function randomColors() {
  	  //red
  	  var r = Math.floor(Math.random() * 256);
  	  //green
  	  var g = Math.floor(Math.random() * 256);
  	  //blue
  	  var b = Math.floor(Math.random() * 256);
      //return the rgb(r, g, b) color
  	  return "rgb(" + r + ", " + g + ", " + b + ")";
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
  	  background-color: steelblue;
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
    color-block {
      display:inline-block;
    }
  </style>
</game>
