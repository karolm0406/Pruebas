import express from 'express';
import morgan from 'morgan';
import session from 'express-session';
import { engine } from 'express-handlebars';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import kdramasRoutes from './routes/kdramas.route.js';
import authRoutes from './routes/auth.route.js';

const app = express();
const __dirname = dirname(fileURLToPath(import.meta.url));

app.set('port', process.env.PORT || 3000);
app.set('views', join(__dirname, 'views'));
app.engine('.hbs', engine({
    defaultLayout: 'main',
    layoutsDir: join(app.get('views'), 'layouts'),
    partialsDir: join(app.get('views'), 'partials'),
    extname: '.hbs'
}));
app.set('view engine', '.hbs');

app.use(session({
    secret: 'secreto123', 
    resave: false,
    saveUninitialized: false
}));

app.use(morgan('dev'));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());


app.use((req, res, next) => {
    res.locals.user = req.session.user || null;
    next();
});

app.get('/', (req, res) => {
    if (req.session.user) {
        return res.render('index'); 
    }
    res.render('auth/login'); 
});

app.use(authRoutes);
app.use(kdramasRoutes);
app.use(express.static(join(__dirname, 'public')));


app.listen(app.get('port'), '0.0.0.0', () => {
    console.log('Servidor escuchando en el puerto', app.get('port'));
});







