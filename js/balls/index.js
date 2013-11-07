// try to change random stuff below, or search for the word "example"

function Node () {
    this.left = 0;
    this.top = 0;
    this.vx = 0;
    this.vy = 0;
    this.ax = 0;
    this.ay = 0;
    this.radius = 0;
    this.color = 'rgb(0,225,192)';
}

Node.prototype.Display = function() {
	function r ( node ) {
		//
		// example:
		// edit this formula to change your balls' size
		//
		return node.radius * 0.75;
	}
    context.beginPath();
    context.arc(this.left, this.top, r( this ), 0, Math.PI*2, false);
	
	//
	// example:
	// edit this to change the color of your balls
	//
    context.fillStyle = this.color;
//	context.fillStyle = 'rgba(255,120,0,0.4)';

    context.fill();
};

function Nodes (num) {
	this.n = Array(num);

	for (var i=0; i<this.n.length; i++){
		this.n[i] = new Node();
		this.n[i].left = Math.floor(Math.random() * canvas.width);
		this.n[i].top = Math.floor(Math.random() * canvas.height);
		this.n[i].vx = Math.random() - 0.5;
		this.n[i].vy = Math.random() - 0.5;
		this.n[i].ax = (Math.random() - 0.5) * 0.25;
		this.n[i].ay = (Math.random() - 0.5) * 0.25;
		this.n[i].radius = Math.floor(Math.random() * 20) + 1;
		this.n[i].color = 'rgba(0,' + Math.floor(Math.random() * 192 + 32) + ',' +
                          Math.floor(Math.random() * 240 + 32) + ',0.6)';
	}
}

Nodes.prototype.Step = function(time) {
	for (var i=0; i<this.n.length; i++){
		this.n[i].vx = this.n[i].vx ;//+ this.n[i].ax * time;
		this.n[i].vy = this.n[i].vy ;//+ this.n[i].ay * time;
		this.n[i].left = this.n[i].left + this.n[i].vx * time;
		this.n[i].top = this.n[i].top + this.n[i].vy * time;

		this.n[i].ax = 0;
		this.n[i].ay = 0;

		if (this.n[i].left > canvas.width){
			this.n[i].vx *= -1;
			this.n[i].vy *= +1;
		}
		if (this.n[i].left < 0){
			this.n[i].vx *= -1;
			this.n[i].vy *= +1;
		}
		if (this.n[i].top > canvas.height){
			this.n[i].vx *= +1;
			this.n[i].vy *= -1;
		}
		if (this.n[i].top < 0){
			this.n[i].vx *= +1;
			this.n[i].vy *= -1;
		}
	}
};

Nodes.prototype.Display = function() {
	for (var i=0; i<this.n.length; i++){
		this.n[i].Display();
	}
	
	// http://code.google.com/p/android/issues/detail?id=35474
	canvas.style.opacity=0.99;
	setTimeout(/* @disable-livecoding */ function () {
		canvas.style.opacity=1;
	}, 0);
};

var width = window.innerWidth;
var height = window.innerHeight;

var canvas = document.getElementById( 'canvas' );
canvas.width = width;
canvas.height = height;

var context = canvas.getContext( '2d' );

var ns = new Nodes(100);

setInterval( function () {
    context.clearRect(0,0,canvas.width,canvas.height);

    ns.Display();

	//
	// example:
	// change this to run the simulation at different time rate
	//
    ns.Step(10);
//	ns.Step(-2);
    
}, 25 );

// @code-update
function codeUpdateTest (e) {
	console.log("Yay, code update! New code is available :)");
}

/** @asset-update
 */
function test(e) {
	console.log("Yay, asset update! In " + e.sources);
}
