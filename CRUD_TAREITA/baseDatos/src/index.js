import express from 'express';
import morgan from 'morgan';
import { engine } from 'express-handlebars';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import kdramasRoutes from './routes/kdramas.route.js';

const app = express();
const __dirname = dirname(fileURLToPath(import.meta.url));

// Configuración
app.set('port', process.env.PORT || 3000);
app.set('views', join(__dirname, 'views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: join(app.get('views'), 'layouts'),
    partialsDir: join(app.get('views'), 'partials'),  
    extname: '.hbs'
}));
app.set('view engine', '.hbs');

// Middlewares
app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// Rutas principales
app.get('/', (req, res) => {
    res.render('index');
});

// **aseguramos que  las rutas del CRUD están activas**
app.use(kdramasRoutes);

// Archivos estáticos
app.use(express.static(join(__dirname, 'public')));

// Ejecutar servidor
app.listen(app.get('port'), () => 
    console.log('Servidor escuchando en el puerto', app.get('port'))
);

