<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>1) File List</title>
    <script src="https://fb.me/react-15.0.1.js"></script>
    <script src="https://fb.me/react-dom-15.0.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/custom.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}" id="resourcesPath">
</head>
<body>
    <div id="reactPageHeader"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageHeader.js" type="text/babel"></script>

<div id="table"></div>
<script type="text/babel">
class FilesTable extends React.Component {
constructor(props) {
        super(props);
        this.state = {files: []};
    }
_loadFiles() {
        $.ajax({
            url: 'http://localhost:8080/file/all',
            dataType: 'json',
            success: function(data) {
                this.setState({files: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error('#Get Error', status, err.toString());
            }.bind(this)
        });
    }
 componentDidMount() {
        this._loadFiles();
    }
    	render() {   
			var data=["Name","Record Count","Seq No.","Source System Name","Arrival Time","Start Time","Complete Time",
            "Status","Processing Record","Priority"];
       		var tableData = [];
        	for (var x = 0; x < data.length; x++)

            tableData.push(<th>{data[x]}</th>);

				 return (
            <div>
                <table id="fileTable" className="table table-striped">
                    <thead>
                        <tr>{tableData}</tr>
                    </thead>
                    <tbody>	
                        {this.state.files.map(function(file) {
							var color = '';
                            if (file.status === "Completed")
                                color = '#70f441';
                            else if (file.status === "Running")
                                color = '#f4dc42';
                            else if (file.status === "Refused")
                                color = '#f45f41';
                            var colorStyle = { backgroundColor: color };
                           
                            return (
                                <tr className="dropdown">
                                    <td>{file.name}</td>
                                    <td>{file.recordCount}</td>
									<td>{file.seqNo}</td>
									<td>{file.sourceSysName}</td>
									<td>{file.arrivalTime}</td>
									<td>{file.startTime}</td>
									<td>{file.completeTime}</td>
									<td style={colorStyle}>{file.status}</td>
									<td>{file.record}</td>
									<td>{file.priority}</td>
                                </tr>
                            )
                        })}
                    </tbody>
                </table>
            </div>
        );
		}
	};
ReactDOM.render(
    <FilesTable />,
    document.getElementById('table')
);
</script>

<a href="/springMVC/file/add">Add new file</a>

    <div id="reactPageFooter"></div>
    <script src="${pageContext.request.contextPath}/resources/js/getPageFooter.js" type="text/babel"></script>
</body>
</html>