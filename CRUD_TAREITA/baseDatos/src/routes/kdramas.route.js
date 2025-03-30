import { Router } from 'express';
import pool from '../database.js';

const router = Router();
const isAuthenticated = (req, res, next) => {
    if (req.session.user) {
        return next();
    }
    res.redirect('/login');
};

function contieneHTML(texto) {
    return /<\/?[a-z][^>]*>/i.test(texto);
}

router.get('/add', isAuthenticated, (req, res) => {
    res.render('Kdramas/add');
});

router.post('/add', isAuthenticated, async (req, res) => {
    try {
        const { titulo, anio, genero, episodios, transmision, protagonistas, sinopsis, calificacion } = req.body;

        if ([titulo, genero, transmision, protagonistas, sinopsis].some(contieneHTML)) {
            return res.render('kdramas/add', { error: "No se permiten etiquetas HTML en los campos." });
        }

        const newKdrama = { titulo, anio, genero, episodios, transmision, protagonistas, sinopsis, calificacion };
        await pool.query('INSERT INTO KDRAMAS SET ?', [newKdrama]);

        console.log("K-Drama guardado correctamente");
        res.redirect('/list');
    } catch (err) {
        console.error("Error al guardar el K-Drama:", err);
        res.status(500).json({ message: err.message });
    }
});

router.get('/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const { id } = req.params;
        const [kdrama] = await pool.query('SELECT * FROM kdramas WHERE id=?', [id]);
        const kdramaEdit = kdrama[0];
        res.render('kdramas/edit', { kdrama: kdramaEdit });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

router.get('/list', isAuthenticated, async (req, res) => {
    try {
        const [result] = await pool.query('SELECT * FROM KDRAMAS');
        res.render('kdramas/list', { kdramas: result });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

router.post('/edit/:id', isAuthenticated, async (req, res) => {
    try {
        const { titulo, anio, genero, episodios, transmision, protagonistas, sinopsis, calificacion } = req.body;
        const { id } = req.params;

        if ([titulo, genero, transmision, protagonistas, sinopsis].some(contieneHTML)) {
            return res.render('kdramas/edit', { error: "No se permiten etiquetas HTML en los campos.", kdrama: req.body });
        }

        const editKdrama = { titulo, anio, genero, episodios, transmision, protagonistas, sinopsis, calificacion };
        await pool.query('UPDATE kdramas SET ? WHERE id= ?', [editKdrama, id]);

        res.redirect('/list');
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

router.get('/delete/:id', isAuthenticated, async (req, res) => {
    try {
        const { id } = req.params;

        const [kdrama] = await pool.query('SELECT * FROM kdramas WHERE id = ?', [id]);

        if (!kdrama || kdrama.length === 0) {
            return res.status(404).json({ message: "Kdrama no encontrado" });
        }

        await pool.query('DELETE FROM kdramas WHERE id = ?', [id]);

        res.redirect('/list');
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

router.get('/search', async (req, res) => {
    try {
        const { titulo } = req.query;
        if (!titulo) {
            return res.render('index', { searchError: "Por favor ingrese un título para buscar." });
        }

        const [kdrama] = await pool.query('SELECT * FROM kdramas WHERE titulo LIKE ?', [`%${titulo}%`]);

        if (!kdrama || kdrama.length === 0) {
            return res.render('index', { searchError: "No se encontró ningún Kdrama con ese título." });
        }

        res.render('index', { kdrama: kdrama[0] });
    } catch (err) {
        res.status(500).json({ message: err.message });
    }
});

export default router;
