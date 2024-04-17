const bodyParser = require('body-parser');
const express = require('express');
const dbConnect = require('./dbConnect');
const app = express();
const dotenv = require('dotenv').config();
const PORT = process.env.PORT || 4000;
const cors = require('cors');
const cookieParser = require('cookie-parser');
// const morgan = require('morgan');
const {createEmployee, getAllEmployees} = require('./userController');
dbConnect();

app.use(cors());
// app.use(morgan('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.json());

app.post('/api/createEmployee', createEmployee);
app.get('/api/getAllEmployees', getAllEmployees);

app.listen(PORT, () => {
	console.log(`Server is running at PORT ${PORT}`);
});


