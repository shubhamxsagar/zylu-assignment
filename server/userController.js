const asyncHandler = require('express-async-handler');
const Employee = require('./userModel');
const randomWords = require('randomstring');

const createEmployee = asyncHandler(async (req, res) => {
	try {
		const { name, email, yearOfExperience } = req.body;
		const randomText = randomWords.generate(8); // You can customize this as needed

		// Construct RoboHash URL with the random text
		const profilePic = `https://robohash.org/${randomText}`;
		const newEmployee = new Employee({
			name,
			email,
			profilePic: profilePic,
			yearOfExperience,
		});

		await newEmployee.save();
		const allEmployees = await Employee.find();

		res.status(201).json(allEmployees);
	} catch (error) {
		console.error('Error creating employee:', error);
		res.status(500).json({ error: 'Failed to create employee' });
	}
});

const getAllEmployees = asyncHandler(async (req, res) => {
	try {
		const employees = await Employee.find();
		res.status(200).json(employees);
	} catch (error) {
		console.error('Error fetching employees:', error);
		res.status(500).json({ error: 'Failed to fetch employees' });
	}
});

module.exports = { createEmployee, getAllEmployees };
