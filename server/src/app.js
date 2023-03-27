const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
const session = require('express-session');

const bodyParser = require('body-parser');
const cookieParser = require('cookie-parser');

const app = express();
let id = '';
app.use(express.json());
app.use(cors({
    origin: ["http://localhost:3000"],
    methods: ["GET", "POST"],
    credentials: true
}));

app.use(cookieParser());
app.use(bodyParser.urlencoded({ extended: true }));

app.use(session({
    key: 'userId',
    secret: '1234',
    resave: false,
    saveUninitialized: true,
    cookie: {
        expires: 24 * 60 * 60 * 1000
    }
}));

const db = mysql.createConnection({
    user: 'root',
    host: 'containers-us-west-76.railway.app',
    password: 'oPAqTWuzgmpW9RIsV7dZ',
    database: 'railway',
    port: '6755'
});

app.post('/login', (req, res) => {
    const username = req.body.username;
    const password = req.body.password;

    db.query(
        'SELECT * FROM login WHERE username = ? AND password = ?',
        [username, password],
        (err, result) => {
            if(err){
                res.send(err);
            }

            if(result.length > 0){
                req.session.user = result;
                console.log({user: req.session.user});
                res.send(result);
            } else {
                res.send({message: 'Wrong passowrd or username'});
            }
        }
    );
});

app.get('/login', (req, res) => {
    if(req.session.user){
        res.send({loggedIn: true, user: req.session.user});
    } else {
        res.send({loggedIn: false});
    }
});

app.get('/student-data/:id', (req, res) => {

    console.log('-- id --');
    const userId = req.params.id;
    console.log(userId);
    console.log('-- id --');

    const consultSql =
        "SELECT s.name AS 'name', s.code AS 'code', m.major_name AS 'major', sj.name AS 'subject', g.grade_value AS 'grade' " +
        "FROM student s " +
        "JOIN major m ON s.major = m.id " +
        "JOIN course c ON s.id = c.student_id " +
        "JOIN subject sj ON c.subject_code = sj.subject_code " +
        "JOIN grade g ON s.id = g.student_id AND sj.subject_code = g.subject_code " +
        "WHERE s.id = ? "
    ;

    db.query(
        consultSql,
        [userId],
        (err, result) =>{
            console.log('-- /student-data --');
            console.log(result);
            console.log('-- /student-data --');
            res.send({result});
        }
    );
});

app.get('/teacher-data/:id', (req, res) => {
    console.log('-- id --');
    const userId = req.params.id;
    console.log(userId);
    console.log('-- id --');

    const consultSql =
        "SELECT c.course_code, s.name AS subject_name, su.name AS student_name, g.grade_value AS student_grade, p.name AS professor_name, p.id AS professor_code " +
        "FROM course c " +
        "INNER JOIN subject s ON c.subject_code = s.subject_code " +
        "INNER JOIN student su ON c.student_id = su.id " +
        "INNER JOIN grade g ON su.id = g.student_id AND s.subject_code = g.subject_code " +
        "INNER JOIN professor p ON c.professor_id = p.id " +
        "WHERE c.professor_id = ?"
    ;

    db.query(
        consultSql,
        [userId],
        (err, result) => {
            console.log(result);
            res.send({result});
        }
    );

});

app.listen(3001, () =>{
    console.log('Runing sv');
});