import { createPool } from 'mysql2/promise';

const pool = createPool({
    host: 'localhost',
    user: 'root',
    password: 'Regina.0406',  
    database: 'kdramas_nuevo_db' 
});

export default pool;
