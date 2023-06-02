<!DOCTYPE html>
<html>
<head>
    <title>Medical Chatbot</title>

   <style>
       body {
           display: flex;
           flex-direction: column;
           justify-content: center;
           align-items: center;
           height: 100vh;
           background-color: seagreen; /* Change to seagreen background color */
           font-family: Candara;
       }

       #chatbox {
           width: 500px;
           height: 600px;
           border: 2px solid #000;
           padding: 10px;
           overflow: auto;
           background-color: #fff;
           border-radius: 8px;
           box-shadow: 0 0 10px rgba(0,0,0,0.1);
           margin-bottom: 10px; /* Add space below the chatbox */
       }

       #userInput {
           width: 400px;
           padding: 10px;
           border-radius: 4px;
           border: 1px solid #ccc;
       }

       button {
           background-color: #012A6C; /* Change button color */
           border: none;
           color: white;
           padding: 10px 20px;
           text-align: center;
           text-decoration: none;
           display: inline-block;
           font-size: 16px;
           margin: 4px 2px;
           cursor: pointer;
           border-radius: 4px;
       }

       a {
           display: inline-block;
           text-decoration: none;
           color: white; /* Change text color to white for better visibility on dark background */
           background-color: #012A6C; /* Change back button color to match submit button */
           padding: 10px;
           border-radius: 4px;
           transition: background-color 0.3s ease;
       }

       a:hover {
           background-color: #001F4C; /* Darker shade of blue for hover effect */
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

   </style>

    <script>
        function updateChatbox(message) {
            var chatbox = document.getElementById('chatbox');
            chatbox.innerHTML += message + '<br>';
            chatbox.scrollTop = chatbox.scrollHeight;
        }

        function askSymptom() {
            updateChatbox('Chatbot: What\'s your symptom?');
        }
        function showHelp() {
          alert("Tell your medical assistant in which part of the body where you're experiencing discomfort and he will suggest a doctor.");
       }

        window.onload = askSymptom;
    </script>
</head>
<body>
<div id="chatbox"></div>
<input type="text" id="userInput">
<button onclick="submitSymptom()">Submit</button>
<button onclick="showHelp()" class="button help-button">Help</button>
<a href="patient_main_environment.jsp">Back</a>

<script>
    function submitSymptom() {
        var userInput = document.getElementById('userInput').value;
        updateChatbox('You: ' + userInput);
        document.getElementById('userInput').value = '';

        fetch('MedicalChatbotServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 'symptom=' + encodeURIComponent(userInput),
        })
            .then(response => response.text())
            .then(specialist => {
                var message = specialist ? 'Medical Assistant: You may need to see a ' + specialist
                    : 'Medical Assistant: Sorry, I don\'t understand your symptom. Please try again.';
                updateChatbox(message);
            });
    }
</script>
</body>
</html>

