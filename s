<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            background-color: #000;
            color: #00FF00;
            font-family: monospace;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .loader {
            font-size: 24px;
        }

        .percentage {
            font-size: 18px;
            margin-top: 10px;
        }

        .ascii-art {
            font-family: monospace;
            font-size: 18px;
            white-space: pre;
        }

        .redirecting {
            font-size: 18px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div>
        <span class="loader" id="loadingText">Cargando</span>
        <div class="percentage" id="percentage">0%</div>
        <pre class="ascii-art" id="asciiArt"></pre>
        <div class="redirecting" id="redirectingText"></div>
    </div>

    <iframe src="https://appetize.io/app/standalone_7skfxkncelzi5n3sbaniykpq7i?device=pixel7&osVersion=13.0" width="600" height="400" frameborder="0" style="display: none;"></iframe>

    <script>
        const loadingText = document.getElementById("loadingText");
        const percentageText = document.getElementById("percentage");
        const asciiArt = document.getElementById("asciiArt");
        const redirectingText = document.getElementById("redirectingText");
        const iframe = document.querySelector("iframe");

        function animateDots() {
            const dots = ["", ".", "..", "..."];
            let dotIndex = 0;

            setInterval(() => {
                loadingText.textContent = `Cargando${dots[dotIndex]}`;
                dotIndex = (dotIndex + 1) % dots.length;
            }, 1000);
        }

        function updatePercentage() {
            let percentage = 0;

            const percentageInterval = setInterval(() => {
                percentage += 1;
                percentageText.textContent = `${percentage}%`;

                if (percentage >= 100) {
                    clearInterval(percentageInterval);
                    renderAsciiArt();
                }
            }, 50);
        }

        function renderAsciiArt() {
            const asciiArtText = ` 
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWW@#=****@W#@WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWW@::::::+==*:::::::*WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWW#+:::-....-::::::-..:+::+#WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWW@:........:@WWW=.:-......-:::-......::::::-+WWWW@+......:@WWWWWWWW
WWWWWWWWW@-.............--.-.......-::-......-::::-....*@*............+WWWWWW
WWWWWWWW:.........................-:........:::-........................=WWWWWW
WWWWWWW-.........................-........-::-...........................:WWWWW
WWWWWW:..:#WWWW*.........................-:-......................-*=*:...:WWWW
WWWWW#.+WWWWWWWW=...............................................@WWWWWWW@-.=WWW
WWWWWWWWWWWWWWWW-...+=#@WW@#*:....................-+=#@@@#=:....*WWWWWWWWW@=WWW
WWWWWWWWWWWWWWW#:@@*-.....-+=WWW@:............+@WWW=:-.....-*@@:-WWWWWWWWWWWWWW
WWWWWWWWWWWWWWW#-..............-@WW=........=WW@-..............-#WWWWWWWWWWWWWW
WWWWWWWWWWWWW@-..:::::::::::::::.-@W@......@W@-.-::::::::::::::...@WWWWWWWWWWWW
WWWWWWWWWWWWW-:=.-::+*+:::::::::::-WW*....=WW-:::::::::::++=+::..::WWWWWWWWWWWW
WWWWWWWWWWWWW-W@..:*W@=========@W*:#WWWWWWWW=::=W@######===@W:-.:W-WWWWWWWWWWWW
WWWWWWWWWWWWW=WW+..=W:.........+W=:=W#....#W=::#@..........:W-..#W=WWWWWWWWWWWW
WWWWWWWWWWWWWWWWW-.:W*.........*W+:@W:....+W@::+W-.........+#..*WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWW-.+W#.......#W+:@W+......*W#::+W+.......*#-.*WWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWWW+.:+@WW@WW#+:=W@-........-@W*:::=@#=##*:-.@@@WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#*WW@-.-::::*#W@+.....#WW=.....*WW#+::::--.=W@*#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#:::@WW#+::=.........::---:.........=++++@W=:::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#:::::*@WW*+WWWWWWWW@@@###@@@WWWWWWW:-#W#+:::::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#:::::::::=WW@..:W#:+******+:@W-..@W#*:::::::::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#::::::::::::@:*W#@@WWWWWWWW@#=W+-#::::::::::::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#::::::::::::+*::::::::::::::::::+:::::::::::::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWW#::::::::::::::::::::::::::::::::::::::::::::::#WWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWW-AURORA-WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
`;

            asciiArt.textContent = asciiArtText;

            // Mostrar el iframe después de mostrar el ASCII
            iframe.style.display = "block";
        }

        animateDots();
        updatePercentage();
    </script>
</body>
</html>
