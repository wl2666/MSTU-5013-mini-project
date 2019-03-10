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
    <div id="stripe" class="row">
      <button type="button" onclick={ generateRandomColors } disabled={ !this.level }>NEW COLORS</button>
      <select onchange={ setLevel }>
        <option value="" disabled selected>Select Level</option>
  			<option value="1">Easy Mode</option>
  			<option value="2">Medium Mode</option>
  			<option value="3">Hard Mode</option>
      </select>
    </div>
    <div class="row">
      <div class="col">
        <color-block each={ block, i in colorBlocks }></color-block>
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


    //change levels
    setLevel(event) {
      this.level = Number(event.target.value);
    }

    // to get color objects
    randomColors(numColors) {
      let colors = [];
      let rStart;
      let gStart;
      let bStart;
      let gradRange = 256 / (numColors - 1);
      let index = [0, 1, 2];
      let  j = Math.floor(Math.random() * 3);

      //for level 1
      if (this.level == 1) {

        if (index[j] == 0) {
          rStart = 0;
          gStart = Math.floor(Math.random() * 256);
          bStart = gStart;

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart + (gradRange * i), g: gStart, b: bStart
          });
        }

        } else if (index[j] == 1) {
          rStart = Math.floor(Math.random() * 256);
          gStart = 0;
          bStart = rStart;

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart, g: gStart + (gradRange * i), b: bStart
          });
        }
        } else if (index[j] == 2) {
          rStart = Math.floor(Math.random() * 256);
          gStart = rStart;
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart, g: gStart, b: bStart + (gradRange * i)
          });
        }
        }
      }

      //for level 2
      if (this.level == 2) {

        if (index[j] == 0) {
          rStart = 0;
          gStart = 0;
          bStart = Math.floor(Math.random() * 256);

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart + (gradRange * i), g: gStart + (gradRange * i), b: bStart
          });
        }

        } else if (index[j] == 1) {
          rStart = 0;
          gStart = Math.floor(Math.random() * 256);
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart + (gradRange * i), g: gStart, b: bStart + (gradRange * i)
          });
        }
        } else if (index[j] == 2) {
          rStart = Math.floor(Math.random() * 256);
          gStart = 0;
          bStart = 0;

          for (var i = 0; i < numColors; i++) {
          colors.push({r: rStart, g: gStart + (gradRange * i), b: bStart + (gradRange * i)
          });
        }
        }
      }

      //for level 3
      if (this.level == 3) {

        for (var i = 0; i < numColors; i++) {
          rStart = Math.floor(Math.random() * 256);
          gStart = Math.floor(Math.random() * 256);
          bStart = Math.floor(Math.random() * 256);
          colors.push({r: rStart, g: gStart, b: bStart});
        }
        }

      return colors;
    }

    //to generate colors array
    generateRandomColors(colorArr) {
      colorArr = this.randomColors(6);
      this.colorBlocks = _.shuffle(colorArr.map(color => "rgb(" + color.r + ", " + color.g + ", " + color.b + ")"));
      return this.colorBlocks;
    }

    //change levels


  </script>

  <!-- CSS style -->
  <style>
    :scope {
  	  margin: 0px;
  	  font-family: times;
    }
    .container-fluid {
  	  margin: 20px auto;
      width: 100%;
      /* background-color: #232323; */
    }
    h1 {
  	  color: white;
  	  text-align: center;
  	  background-color: steelblue;
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
      padding: 5px 10px;
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
