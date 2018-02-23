var canvas = document.getElementById('myCanvas');
var context = canvas.getContext('2d');

//var nodeCount=0;
var nodeLineCount=1;
var nodeX=0;
var nodeY=1;
var nodeDirection="right";
var nodeSpacing=50;
var nodeRadius=10;
var nodeLineWidth=3;
var nodeFill="#fff";

var lineWidth = 5;
var cols = 3;
var rows = 2;
var xDistance = 100;
var yDistance = 50;
let circles = [];


class Map extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            circlesState: []
        };
    }
    componentWillMount() {
    	this._drawGrid();
    	this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
        this._drawNode();
    }
    componentDidMount() {
        circles = this.state.circlesState;
    }
    _drawGrid() {
        //var c = document.getElementById("myCanvas");
        //var ctx = c.getContext("2d");

        context.fillStyle="#000";
        context.canvas.width = window.innerWidth-(window.innerWidth*.1);
        context.canvas.height = window.innerHeight-(window.innerHeight*.1);
        context.beginPath();
        var scale = 50;
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
    _drawNode() {
    	if (canvas.width < nodeLineCount*(nodeSpacing+1)) {
            nodeLineCount=1;
            nodeY++;
            if (nodeDirection==="right")
        	nodeDirection="left";
            else if (nodeDirection==="left")
                nodeDirection="right";
    	}
        else {
            if (nodeDirection==="right")
                nodeX++;
            else if (nodeDirection==="left")
                nodeX--;
        }
    	var x = nodeX*nodeSpacing;
        var y = nodeY*nodeSpacing;
        context.beginPath();
    	context.strokeStyle = "#000";
    	context.lineWidth=nodeLineWidth;
    	context.arc(x, y, nodeRadius, 0, 2 * Math.PI);
    	context.fillStyle ="#fff";
    	context.fill();
    	context.stroke();
        this.state.circlesState.push({
            id: x + "-" + y,
            x: x,
            y: y,
            radius: nodeRadius
        });
        nodeLineCount++;
        this._drawLine();
    }
    _drawLine(){
        var lineX = (nodeX*nodeSpacing)+nodeRadius;
        var lineY = (nodeY*nodeSpacing);
        context.beginPath();
        context.moveTo(lineX, lineY);
        context.lineTo(lineX + ((nodeX*nodeSpacing)-nodeRadius), lineY);
    	context.strokeStyle = "#000";
    	context.lineWidth=nodeLineWidth;
    	context.stroke();
    }
    
    render() {
        return (
            <div>
                {this.state.circlesState.map(function(circle) {
                    var circleId = circle.id;
                    return (
                        <div id={circleId+"-content"} className="dropdown-content" key={circleId+"-content"}>
                            Hello
                        </div>
                    );
                })}
            </div>
        )
    }
}

ReactDOM.render(
    <Map />,
    document.getElementById('react')
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
            $('#'+circle.id+'-content').css('left', x+20+"px");
            $('#'+circle.id+'-content').css('top', y+20+"px");
            $('#'+circle.id+'-content').css('display', 'block');
            break;
        }
    }
};

