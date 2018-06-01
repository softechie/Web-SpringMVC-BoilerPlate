class EmployeeDetails extends React.Component {
    constructor(props) {
        super(props);
        this.state = { employees: [] };
    }

    componentWillMount() {
        this.loadEmployees();
    }

    loadEmployees() {
        $.ajax({
            url: 'http://localhost:8080/employee/all',
            dataType: 'json',
            success: function(data) {
                this.setState({ employees: data });
            }.bind(this),
            error: function(xhr, status, err) {
                console.error('#Get Error', status, err.toString());
            }.bind(this),
            async: false
        });
    }

    render() {
        return ( <
            div > {
                this.state.employees.map(function(employee) {
                    if (employee.empId === document.getElementById("hiddenEmpId").innerHTML) {
                        var color = '';
                        if (employee.status === "Onboarding Completed")
                            color = '#70f441';
                        else if (employee.status === "Onboarding In Progress")
                            color = '#f4dc42';
                        else if (employee.status === "Onboarding Cancelled")
                            color = '#f45f41';
                        var colorStyle = { backgroundColor: color };
                        return (
                            <div key = { employee.empId } >
                                <div> Employee Id: { employee.empId } </div>
                                <div> Name: { employee.name } </div>
                                <div> Tenure: { employee.tenure } </div>
                                <div style={colorStyle}> Status: { employee.status } </div>
                                <div> Phone: { employee.phone } </div>
                                <div> Email: { employee.email } </div>
                                <div> AcctID: { employee.acctid } </div>
                            </div>
                        )
                    }
                })
            } </div>
        );
    }
}

ReactDOM.render( 
	<EmployeeDetails / > ,
    document.getElementById('reactEmployeeDetails')
)