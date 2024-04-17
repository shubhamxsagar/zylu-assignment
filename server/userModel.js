const mongoose = require('mongoose'); // Erase if already required

var userSchema = new mongoose.Schema(
	{
		name: {
			type: String,
			required: true,
		},
		email: {
			type: String,
			required: true,
		},
		profilePic: {
			type: String,
			required: true,
		},
        yearOfExperience: {
            type: String,
            required: true,
        }
	},
	{
		timestamps: true,
	}
);
const Employee = mongoose.model('User', userSchema);
module.exports = Employee;
