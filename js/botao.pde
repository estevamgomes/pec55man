
//////////////////////////////
///// Button Object Type /////
//////////////////////////////

// armazenas as variaveis
var Button = function(config) {
	// posicao
	this.x = config.x || 0;
	this.y = config.y || 0;
	this.label = config.label || "Click";
	this.width = config.width || this.label.length*15+20;
	this.height = config.height || 40;

	//cores
	this.colorBgDefault = config.colorBgDefault || color(255, 255, 255);
	this.colorBgActive = config.colorBgActive || color(0, 0, 180);
	this.colorBgHover = config.colorBgHover || color(0, 0, 255);
	this.colorTxtDefault = config.colorTxtDefault || color(0, 0, 0);
	this.colorTxtHover = config.colorTxtHover || color(255, 255, 255);

	// funcoes
	this.onClick = config.onClick || function() {};
};

// desenha o botao
Button.prototype.draw = function() {
	state = 'default';

	if (this.isMouseInside() && mousePressed) {
		state = 'active';
	} else if (this.isMouseInside()) {
		state = 'hover';
	}

	switch (state) {
		case 'hover':
			colorBg = this.colorBgHover;
			colorTxt = this.colorTxtHover;
			break;
		case 'active':
			colorBg = this.colorBgActive;
			break;
		default :
			colorBg = this.colorBgDefault;
			colorTxt = this.colorTxtDefault;
			break;			
	}

	fill(colorBg);
	rectMode(CENTER);
	rect(this.x, this.y, this.width, this.height);
	fill(colorTxt);
	textSize(16);
	textAlign(CENTER, CENTER);
	text(this.label, this.x, this.y);
};

// verifica se o mouse esta sobre o botao
Button.prototype.isMouseInside = function() {
	return mouseX > (this.x - this.width/2) &&
		   mouseX < (this.x + this.width/2) &&
		   mouseY > (this.y - this.height/2) &&
		   mouseY < (this.y + this.height/2);
};

// executa a funcao caso o botao seja clicado
Button.prototype.handleMouseClick = function() {
	if (this.isMouseInside()) {
		this.onClick();
	}
};

////////////////////////
///// MAIN PROGRAM /////
////////////////////////

/* @pjs font="font/joystix-monospace.ttf"; */
size(400,400);
background(0);
PFont fontA = createFont("Joystix Monospace");
textFont(fontA, 16);
noStroke();

var btn1 = new Button({
	x: width/2,
	y: height/2,
	label: "iniciar",
	onClick: function() {
		alert('teste');
	}
});

draw = function() {

	background(0);

	btn1.draw();

	fill(255);
	text("pressione espaço para", width/2, height/2 - 40);


	////////////////////
	///// CONTROLE /////
	////////////////////

	if (keyPressed) {
		// console.log(keyCode);
		if (keyCode == UP) {
			console.log('up');
		} else if (keyCode == DOWN) {
			console.log('down');
		}
	}
}

mouseClicked = function() {
	btn1.handleMouseClick();
};