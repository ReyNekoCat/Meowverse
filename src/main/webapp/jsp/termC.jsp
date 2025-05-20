<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Términos y Condiciones - Meowverse</title>
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/meowverseSL.png">
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
            grid-template-areas: "terms";
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

        .terms {
            grid-area: terms;
            display: flex;
            flex-direction: column;
            position: relative;
            background: white;
            padding: 30px;
            overflow-y: auto;
        }

        .terms-header {
            text-align: center;
            margin-bottom: 20px;
            position: relative;
            font-family: "Poppins", sans-serif;
        }

        .terms-header h1 {
            color: #421797;
            font-size: 28px;
            margin-bottom: 10px;
            font-family: "Poppins", sans-serif;
        }

        .terms-header .logo {
            font-size: 40px;
            color: #c34eda;
            margin-bottom: 10px;
            font-family: "Poppins", sans-serif;
        }

        .terms-header .last-updated {
            color: #9a9a9a;
            font-size: 12px;
            margin-bottom: 20px;
        }


        .terms-section {
            margin-bottom: 25px;
            font-family: "Poppins", sans-serif;
        }

        .terms-section h2 {
            color: #89379c;
            font-size: 18px;
            margin-bottom: 10px;
            border-bottom: 1px solid #e6e6e6;
            padding-bottom: 5px;
        }

        .terms-section p, .terms-section ul {
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 10px;
            text-align: justify;
        }

        .terms-section ul {
            padding-left: 20px;
        }

        .terms-section li {
            margin-bottom: 8px;
        }

        .terms-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 20px;
            padding-top: 15px;
            border-top: 1px solid #e6e6e6;
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

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {transform: translateY(0);}
            40% {transform: translateY(-5px);}
            60% {transform: translateY(-3px);}
        }

        @media (min-width: 768px) {
            .container {
                grid-template-columns: 40% 60%;
                grid-template-areas: "design terms";
            }

            .design {
                display: block;
            }
            
            .terms-header h1 {
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
            <div class="pill-3"></div>
            <div class="pill-4"></div>
        </div>
        <div class="terms">
            <div class="terms-header">
                    <h1>Meowverse</h1>
                    <h1>Términos y Condiciones</h1>
                <div class="last-updated">Última actualización: 15 de junio, 2023</div>
            </div>
            
            <div class="terms-content">
                <div class="terms-section">
                    <h2>1. Aceptación de los Términos</h2>
                    <p>Al acceder y utilizar Meowverse ("la Plataforma"), usted acepta cumplir con estos Términos y Condiciones, nuestra Política de Privacidad y todas las leyes y regulaciones aplicables.</p>
                </div>
                
                <div class="terms-section">
                    <h2>2. Uso de la Plataforma</h2>
                    <p>Meowverse es una plataforma social para amantes de los gatos que permite:</p>
                    <ul>
                        <li>Compartir fotos y videos de gatos</li>
                        <li>Conectar con otros dueños de gatos</li>
                        <li>Participar en comunidades temáticas</li>
                        <li>Acceder a contenido exclusivo sobre cuidado felino</li>
                    </ul>
                    <p>Usted se compromete a usar la Plataforma solo para fines legales y de acuerdo con estos Términos.</p>
                </div>
                
                <div class="terms-section">
                    <h2>3. Cuentas de Usuario</h2>
                    <p>Para acceder a ciertas funciones, deberá crear una cuenta. Usted acepta:</p>
                    <ul>
                        <li>Proporcionar información exacta y actualizada</li>
                        <li>Mantener la confidencialidad de sus credenciales</li>
                        <li>Ser responsable de todas las actividades bajo su cuenta</li>
                        <li>Notificarnos inmediatamente sobre cualquier uso no autorizado</li>
                    </ul>
                </div>
                
                <div class="terms-section">
                    <h2>4. Contenido del Usuario</h2>
                    <p>Usted conserva los derechos de cualquier contenido que publique, pero nos otorga una licencia mundial no exclusiva para usar, mostrar y distribuir dicho contenido en relación con la Plataforma.</p>
                    <p>No está permitido publicar contenido que:</p>
                    <ul>
                        <li>Sea ilegal, difamatorio u ofensivo</li>
                        <li>Infrinja derechos de terceros</li>
                        <li>Contenga virus o software malicioso</li>
                        <li>Muestre maltrato animal</li>
                    </ul>
                </div>
                
                <div class="terms-section">
                    <h2>5. Privacidad</h2>
                    <p>Nuestra <a href="#" style="color: #c34eda;">Política de Privacidad</a> explica cómo recopilamos, usamos y compartimos su información personal. Al usar la Plataforma, usted acepta nuestras prácticas de privacidad.</p>
                </div>
                
                <div class="terms-section">
                    <h2>6. Modificaciones</h2>
                    <p>Podemos modificar estos Términos ocasionalmente. Le notificaremos sobre cambios significativos, y su uso continuado constituirá aceptación de los nuevos términos.</p>
                </div>
                
                <div class="terms-section">
                    <h2>7. Terminación</h2>
                    <p>Nos reservamos el derecho de suspender o terminar su acceso a la Plataforma por violaciones de estos Términos o por cualquier motivo a nuestra discreción.</p>
                </div>
            </div>    
            <button class="back-btn" onclick="window.history.back()">Volver</button>
        </div>
    </div>
</body>
</html>