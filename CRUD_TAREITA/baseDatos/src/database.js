import { createPool } from 'mysql2/promise';

const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: 'n0m3l0',  
    database: 'kdramas_nuevo_db' 
});

export default pool;
