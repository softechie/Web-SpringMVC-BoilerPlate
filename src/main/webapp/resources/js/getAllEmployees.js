class Main extends React.Component {
    constructor(props) {
        super(props);
        this.state = {employees: []}
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
        //var self = this;
        var data=["EmpID","Name","Status","Tenure","Phone","Email","DOJ",
            "WL","HL","CL","RMID","RoleID","VertID","AcctID"];
        var tableData = [];
        for (var x = 0; x < data.length; x++)
            tableData.push(<th>{data[x]}</th>);
        
        return (
            <div>
                <table id="empTable" className="table table-striped">
                    <thead>
                        <tr>{tableData}</tr>
                    </thead>
                    <tbody>
                        {this.state.employees.map(function(employee) {
                            var color = '';
                            if (employee.status === "Onboarding Completed")
                                color = '#70f441';
                            else if (employee.status === "Onboarding In Progress")
                                color = '#f4dc42';
                            else if (employee.status === "Onboarding Cancelled")
                                color = '#f45f41';
                            var colorStyle = { backgroundColor: color };
                            return (
                                <tr key={employee.empId}>
                                    <td>{employee.empId}</td>
                                    <td>{employee.name}</td>
                                    <td style={colorStyle}>{employee.status}</td>
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
                            )
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
);