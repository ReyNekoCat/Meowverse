<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acerca de Nosotros - Meowverse</title>
    <link rel="icon" type="image/png" href="../images/meowverseSL.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap');

        *, html, body {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: linear-gradient(to bottom right, #c34eda, #421797, #89379c);
            padding: 20px;
        }

        .container {
            width: 80vw;
            max-width: 900px;
            height: 80vh;
            display: grid;
            grid-template-columns: 100%;
            grid-template-areas: "about";
            box-shadow: 0 0 17px 10px rgb(0 0 0 / 30%);
            border-radius: 20px;
            background: white;
            overflow: hidden;
        }

        .design {
            grid-area: design;
            display: none;
            position: relative;
        }

        .design .pill-1 {
            bottom: 0;
            left: -40px;
            position: absolute;
            width: 80px;
            height: 200px;
            background: linear-gradient(#c34eda, #421797, #89379c);
            border-radius: 40px;
        }

        .design .pill-2 {
            top: -100px;
            left: -80px;
            position: absolute;
            height: 450px;
            width: 220px;
            background: linear-gradient(#c34eda, #421797, #89379c);
            border-radius: 200px;
            border: 30px solid #e2c5e2;
        }

        .about {
            grid-area: about;
            display: flex;
            flex-direction: column;
            position: relative;
            background: white;
            padding: 30px;
            overflow-y: auto;
            text-align: center;
        }

        .about-header h1 {
            color: #421797;
            font-size: 28px;
            margin-bottom: 20px;
        }

        .about-header .logo {
            font-size: 50px;
            color: #c34eda;
            margin-bottom: 15px;

        }

        .about-content {
            flex: 1;
            overflow-y: auto;
            padding: 0 20px;
        }

        .about-content p {
            font-size: 15px;
            line-height: 1.7;
            margin-bottom: 20px;
            text-align: justify;
            color: #555;
        }

        .team-section {
            margin: 30px 0;
            padding: 20px;
            background: #f9f3ff;
            border-radius: 15px;
        }

        .team-section h2 {
            color: #89379c;
            margin-bottom: 15px;
        }

        .team-members {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .team-member {
            background: white;
            padding: 15px;
            border-radius: 10px;
            width: 200px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .team-member i {
            font-size: 30px;
            color: #c34eda;
            margin-bottom: 10px;
        }

        .team-member h3 {
            color: #421797;
            margin-bottom: 5px;
        }

        .team-member p {
            font-size: 13px;
            text-align: center;
            margin-bottom: 0;
            color: #666;
        }

        .back-btn {
            padding: 12px 30px;
            color: white;
            background: linear-gradient(to right, #421797, #89379c, #c34eda);
            border: none;
            border-radius: 20px;
            cursor: pointer;
            font-weight: 600;
            margin-top: 20px;
            transition: transform 0.3s;
        }

        .back-btn:hover {
            transform: scale(1.05);
        }

        @media (min-width: 768px) {
            .container {
                grid-template-columns: 40% 60%;
                grid-template-areas: "design about";
            }

            .design {
                display: block;
            }
            
            .about-header h1 {
                font-size: 32px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="design">
            <div class="pill-1"></div>
            <div class="pill-2"></div>
        </div>
        <div class="about">
            <div class="about-header">
                <h1>Meowverse</h1> 
                <h1>Acerca de Nosotros</h1>
            </div>
            
            <div class="about-content">
                <p>Bienvenido a Meowverse, la red social definitiva para los amantes de los gatos. Nuestra plataforma fue creada para conectar a dueños de gatos, compartir momentos adorables, aprender sobre cuidado felino y construir una comunidad apasionada por estos maravillosos animales.</p>
                
                <p>En Meowverse puedes crear perfiles para tus gatos, compartir fotos y videos, conectarte con otros dueños, participar en foros de discusión, acceder a artículos especializados y mucho más. Todo diseñado pensando en el bienestar felino y la comodidad de nuestros usuarios.</p>
                
                <div class="team-section">
                    <h2>Nuestro Equipo de Desarrollo</h2>
                    <div class="team-members">
                        <div class="team-member">
                            <i class="fas fa-user"></i>
                            <h3>Areli Sarai Hernández Franco</h3>
                            <p>Desarrolladora Frontend</p>
                        </div>
                        <div class="team-member">
                            <i class="fas fa-user"></i>
                            <h3>Jock Rey Reyes Aguirre</h3>
                            <p>Desarrollador Backend</p>
                        </div>
                    </div>
                    <p style="text-align: center; margin-top: 20px;">Proyecto desarrollado para la materia de Programación Web 1</p>
                </div>
                
                <p>Meowverse está en constante evolución para ofrecer la mejor experiencia a nuestra comunidad gatuna. Agradecemos tus comentarios y sugerencias para seguir mejorando.</p>
            </div>
            
            <button class="back-btn" onclick="window.history.back()">Volver</button>
        </div>
    </div>
</body>
</html>