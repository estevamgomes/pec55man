debug = false;

////////////////////////////
///// Maze Object Type /////
////////////////////////////

// nomenclatura (e.g. owt = outside wall top)
// 1) o = outside / i = inside
// 2) w = wall
// 3) t = top / b = bottom / l = left / r = right
var Maze = function(config) {
	this.tileSize = config.tileSize;
	this.tiles = [
		[ 0,  0,234, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,245, 0, 0], 
		[ 0,  0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 25, 0, 0], 
		[ 0,  0, 23,  1,134, 14, 14, 14,145,  1,334, 26, 26, 26,345,  1,134, 14, 14, 14,145,  1,134, 14, 14, 14,145,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13,134, 16, 16,156,  1, 25,  0,  0,  0, 23,  1, 13,134, 14,145, 15,  1, 13,134, 16,145, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13, 15,  1,  1,  1,  1, 25,  0,  0,  0, 23,  1, 13,136, 16,156, 15,  1, 13,136, 14,156, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13,136, 14, 14,145,  1, 25,  0,  0,  0, 23,  1, 13,134,145,134,156,  1, 13,134, 16,145, 15,  1, 25, 0, 0],
		[ 0,  0, 23,  1, 13,134, 16, 16,156,  1, 25,  0,  0,  0, 23,  1, 13, 15, 13, 15,  1,  1, 13, 13,  1, 15, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13, 15,  1,  1,  1,  1, 25,  0,  0,  0, 23,  1, 13, 15, 13,136,145,  1, 13, 13,  1, 15, 15,  1, 25, 0, 0],  
		[ 0,  0, 23,  1,136,156,  1,  1,  1,  1,336, 44,  9, 34,356,  1,136,156,136, 16,156,  1,136,156,  1,136,156,  1, 25, 0, 0], 
		[24, 24,356,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,336,24,24], 
		[ 0,  0,  1,  1,134, 14, 14, 14, 14, 14, 14, 14, 14, 14,145,  1,134, 14, 14, 14, 14, 14, 14, 14, 14, 14,145,  1, 1,  0, 0], 
		[26,345,  1,  1,136, 16, 16, 16, 16, 16, 16, 16, 16, 16,156,  1,136, 16, 16, 16, 16, 16, 16, 16, 16, 16,156,  1, 1,334,26], 
		[ 0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 1, 25, 0], 
		[ 0, 23,  1,134, 14, 14,145,  1,134, 14, 14,145,  1,134, 14, 14,145,  1,  1,134, 14, 14,145,  1,134, 14, 14,145, 1, 25, 0], 
		[ 0, 23,  1, 13,134,145, 15,  1, 13,134, 16,156,  1, 13,134, 16,156,  1,  1, 13,134, 16,156,  1, 13,134, 16,156, 1, 25, 0], 
		[ 0, 23,  1, 13,136,156, 15,  1, 13,136, 14,145,  1, 13, 15,  1,  1,  1,  1, 13,136, 14,145,  1, 13,136, 14,145, 1, 25, 0], 
		[ 0, 23,  2, 13,134, 16,156,  1, 13,134, 16,156,  1, 13, 15,  1,  1,  1,  1,136, 16,145, 15,  1,136, 16,145, 15, 3, 25, 0], 
		[ 0, 23,  1, 13, 15,  1,  1,  1, 13, 15,  1,  1,  1, 13, 15,  1,  1,  1,  1,  1,  1, 13, 15,  1,  1,  1, 13, 15, 1, 25, 0], 
		[ 0, 23,  1, 13, 15,  1,  1,  1, 13,136, 14,145,  1, 13,136, 14,145,  1,  1,134, 14,156, 15,  1,134, 14,156, 15, 1, 25, 0], 
		[ 0, 23,  1,136,156,  1,  1,  1,136, 16, 16,156,  1,136, 16, 16,156,  1,  1,136, 16, 16,156,  1,136, 16, 16,156, 1, 25, 0], 
		[ 0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 1, 25, 0], 
		[ 0,236, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,26, 26, 26, 26,256, 0], 
	];

	// funcoes para desenhar o tabuleiro
	this.strkW = 2;
	this.strkoffst = ceil(this.strkW / 2);
	this.spriteSVG = loadShape("../img/icones.svg");

	this.drawCorner = function() {
		arc(0, 0, this.tileSize, this.tileSize, PI, 1.5 * PI);
	}

	this.drawWall = function() {
		line(0, -this.tileSize / 2, 0, this.tileSize / 2);
	}

	this.drawDoubleCorner = function() {
		arc(-this.tileSize / 2 + this.strkoffst, -this.tileSize / 2 + this.strkoffst, (this.tileSize - this.strkoffst) * 2, (this.tileSize - this.strkoffst) * 2, PI, 1.5 * PI);
		this.drawCorner();
	}

	this.drawDoubleCornerB = function() {
		arc(this.tileSize / 2 - this.strkoffst, this.tileSize / 2 - this.strkoffst, this.strkoffst * 2, this.strkoffst * 2, PI, 1.5 * PI);
		this.drawCorner();
	}

	this.drawDoubleWall = function() {
		line(-this.tileSize / 2 + this.strkoffst, -this.tileSize / 2, -this.tileSize / 2 + this.strkoffst, this.tileSize / 2);
		this.drawWall();
	}

	this.drawEndDoubleWall = function() {
		this.drawDoubleWall();
		line(0, this.tileSize / 2, -this.tileSize / 2 + this.strkoffst, this.tileSize / 2);
	}

	this.drawEndDoubleWallB = function() {
		this.drawDoubleWall();
		line(0, -this.tileSize / 2, -this.tileSize / 2 + this.strkoffst, -this.tileSize / 2);
	}

	// pontos
	this.score = 0;
};

Maze.prototype.draw = function (data) {
	pacmanTile = {
		x: floor((data.pacmanPos.x + (this.tileSize / 2)) / this.tileSize),
		y: floor((data.pacmanPos.y + (this.tileSize / 2)) / this.tileSize),
	};

	// display de pontos
	fill(220, 0, 0);
	textSize(16);
	textAlign(LEFT, TOP);
	text("-R$" + this.score + ",00", 2  * this.tileSize, (this.tiles.length + 1) * this.tileSize);

	for (int i = 0; i < this.tiles.length; i++) {
		for (int j = 0; j < this.tiles[i].length; j++) {
			var tiley = i * tileSize;
			var tilex = j * tileSize;
			var tileCenterY = tiley + tileSize / 2;
			var tileCenterX = tilex + tileSize / 2;

			// grid
			if(debug) {
				stroke(50);
				noFill();
				rectMode(CORNER);
				strokeWeight(1)
				rect(tilex, tiley, this.tileSize, this.tileSize);
			}

			// destaque pro quadrado do pac man
			if(pacmanTile.x == j && pacmanTile.y == i) {
				if(debug) {
					noStroke();
					fill(255, 50);
					pushMatrix();
					translate(tilex, tiley);
					rectMode(CORNER);
					rect(0, 0, this.tileSize, this.tileSize);
					popMatrix();
				}
				// se o pacman passa por cima do cifrão ele adiciona pontos e some
				if(this.tiles[i][j] == 1) {
					this.tiles[i][j] = 0;
					this.score += 1000;
				}
				if(this.tiles[i][j] == 2) { // educacao
					this.tiles[i][j] = 0;
					paused = true;
					educacao = true;
				}
				if(this.tiles[i][j] == 3) {
					this.tiles[i][j] = 0;
					paused = true;
					saude = true;
				}
			}

			// labirinto
			stroke(0,0,255);
			noFill();
			strokeWeight(this.strkW);
			strokeCap(SQUARE);
			ellipseMode(CORNER);
			pushMatrix();
			translate(tileCenterX, tileCenterY);
			var corPontos = color(110, 200, 150);
			switch(this.tiles[i][j]) {
				// moeda
				case 1:
					fill(corPontos);
					textSize(8);
					textAlign(CENTER, CENTER);
					text("$", 0, 0);
					break;

				// educacao
				case 2:
					noStroke();
					fill(corPontos);
					this.spriteSVG.getChild('educacao').disableStyle();
					shape(this.spriteSVG.getChild('educacao'), -this.spriteSVG.width / 2, -this.spriteSVG.height / 2);
					break;

				// saude
				case 3:
					noStroke();
					fill(corPontos);
					this.spriteSVG.getChild('saude').disableStyle();
					shape(this.spriteSVG.getChild('saude'), -this.spriteSVG.width / 2, -this.spriteSVG.height / 2);
					break;

				// saida
				case 9:
					stroke(255, 200, 200);
					rotate(radians(90));
					this.drawWall();
					break;

				// parede dupla
				case 23: // parede dupla esquerda
					this.drawDoubleWall();
					break;
				case 24: // parede dupla superior
					rotate(radians(90));
					this.drawDoubleWall();
					break;
				case 25: // parede dupla direita
					rotate(radians(180));
					this.drawDoubleWall();
					break;
				case 26: // parede dupla inferior
					rotate(radians(270));
					this.drawDoubleWall();
					break;
				case 234: // parede dupla superior esquerda
					this.drawDoubleCorner();
					break;
				case 236: // parede dupla inferior esquerda
					rotate(radians(270));
					this.drawDoubleCorner();
					break;
				case 256: // parede dupla inferior direita
					rotate(radians(180));
					this.drawDoubleCorner();
					break;
				case 245: // parede dupla superior direita
					rotate(radians(90));
					this.drawDoubleCorner();
					break;

				// parede dupla com lateral direita fechada
				case 33: // parede dupla esquerda
					this.drawEndDoubleWall();
					break;
				case 34: // parede dupla superior
					rotate(radians(90));
					this.drawEndDoubleWall();
					break;
				case 35: // parede dupla direita
					rotate(radians(180));
					this.drawEndDoubleWall();
					break;
				case 36: // parede dupla inferior
					rotate(radians(270));
					this.drawEndDoubleWall();
					break;

				// parede dupla com lateral esquerda fechada
				case 43: // parede dupla esquerda
					this.drawEndDoubleWallB();
					break;
				case 44: // parede dupla superior
					rotate(radians(90));
					this.drawEndDoubleWallB();
					break;
				case 45: // parede dupla direita
					rotate(radians(180));
					this.drawEndDoubleWallB();
					break;
				case 46: // parede dupla inferior
					rotate(radians(270));
					this.drawEndDoubleWallB();
					break;

				// parede dupla reduzida
				case 334: // parede dupla superior esquerda
					this.drawDoubleCornerB();
					break;
				case 336: // parede dupla inferior esquerda
					rotate(radians(270));
					this.drawDoubleCornerB();
					break;
				case 356: // parede dupla inferior direita
					rotate(radians(180));
					this.drawDoubleCornerB();
					break;
				case 345: // parede dupla superior direita
					rotate(radians(90));
					this.drawDoubleCornerB();
					break;

				// parede simples
				case 13: // parede esquerda
					this.drawWall();
					break;
				case 14: // parede superior
					rotate(radians(90));
					this.drawWall();
					break;
				case 15: // parede direita
					rotate(radians(180));
					this.drawWall();
					break;
				case 16: // parede inferior
					rotate(radians(270));
					this.drawWall();
					break;
				case 134: // parede superior esquerda
					this.drawCorner();
					break;
				case 136: // parede inferior esquerda
					rotate(radians(270));
					this.drawCorner();
					break;
				case 156: // parede inferior direita
					rotate(radians(180));
					this.drawCorner();
					break;
				case 145: // parede superior direita
					rotate(radians(90));
					this.drawCorner();
					break;
			}
			popMatrix();
		}
	}
}


//////////////////////////////
///// Pacman Object Type /////
//////////////////////////////

var Pacman = function(config) {
	this.tileSize = config.tileSize;
	this.sizeExtra = this.tileSize * 0.4;
	this.size = this.tileSize + this.sizeExtra;

	this.tilePos = {
		x: config.tilex || 12,
		y: config.tiley || 5,
	};

	this.pos = {
		x: this.tilePos.x * this.tileSize,
		y: this.tilePos.y * this.tileSize
	};

	this.lastAct = config.act || 'stop';
	this.act = config.act || 'stop';
	this.speed = constrain(this.tileSize / config.speed, 1, this.tileSize) || this.tileSize / 6; // tem q ser um multiplo do tile size
};

Pacman.prototype.draw = function () {	
	pushMatrix();
	translate(round(this.pos.x + (this.size - this.sizeExtra) / 2), round(this.pos.y + (this.size - this.sizeExtra) / 2));
	
	// roda o desenho para a direção certa
	switch (this.lastAct) {
		case 'up':
			rotate(radians(90));
			scale(-1, 1);
			break;
		case 'down':
			rotate(radians(90));
			break;
		case 'left':
			scale(-1, 1);
			break;
		case 'right':
			rotate(radians(0));
			break;
	}
	
	var speedSteps = this.tileSize / this.speed; // número de passos que o pacman dá em cada quadrado
	var maxRemainder = this.speed * (speedSteps - 1); // máximo resto possível da divisão
	// posicao relativa ao tile
	if(this.lastAct == 'up' || this.lastAct == 'down') {
		var pacmanTilePos = this.pos.y % this.tileSize;		
	} else {
		var pacmanTilePos = this.pos.x % this.tileSize;
	}	
	var mouthDegree = map(cos(map(pacmanTilePos, 0, maxRemainder, 0, PI * 2)), -1, 1, 0, 50); // abertura da boca (em graus)

	// desenha a base do pacman
	noStroke();
	ellipseMode(CENTER);

	fill(255, 230, 0);
	arc(0, 0, this.size, this.size,             PI * 0.5, PI * 1.5);
	arc(0, 0, this.size, this.size, radians(mouthDegree), PI * 0.5);
	arc(0, 0, this.size, this.size,             PI * 1.5, PI * 2 - radians(mouthDegree));

	// o quad() a seguir é para tampar um pedaço do desenho e aumentar a boca para além do centro do pacman
	var centerPos = {
		x: (this.size - this.sizeExtra) / 2,
		y: (this.size - this.sizeExtra) / 2
	}
	var p1 = {
		x: cos(radians(mouthDegree)) * this.size / 2,
		y: sin(radians(mouthDegree)) * this.size / 2,
	};
	var p2 = {
		x: cos(radians(mouthDegree)) * this.size / 2,
		y: -sin(radians(mouthDegree)) * this.size / 2,
	};
	fill(0);
	quad(p1.x, p1.y, 1, 1, p2.x, p2.y, -this.size * 0.15, 0);

	// se o número de passos que o pacman dá dentro de um quadrado for par, a boca não fecha completamente
	// isso ocorre pq o vale da função cos seria metade de PI
	// mas não tem um número exatamente na metade
	// para corrigir esse problema, quando o a abertura da boca é menor que 5 graus um círculo é desenhado por cima
	if(mouthDegree < 5) {
		fill(255, 230, 0);
		ellipse(0, 0, this.size, this.size);
	}	

	// bandeira e texto 55
	fill(255);
	rectMode(CORNER);
	var flagSize = {w: 18, h: 11};
	var flagstaffSize = {w: 3, h: this.size * 0.6};
	fill(220, 0, 0);
	// bandeira
	translate(-this.size / 2 - flagSize.w, -this.size * 0.5);
	rect(0, 0, flagSize.w, flagSize.h);
	// mastro da bandeira
	rect(flagSize.w, 0, flagstaffSize.w, flagstaffSize.h);

	fill(255);
	textSize(8);
	textAlign(LEFT, TOP);
	translate(2, 2);
	if(this.lastAct == 'left' || this.lastAct == 'up') {
		scale(-1, 1);
		textAlign(RIGHT, TOP);
	}
	text("55", 0, 0);
	popMatrix();

	// dados para debug
	if(debug) {
		strokeWeight(1);
		stroke(255,0,0);
		line(this.pos.x - 5, this.pos.y, this.pos.x + 5, this.pos.y);
		line(this.pos.x, this.pos.y - 5, this.pos.x, this.pos.y + 5);
	}
}

Pacman.prototype.tryToMove = function (data) { // data = mazeTiles

	var nextPos = {
		x: this.pos.x,
		y: this.pos.y,
	};

	switch (data.lastAct) {
		case 'up':
			nextPos.y = this.pos.y - this.speed;
			break;
		case 'down':
			nextPos.y = this.pos.y + this.speed;
			break;
		case 'left':
			nextPos.x = this.pos.x - this.speed;
			break;
		case 'right':
			nextPos.x = this.pos.x + this.speed;
			break;
	}

	if(nextPos.y < floor(nextPos.y / this.tileSize) * this.tileSize + this.speed) {
		nextPos.y = floor(nextPos.y);
	} else if(nextPos.y > (floor(nextPos.y / this.tileSize) + 1) * this.tileSize - this.speed) {
		nextPos.y = ceil(nextPos.y);
	}

	if(nextPos.x < floor(nextPos.x / this.tileSize) * this.tileSize + this.speed) {
		nextPos.x = floor(nextPos.x);
	} else if(nextPos.x > (floor(nextPos.x / this.tileSize) + 1) * this.tileSize - this.speed) {
		nextPos.x = ceil(nextPos.x);
	}



	// LIMITES DA TELA //

	var maxTileY = data.mazeTiles.length - 1;
	var maxTileX = data.mazeTiles[0].length - 1;

	// se o pacman passar dos limites da tela ele aparece do outro lado
	if(nextPos.x >= maxTileX * this.tileSize) {
		nextPos.x = 0;
	} else if(nextPos.x <= 0) {
		nextPos.x = maxTileX * this.tileSize;
	}

	if(nextPos.y >= maxTileY * this.tileSize) {
		nextPos.y = 0;
	} else if(nextPos.y <= 0) {
		nextPos.y = maxTileY * this.tileSize;
	}

	// COLISÃO COM O TABULEIRO //

	// verifica de qual o próximo tile
	var nextTile = {
		x: (nextPos.x > this.pos.x) ? floor((nextPos.x + this.tileSize - 1) / this.tileSize) : floor(nextPos.x / this.tileSize),
		y: (nextPos.y > this.pos.y) ? floor((nextPos.y + this.tileSize - 1) / this.tileSize) : floor(nextPos.y / this.tileSize),
	};
	// verifica se o próximo tile está livre
	var nextTileWalkable = (data.mazeTiles[nextTile.y][nextTile.x] < 10) ? true : false;
	if(data.mazeTiles[nextTile.y][nextTile.x] == 9 && data.lastAct == 'up') nextTileWalkable = false; // ele não pode voltar pela porta para dentro do 'O'


	// MOVIMENTO //

	// quer se mover no eixo x
	if(nextPos.x != this.pos.x) {
		// muda de direção apenas se estiver alinhado no grid
		if(nextPos.y % this.tileSize == 0 && nextTileWalkable) {
			this.pos.x = nextPos.x;
			return true;
		} else {
			return false;
		}
	}

	// quer se mover no eixo y
	if(nextPos.y != this.pos.y) {
		// muda de direção apenas se estiver alinhado no grid
		if(nextPos.x % this.tileSize == 0 && nextTileWalkable) {
			this.pos.y = nextPos.y;
			return true;
		} else {
			return false;
		}
	}
}

// data precisa do labirinto com o nome 'mazeTiles'
// data precisa da posicao do tile a ser verificado
// retorna o conteúdo do tile
Pacman.prototype.checkTile = function(data) { 
	var maxTileY = data.mazeTiles.length - 1;
	var maxTileX = data.mazeTiles[0].length - 1;

	data.tilePos.x = constrain(data.tilePos.x, 0, maxTileX);
	data.tilePos.y = constrain(data.tilePos.y, 0, maxTileY);

	return data.mazeTiles[data.tilePos.y][data.tilePos.x];
}

Pacman.prototype.checkUpTile = function(data) { 
	data.tilePos.y -= 1;
	return this.checkTile(data);
}

Pacman.prototype.checkDownTile = function(data) { 
	data.tilePos.y += 1;
	return this.checkTile(data);
}

Pacman.prototype.checkLeftTile = function(data) { 
	data.tilePos.y -= 1;
	return this.checkTile(data);
}

Pacman.prototype.checkRightTile = function(data) { 
	data.tilePos.y += 1;
	return this.checkTile(data);
}

Pacman.prototype.getTilePos = function (pos) {
	var tilePos = {
		x: floor((pos.x + (this.tileSize / 2)) / this.tileSize),
		y: floor((pos.y + (this.tileSize / 2)) / this.tileSize),
	};
	return tilePos;
}

Pacman.prototype.hitTest = function(pos) {
	pacmanTile = this.getTilePos(this.pos);
	checkTile = this.getTilePos(pos);
	return (pacmanTile.x == checkTile.x && pacmanTile.y == checkTile.y) ? true : false;
}

Pacman.prototype.update = function (data) {
	// AI - muda a direcao em relação ao dinheiro nos tiles adjacentes
	pacmanTile = this.getTilePos(this.pos);
	data.tilePos = pacmanTile;
	if(this.checkUpTile(data) == 1) {
		this.act = 'up';
	} else if(this.checkRightTile(data) == 1) {
		this.act = 'right';
	} else if(this.checkDownTile(data) == 1) {
		this.act = 'down';
	} else if(this.checkLeftTile(data) == 1) {
		this.act = 'left';
	}
	// fim AI


	data.lastAct = this.act;
	var move = this.tryToMove(data); // verifica se é possível mover usando o novo comando

	if(move) { // se for possível mover atualiza o último comando
		this.lastAct = this.act;
	} else { // se não possível mover usando o novo comando tenta se movimentar pelo último comando
		data.lastAct = this.lastAct;
		move = this.tryToMove(data);

		// AI
		if(!move) { // se não for possível mover para o sentido que ele estava movendo ele procura uma direção randomicamente
			var possibleAct = {'up', 'left', 'down', 'right'};
			var attempts = 0;
			while (!move) {
				data.lastAct = possibleAct[int(random(0,possibleAct.length))];
				move = this.tryToMove(data);
				attempts++;
				if(attempts > 10) move = true;
			}
			this.act = data.lastAct;
			this.lastAct = data.lastAct;
		}
	}
}

/////////////////////////////////
///// Protester Object Type /////
/////////////////////////////////
var Protester = function(config) {
	this.tileSize = config.tileSize;
	this.spriteSVG = loadShape("../img/protester.svg");
	this.sizeExtra = (this.spriteSVG.width - this.tileSize) / 2;
	this.size = this.tileSize + this.sizeExtra;

	this.tilePos = {
		x: config.tilex || 4,
		y: config.tiley || 1,
	};

	this.pos = {
		x: this.tilePos.x * this.tileSize,
		y: this.tilePos.y * this.tileSize
	};

	this.lastAct = 'stop';
	this.act = 'stop';
	this.speed = constrain(this.tileSize / config.speed, 1, this.tileSize) || this.tileSize / 8; // tem q ser um multiplo do tile size

};

Protester.prototype.draw = function () {	
	pushMatrix();
	translate(round(this.pos.x + (this.size - this.sizeExtra) / 2), round(this.pos.y + (this.size - this.sizeExtra) / 2));

	// roda o desenho para a direção certa
	switch (this.lastAct) {
		case 'up':
			break;
		case 'down':
			break;
		case 'left':
			scale(-1, 1);
			break;
		case 'right':
			break;
	}
	
	var speedSteps = this.tileSize / this.speed; // número de passos que o pacman dá em cada quadrado
	var maxRemainder = this.speed * (speedSteps - 1); // máximo resto possível da divisão
	// posicao relativa ao tile
	if(this.lastAct == 'up' || this.lastAct == 'down') {
		var protesterTilePos = this.pos.y % this.tileSize;	
		var shapeName = 'ns';	
	} else {
		var protesterTilePos = this.pos.x % this.tileSize;
		var shapeName = 'we';
	}
	var step = floor(map(protesterTilePos, 0, maxRemainder, 1, 5)); // abertura da boca (em graus)

	shape(this.spriteSVG.getChild(shapeName+step), - this.size / 2, - this.size / 2, this.size, this.size);

	popMatrix();
}

Protester.prototype.tryToMove = function (data) { // data = mazeTiles

	var nextPos = {
		x: this.pos.x,
		y: this.pos.y,
	};

	switch (data.lastAct) {
		case 'up':
			nextPos.y = this.pos.y - this.speed;
			break;
		case 'down':
			nextPos.y = this.pos.y + this.speed;
			break;
		case 'left':
			nextPos.x = this.pos.x - this.speed;
			break;
		case 'right':
			nextPos.x = this.pos.x + this.speed;
			break;
	}

	if(nextPos.y < floor(nextPos.y / this.tileSize) * this.tileSize + this.speed) {
		nextPos.y = floor(nextPos.y);
	} else if(nextPos.y > (floor(nextPos.y / this.tileSize) + 1) * this.tileSize - this.speed) {
		nextPos.y = ceil(nextPos.y);
	}

	if(nextPos.x < floor(nextPos.x / this.tileSize) * this.tileSize + this.speed) {
		nextPos.x = floor(nextPos.x);
	} else if(nextPos.x > (floor(nextPos.x / this.tileSize) + 1) * this.tileSize - this.speed) {
		nextPos.x = ceil(nextPos.x);
	}



	// LIMITES DA TELA //

	var maxTileY = data.mazeTiles.length - 1;
	var maxTileX = data.mazeTiles[0].length - 1;

	// se o pacman passar dos limites da tela ele aparece do outro lado
	if(nextPos.x >= maxTileX * this.tileSize) {
		nextPos.x = 0;
	} else if(nextPos.x <= 0) {
		nextPos.x = maxTileX * this.tileSize;
	}

	if(nextPos.y >= maxTileY * this.tileSize) {
		nextPos.y = 0;
	} else if(nextPos.y <= 0) {
		nextPos.y = maxTileY * this.tileSize;
	}

	// COLISÃO COM O TABULEIRO //

	// verifica de qual o próximo tile
	var nextTile = {
		x: (nextPos.x > this.pos.x) ? floor((nextPos.x + this.tileSize - 1) / this.tileSize) : floor(nextPos.x / this.tileSize),
		y: (nextPos.y > this.pos.y) ? floor((nextPos.y + this.tileSize - 1) / this.tileSize) : floor(nextPos.y / this.tileSize),
	};
	// verifica se o próximo tile está livre
	var nextTileWalkable = (data.mazeTiles[nextTile.y][nextTile.x] < 9) ? true : false;


	// MOVIMENTO //

	// quer se mover no eixo x
	if(nextPos.x != this.pos.x) {
		// muda de direção apenas se estiver alinhado no grid
		if(nextPos.y % this.tileSize == 0 && nextTileWalkable) {
			this.pos.x = nextPos.x;
			return true;
		} else {
			return false;
		}
	}

	// quer se mover no eixo y
	if(nextPos.y != this.pos.y) {
		// muda de direção apenas se estiver alinhado no grid
		if(nextPos.x % this.tileSize == 0 && nextTileWalkable) {
			this.pos.y = nextPos.y;
			return true;
		} else {
			return false;
		}
	}

}

Protester.prototype.update = function (data) {
	data.lastAct = this.act;
	var move = this.tryToMove(data); // verifica se é possível mover usando o novo comando

	if(move) { // se for possível atualiza o último comando
		this.lastAct = this.act;
	} else { // se não possível mover usando o novo comando tenta se movimentar pelo último comando
		data.lastAct = this.lastAct;
		this.tryToMove(data);
	}
}

////////////////////////
///// MAIN PROGRAM /////
////////////////////////

/* @pjs preload="../img/protester-01.png"; */

var tileSize = 20;
var paused = false;
var gameover = false;
var saude = false;
var educacao = false;
var pauseWarningPrinted = false;

size(tileSize * 31, tileSize * 26);
background(0);
PFont fontA = createFont("Press Start 2P");
textFont(fontA, 16);
noStroke();

long lastUpdate = 0;

var pacman = new Pacman({
	tileSize: tileSize,
	act: 'down'
});

var protester = new Protester({
	tileSize: tileSize,
});

var maze = new Maze({
	tileSize: tileSize,
});


draw = function() {

	////////////////////
	///// CONTROLE /////
	////////////////////
	if (keyPressed) {
		switch (keyCode) {
			case UP :
				protester.act = 'up';
				break;	
			case DOWN :
				protester.act = 'down';
				break;	
			case LEFT :
				protester.act = 'left';
				break;		
			case RIGHT :
				protester.act = 'right';
				break;				
		}
		if((paused && educacao) || (paused && saude)) {
			paused = false;
			educacao = false;
			saude = false;
		}
	}

	if(focused && !paused) {
		background(0);
		// velocidade
		if((millis() - lastUpdate) >= 16) { // 60 fram
			pacman.update({mazeTiles: maze.tiles});
			protester.update({mazeTiles: maze.tiles});
			lastUpdate = millis();
		}

		if(pacman.hitTest(protester.pos)) {
			paused = true;
			gameover = true;
		}

		pushMatrix();
		translate(0, tileSize);
		maze.draw({
			pacmanPos: pacman.pos
		});	
		pacman.draw();
		protester.draw();

		popMatrix();

		pauseWarningPrinted = false;

	} else if(!pauseWarningPrinted) {
		fill(255);
		textSize(16);
		textAlign(CENTER, BOTTOM);
		if(gameover) {
			background(0);
			text("PARABÉNS!\n\nCom a sua ajuda a PEC 55\nfoi barrada neste jogo.\n\nAgora é de fazer o\nmesmo na vida real!\n\nOcupe as ruas da sua\ncidade no dia 13/12!", width/2, height * 2/3);
		} else if(educacao) {
			text("Se a PEC 55 estivesse em vigor\nentre 2002 e 2015, o investimento\nem educação seria 47% menor, ou\nseja, R$ 268,8 bilhões a menos.", width/2, height * 2/3);
		} else if(saude) {
			text("Com a PEC, estima-se que a\nsaúde pública deixaria de\nreceber R$ 424 bilhões nos\npróximos 20 anos.", width/2, height * 2/3);
		} else {
			text("PAUSADO", width/2, height * 2/3);
		}
		fill(255, 230, 0);
		textAlign(CENTER, TOP);
		text("Clique no jogo\npara iniciar", width/2, height * 2/3 + 30);
		pauseWarningPrinted = true;
	}

}