<feedback>

  <!--HTML-->
  <div class="picker">
    Red<input type="range" ref="red" min="0" max="255" step="1" value="115" oninput = { getValue }>
    Green<input type="range" ref="green" min="0" max="255" step="1" value="10" oninput = { getValue }>
    Blue<input type="range" ref="blue" min="0" max="255" step="1" value="162" oninput = { getValue }>
    <div class="displayblock" style="background-color:{ display };"></div>
  </div>

  <!--javascript-->
  <script>
  this.red = "";
  this.green = "";
  this.blue = "";

  getValue () {
    this.red = this.refs.red.value;
    this.green = this.refs.green.value;
    this.blue = this.refs.blue.value;

    this.display = "rgb(" + this.red + "," + this.green + "," + this.blue + ")";
    }
  </script>

  <style>
    div {
      font-family: times;
    }

    .picker {
      margin: auto;
      width: 720px;
      height: 300px;
    }

    .displayblock {
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

</feedback>
