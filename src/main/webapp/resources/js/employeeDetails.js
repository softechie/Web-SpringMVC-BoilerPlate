class Main extends React.Component {
	constructor(props) {
		super(props);
		this.state = {employees: []};
	}

	loadEmployees() {
		$.ajax({
			url: 'http://localhost:8080/employee/all',
			dataType: 'json',
			success: function(data) {
				this.setState({employees: data});
			}.bind(this),
			error: function(xhr, status, err) {
				console.error('#Get Error', status, err.toString());
			}.bind(this)
		});
	}
	componentDidMount() {
		this.loadEmployees();
	}

	render() {
		return (
			<div>
				<table className="table table-striped">
					<thead>
						<tr>
							<th>EmpID</th>
							<th>Name</th>
							<th>Status</th>
							<th>Tenure</th>
							<th>Email</th>
							<th>DOJ</th>
							<th>WL</th>
							<th>HL</th>
							<th>CL</th>
							<th>RMID</th>
							<th>RoleID</th>
							<th>VertID</th>
							<th>AcctID</th>
						</tr>
					</thead>
					<tbody>
						{this.state.employees.map(function(employee) {
							return (
								<tr key={employee.empId}>
									<td>{employee.empId}</td>
									<td>{employee.name}</td>
									<td>{employee.tenure}</td>
									<td>{employee.phone}</td>
									<td>{employee.email}</td>
									<td>{employee.doj}</td>
									<td>{employee.wl}</td>
									<td>{employee.hl}</td>
									<td>{employee.cl}</td>
									<td>{employee.rmid}</td>
									<td>{employee.roleid}</td>
									<td>{employee.vertid}</td>
									<td>{employee.acctid}</td>
								</tr>
							);
						})}
					</tbody>
				</table>
			</div>
		);
	}
}

ReactDOM.render(
		<Main />,
		document.getElementById('react')
	)