function f1()
{
	return db.emp.find({empid: 1038}, {_id: false, empid: true, Name: '$ename'})
}