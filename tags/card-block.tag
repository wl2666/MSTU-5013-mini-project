<card-block>
  <div id="container">
		<div class="box" style="background-color:{ block };"></div>
  </div>


  <!-- script -->
  <script>
    let tag = this;
    console.log(this);
  </script>


  <!-- CSS style -->
  <style>
    #container {
	    width: 30%;
      /* background: purple; */
      padding-bottom: 30%;
      float: left;
      margin: 1.66%;
      border-radius: 15%;
      transition: background-color 0.6s;
      -webkit-transition: background-color 0.6s;
      -moz-transition: background-color 0.6s;
    }
    .box {
      width: 50px;
      height: 50px;
    }
  </style>
</card-block>
