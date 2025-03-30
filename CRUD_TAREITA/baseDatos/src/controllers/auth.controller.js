import pool from '../database.js';
import bcrypt from 'bcryptjs';
import { body, validationResult } from 'express-validator';
import xss from 'xss'; 

// Mostrar formulario de registro
export const renderRegister = (req, res) => {
    res.render('auth/register');
};

export const validateRegister = [
    body('username').notEmpty().withMessage('El nombre de usuario es obligatorio'),
    body('email').isEmail().withMessage('El correo electrónico no es válido'),
    body('password').isLength({ min: 6 }).withMessage('La contraseña debe tener al menos 6 caracteres'),
];

export const registerUser = async (req, res) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        return res.render('auth/register', { error: errors.array()[0].msg });
    }

    try {
        const username = xss(req.body.username); 
        const email = xss(req.body.email);    
        const password = req.body.password;     

        const [existingUser] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
        if (existingUser.length > 0) {
            return res.render('auth/register', { error: "El correo ya está registrado." });
        }

        const hashedPassword = await bcrypt.hash(password, 10);
        await pool.query('INSERT INTO users (username, email, password) VALUES (?, ?, ?)', [username, email, hashedPassword]);

        res.redirect('/login');
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

// Mostrar formulario de login
export const renderLogin = (req, res) => {
    res.render('auth/login');
};

export const loginUser = async (req, res) => {
    try {
        const email = xss(req.body.email);  
        const password = req.body.password;  
        const [user] = await pool.query('SELECT * FROM users WHERE email = ?', [email]);

        if (user.length === 0) {
            return res.render('auth/login', { error: "Correo o contraseña incorrectos." });
        }

        const validPassword = await bcrypt.compare(password, user[0].password);
        if (!validPassword) {
            return res.render('auth/login', { error: "Correo o contraseña incorrectos." });
        }

        req.session.user = user[0];
        res.redirect('/');
    } catch (error) {
        res.status(500).json({ message: error.message });
    }
};

export const logout = (req, res) => {
    req.session.destroy(() => {
        res.redirect('/login');
    });
};

