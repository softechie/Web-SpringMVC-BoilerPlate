var canvas = document.getElementById('myCanvas');
var context = canvas.getContext('2d');
var circles = [];

class EmployeesMap extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            employees: [],
            nodes: [],
            scale: 80,
            nodeLineCount: 0,
            nodeX: 0,
            nodeY: 1,
            nodeDirection: "right",
            nodeRadius: 10,
            nodeLineWidth: 3
        };
    }
    _loadEmployees() {
        $.ajax({
            url: 'http://localhost:8080/employee/all',
            dataType: 'json',
            success: function(data) {
                this.setState({employees: data});
            }.bind(this),
            error: function(xhr, status, err) {
                console.error('#Get Error', status, err.toString());
            }.bind(this),
            async: false
        });
    }
    _drawGrid() {
        context.fillStyle="#000";
        context.canvas.width = window.innerWidth-(window.innerWidth*.1);
        context.canvas.height = window.innerHeight-(window.innerHeight*.1);
        context.beginPath();
        var scale = this.state.scale;
        var height = window.innerHeight*scale;
        var width = window.innerWidth*scale;
        var counter=0;
        for (var x = .5; x < width; x+=scale) {
            context.moveTo(x,0);
            if (counter<10)
                context.fillText(counter++,x-9,10);
            else if (counter<100)
                context.fillText(counter++,x-13,10);
            else if (counter<1000)
                context.fillText(counter++,x-16,10);
            context.moveTo(x,0);
            context.lineTo(x,height);
        }
        context.moveTo(width-.5,0);
        context.lineTo(width-.5, 50);
        counter =0;
        for (var y=.5; y < height; y+=scale) {
            context.moveTo(0,y);
            context.fillText(counter++,0,y-8);
            context.moveTo(0,y);
            context.lineTo(height,y);
        }
        context.moveTo(0, height-.5);
        context.lineTo(width, height-.5);
        context.strokeStyle = "#eee";
        context.lineWidth = 1;
        context.stroke();
        context.fill();
        context.closePath();
    }
    _drawNode(fill, emp) {
    	if (canvas.width < (this.state.nodeLineCount+2)*this.state.scale) {
            this.state.nodeLineCount=0;
            this.state.nodeY++;
            this._drawLoopBackLine();
            if (this.state.nodeDirection==="right")
        	this.state.nodeDirection="left";
            else if (this.state.nodeDirection==="left")
                this.state.nodeDirection="right";
    	}
        else {
            if (this.state.nodeDirection==="right")
                this.state.nodeX++;
            else if (this.state.nodeDirection==="left")
                this.state.nodeX--;
            this._drawLine();
        }
    	var x = this.state.nodeX*this.state.scale;
        var y = this.state.nodeY*this.state.scale;
        context.beginPath();
    	context.strokeStyle = "#000";
    	context.lineWidth=this.state.nodeLineWidth;
    	context.arc(x, y, this.state.nodeRadius, 0, 2 * Math.PI);
    	context.fillStyle = fill;
    	context.fill();
    	context.stroke();
        this.state.nodes.push({
            id: x + "-" + y,
            empId: emp.empId,
            name: emp.name,
            tenure: emp.tenure,
            status: emp.status,
            phone: emp.phone,
            email: emp.email,
            doj: emp.doj,
            wl: emp.wl,
            hl: emp.hl,
            cl: emp.cl,
            rmid: emp.rmid,
            roleid: emp.roleid,
            vertid: emp.vertid,
            acctid: emp.acctid,
            x: x,
            y: y,
            radius: this.state.nodeRadius
        });
        this.state.nodeLineCount++;
    }
    _drawLine(){
        var lineX = this.state.nodeX*this.state.scale;
        var lineY = this.state.nodeY*this.state.scale;
        context.beginPath();
        
        if (this.state.nodeDirection==="right") {
            context.moveTo(lineX-this.state.nodeRadius, lineY);
            context.lineTo(lineX - (this.state.scale-this.state.nodeRadius), lineY);
        }
        else if (this.state.nodeDirection==="left") {
            context.moveTo(lineX+this.state.nodeRadius, lineY);
            context.lineTo(lineX + (this.state.scale-this.state.nodeRadius), lineY);
        }
    	context.strokeStyle = "#000";
    	context.lineWidth=this.state.nodeLineWidth;
    	context.stroke();
    }
    
    _drawLoopBackLine(){
        var lineX = this.state.nodeX*this.state.scale;
        var lineY = (this.state.nodeY-.5)*this.state.scale;
        context.beginPath();
        
        if (this.state.nodeDirection==="right") {
            context.arc(lineX+this.state.nodeRadius, lineY, this.state.scale/2, 1.5 * Math.PI, .5 * Math.PI);
        }
        else if (this.state.nodeDirection==="left") {
            context.arc(lineX-this.state.nodeRadius, lineY, this.state.scale/2, .5 * Math.PI, 1.5 * Math.PI);
        }
    	context.strokeStyle = "#000";
    	context.lineWidth=this.state.nodeLineWidth;
    	context.stroke();
    }
    _addNodes(){
        let self = this;
        this.state.employees.map(function(employee) {
            var color = '#fff';
            if (employee.status === "Onboarding Completed")
                color = '#70f441';
            else if (employee.status === "Onboarding In Progress")
                color = '#f4dc42';
            else if (employee.status === "Onboarding Cancelled")
                color = '#f45f41';
            self._drawNode(color, employee);
        });
        circles = this.state.nodes;
    }
    componentWillMount() {
        this._loadEmployees();
        this._drawGrid();
    }
    componentDidMount() {

    }
    render() {
        return (
            <div>
                {this._addNodes()}
                {this.state.nodes.map(function(circle) {
                    var circleId = circle.id;
                    return (
                        <div id={circleId+"-content"} className="dropdown-content" key={circleId+"-content"}>
                            <div>Employee Id: {circle.empId}</div>
                            <div>Name: {circle.name}</div>
                            <div>Tenure: {circle.tenure}</div>
                            <div>Status: {circle.status}</div>
                            <div>Phone: {circle.phone}</div>
                            <div>Email: {circle.email}</div>
                        </div>
                    );
                })}
            </div>
        );
    }
}
ReactDOM.render(
    <EmployeesMap />,
    document.getElementById('reactEmployeesMap')
);

//Handle the user hovering over a particular node
//Display a dropdown content box with the relevant information
//that follows the users mouse
canvas.onmousemove = function (e) {
    for (var i=0; i<circles.length; i++) {
        $('#'+circles[i].id+'-content').css('display', 'none');
    }
    var rect = canvas.getBoundingClientRect(),
    x = e.clientX - rect.left,
    y = e.clientY - rect.top,
    i = 0, circle;
    while(circle = circles[i++]) {
        context.beginPath();
        context.arc(circle.x, circle.y, circle.radius, 0, 2*Math.PI);
        if (context.isPointInPath(x, y)) {
            $('#'+circle.id+'-content').css('left', x+80+"px");
            $('#'+circle.id+'-content').css('top', y+150+"px");
            $('#'+circle.id+'-content').css('display', 'block');
            break;
        }
    }
};

