<!DOCTYPE html>
<html>
<head>
  <style>
    body {
      background-color: seagreen;
      font-family: Arial, sans-serif;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      height: 100vh;
    }

    img {
      width: 400px; /* Adjust as needed */
      height: auto;
      opacity: 0.5; /* This makes the image transparent */
      margin: 0 50px; /* This creates space between images */
      border: 3px solid white;
      border-radius: 10px;
    }

    h1 {
      text-align: center;
      color: white;
    }

    .back-button {
      display: inline-block;
      padding: 10px 20px;
      margin-bottom: 20px;
      color: white;
      background-color: #012A6C;
      border: none;
      border-radius: 5px;
      text-decoration: none;
    }
    .help-button {
      background-color: #012A6C;
      display: inline-block;
      padding: 10px 20px;
      margin-bottom: 20px;
      color: white;
      border: none;
      border-radius: 5px;
      text-decoration: none;
    }

    .image-container {
      display: flex;
      justify-content: center;
    }
  </style>
  <script>
    function showMessage(message) {
      alert(message);
    }
    function showHelp() {
      alert("Click on the part of the body where you're experiencing discomfort. A message will appear suggesting a doctor.");
    }
  </script>
</head>
<body>
<div class="container">
  <h1>Human Anatomy</h1>
  <a href="patient_main_environment.jsp" class="back-button">Go Back</a>
  <button onclick="showHelp()" class="button help-button">Help</button>
  <div class="image-container">
    <img src="img/front.png" usemap="#frontmap" alt="Front view of human">
    <map name="frontmap">
      <area shape="rect" coords="272,131,148,7" alt="Head" onclick="showMessage('If you are hurting in your head, you should see a neurologist')">
      <area shape="rect" coords="53,196,128,446" alt="Arm" onclick="showMessage('If you are hurting in your arm, you should see an orthopedist')">
    </map>
    <img src="img/back.png" usemap="#backmap" alt="Back view of human">
    <map name="backmap">
      <area shape="rect" coords="152,24,280,143" alt="Back of head" onclick="showMessage('If you are hurting in the back of your head, you should see a neurologist')">
      <area shape="rect" coords="124,161,305,427" alt="Back" onclick="showMessage('If you are hurting in your back, you should see an orthopedist')">
    </map>
  </div>
</div>
</body>
</html>

