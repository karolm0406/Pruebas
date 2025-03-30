import { Router } from 'express';
import { renderRegister, registerUser, renderLogin, loginUser, logout, validateRegister } from '../controllers/auth.controller.js';

const router = Router();

router.get('/register', renderRegister);
router.post('/register', validateRegister, registerUser);  
router.get('/login', renderLogin);
router.post('/login', loginUser);
router.get('/logout', logout); 

export default router;


