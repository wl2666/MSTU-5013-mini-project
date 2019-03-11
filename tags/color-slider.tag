<color-slider>

  <!--HTML-->
  <div class="picker">
    Red<input type="range" id="red" min="0" max="255" step="1" value="115" oninput = {getValue()}>
    Green<input type="range" id="green" min="0" max="255" step="1" value="10" oninput = {getValue()}>
    Blue<input type="range" id="blue" min="0" max="255" step="1" value="162" oninput = {getValue()}>
    <div id="display"></div>
  </div>

  <!--javascript-->
  <script>
  var getValue = function(e){
            red = document.getElementById("red").value,
            green = document.getElementById("green").value,
            blue = document.getElementById("blue").value;

        var display = document.getElementById("display");
        display.style.background = "rgb(" + red + "," + green + "," + blue + ")";
    }
  </script>

  <style>
    div {
      font-family: times;
    }

    .picker {
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      margin: auto;
      width: 720px;
      height: 180px;
    }

    #display {
      width: 100%;
      height: 100px;
      background: #730aa2;
      transition: background 100ms;
      margin-top: 30px;
      border: 1px solid #000;
    }

    input {
      display: block;
      width: 100%;
    }
  </style>

</color-slider>
