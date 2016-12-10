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
	this.maze01 = [
		[ 0,  0,234, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24,245, 0, 0], 
		[ 0,  0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 25, 0, 0], 
		[ 0,  0, 23,  1,134, 14, 14, 14,145,  1,334, 26, 26, 26,345,  1,134, 14, 14, 14,145,  1,134, 14, 14, 14,145,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13,134, 16, 16,156,  1, 25,  8,  8,  8, 23,  1, 13,134, 14,145, 15,  1, 13,134, 16,145, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13, 15,  1,  1,  1,  1, 25,  8,  8,  8, 23,  1, 13,136, 16,156, 15,  1, 13,136, 14,156, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  3, 13,136, 14, 14,145,  1, 25,  8,  8,  8, 23,  1, 13,134,145,134,156,  1, 13,134, 16,145, 15,  2, 25, 0, 0],
		[ 0,  0, 23,  1, 13,134, 16, 16,156,  1, 25,  8,  8,  8, 23,  1, 13, 15, 13, 15,  1,  1, 13, 13,  1, 15, 15,  1, 25, 0, 0], 
		[ 0,  0, 23,  1, 13, 15,  1,  1,  1,  1, 25,  8,  8,  8, 23,  1, 13, 15, 13,136,145,  1, 13, 13,  1, 15, 15,  1, 25, 0, 0],  
		[ 0,  0, 23,  1,136,156,  1,  1,  1,  1,336, 44,  9, 34,356,  1,136,156,136, 16,156,  1,136,156,  1,136,156,  1, 25, 0, 0], 
		[24, 24,356,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,336,24,24], 
		[ 8,  8,  1,  1,134, 14, 14, 14, 14, 14, 14, 14, 14, 14,145,  1,134, 14, 14, 14, 14, 14, 14, 14, 14, 14,145,  1, 1,  8, 8], 
		[26,345,  1,  1,136, 16, 16, 16, 16, 16, 16, 16, 16, 16,156,  1,136, 16, 16, 16, 16, 16, 16, 16, 16, 16,156,  1, 1,334,26], 
		[ 0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 1, 25, 0], 
		[ 0, 23,  1,134, 14, 14,145,  1,134, 14, 14,145,  1,134, 14, 14,145,  1,  1,134, 14, 14,145,  1,134, 14, 14,145, 1, 25, 0], 
		[ 0, 23,  1, 13,134,145, 15,  1, 13,134, 16,156,  1, 13,134, 16,156,  1,  1, 13,134, 16,156,  1, 13,134, 16,156, 1, 25, 0], 
		[ 0, 23,  1, 13,136,156, 15,  1, 13,136, 14,145,  1, 13, 15,  1,  1,  1,  1, 13,136, 14,145,  1, 13,136, 14,145, 1, 25, 0], 
		[ 0, 23,  2, 13,134, 16,156,  1, 13,134, 16,156,  1, 13, 15,  1,  0,  1,  1,136, 16,145, 15,  1,136, 16,145, 15, 3, 25, 0], 
		[ 0, 23,  1, 13, 15,  1,  1,  1, 13, 15,  1,  1,  1, 13, 15,  1,  1,  1,  1,  1,  1, 13, 15,  1,  1,  1, 13, 15, 1, 25, 0], 
		[ 0, 23,  1, 13, 15,  1,  1,  1, 13,136, 14,145,  1, 13,136, 14,145,  1,  1,134, 14,156, 15,  1,134, 14,156, 15, 1, 25, 0], 
		[ 0, 23,  1,136,156,  1,  1,  1,136, 16, 16,156,  1,136, 16, 16,156,  1,  1,136, 16, 16,156,  1,136, 16, 16,156, 1, 25, 0], 
		[ 0, 23,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1, 1, 25, 0], 
		[ 0,236, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26, 26,26, 26, 26, 26,256, 0], 
	];
	this.copyTiles = function(obj) {
		if (Object.prototype.toString.call(obj) === '[object Array]') {
			var out = [], i = 0, len = obj.length;
			for ( ; i < len; i++ ) {
				out[i] = arguments.callee(obj[i]);
			}
			return out;
		}
		if (typeof obj === 'object') {
			var out = {}, i;
			for ( i in obj ) {
				out[i] = arguments.callee(obj[i]);
			}
			return out;
		}
		return obj;
	}
	this.tiles = this.copyTiles(this.maze01);

	// funcoes para desenhar o tabuleiro
	this.strkW = 2; // espessura da linha da parede
	this.strkoffst = ceil(this.strkW / 2); // distancia que a linha deve ficar para não ser cortada
	this.spriteSVG = loadShape("img/icones.svg"); // icones usados como bônus
	this.colors = config.colors;

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
};

Maze.prototype.restart = function(data) {
	this.tiles = this.copyTiles(this.maze01);
}

Maze.prototype.countdown = function() {
	var countdown = 0;
	for (i = 0; i < this.tiles.length; i++) {
		for (j = 0; j < this.tiles[i].length; j++) {
			if(this.tiles[i][j] < 8 && this.tiles[i][j] > 0) {
				countdown += 1;
			}
		}
	}
	return countdown;
}

Maze.prototype.updateTile = function(tilex, tiley, value) {
	this.tiles[tiley][tilex] = value;
}

Maze.prototype.draw = function() {

	for (i = 0; i < this.tiles.length; i++) {
		for (j = 0; j < this.tiles[i].length; j++) {
			var tiley = i * tileSize;
			var tilex = j * tileSize;
			var tileCenterY = tiley + tileSize / 2;
			var tileCenterX = tilex + tileSize / 2;

			// debug: grid para ajudar a debugar
			if(debug) {
				stroke(50);
				noFill();
				rectMode(CORNER);
				strokeWeight(1)
				rect(tilex, tiley, this.tileSize, this.tileSize);
			}

			// labirinto
			noFill();

			stroke(this.colors.purple);
			strokeWeight(this.strkW);
			strokeCap(SQUARE);

			ellipseMode(CORNER);

			pushMatrix();
			translate(tileCenterX, tileCenterY);
			shapeMode(CORNER);
			var corPontos = this.colors.pink;
			switch(this.tiles[i][j]) {
				// moeda
				case 1:
					fill(this.colors.blue);
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

				// saida do O
				case 9:
					stroke(this.colors.pink);
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

	this.startTilePos = {
		x: config.tilex || 12,
		y: config.tiley || 5,
	};

	this.pos = {
		x: this.startTilePos.x * this.tileSize,
		y: this.startTilePos.y * this.tileSize
	};

	this.lastAct = config.act || 'stop';
	this.act = config.act || 'down';
	this.speed = constrain(this.tileSize / config.speed, 1, this.tileSize) || this.tileSize / 6; // tem q ser um multiplo do tile size
	this.colors = config.colors;
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

	fill(this.colors.yellow);
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
		fill(this.colors.yellow);
		ellipse(0, 0, this.size, this.size);
	}	

	// bandeira e texto 55
	fill(255);
	rectMode(CORNER);
	var flagSize = {w: 18, h: 11};
	var flagstaffSize = {w: 3, h: this.size * 0.6};
	fill(this.colors.pink);
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

	switch (data.act) {
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

	// ele não pode voltar pela porta para dentro do 'O'
	if(data.mazeTiles[nextTile.y][nextTile.x] == 9 && data.act == 'up') nextTileWalkable = false;

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

Pacman.prototype.restart = function() {
	this.pos = {
		x: this.startTilePos.x * this.tileSize,
		y: this.startTilePos.y * this.tileSize
	};
	this.act = 'down';
}

// data precisa do labirinto com o nome 'mazeTiles'
// data precisa da posicao do tile a ser verificado
// retorna o conteúdo do tile
Pacman.prototype.checkTile = function(mazeTiles, tilePos) { 
	var maxTileY = mazeTiles.length - 1;
	var maxTileX = mazeTiles[0].length - 1;

	tilePosX = constrain(tilePos.x, 0, maxTileX);
	tilePosY = constrain(tilePos.y, 0, maxTileY);

	return mazeTiles[tilePosY][tilePosX];
}

Pacman.prototype.getTilePos = function(pos) {
	pos = typeof pos !== 'undefined' ? pos : this.pos; // se a variavel posicao nao foi enviada usa a posicao atual do pacman

	var tilePos = {
		x: floor((pos.x + (this.tileSize / 2)) / this.tileSize),
		y: floor((pos.y + (this.tileSize / 2)) / this.tileSize),
	};
	return tilePos;
}

Pacman.prototype.hitTest = function(pos) {
	pacmanTile = this.getTilePos();
	checkTile = this.getTilePos(pos);
	return (pacmanTile.x == checkTile.x && pacmanTile.y == checkTile.y) ? true : false;
}

Pacman.prototype.dist = function(posA, posB) {
	return sqrt(sq(posA.y - posB.y) + sq(posA.x - posB.x));
}

// distância levando em conta que no eixo x o mundo é circular
Pacman.prototype.distX = function(posA, posB, totalSize) {
	// por causa do túnel preciso considerar a distância como se eles
	// tivessem andando em sobre uma circuferência
	var deltaXa = abs(posA.x - posB.x);
	var deltaXb = totalSize - deltaXa;
	var deltaX = deltaXa < deltaXb ? deltaXa : deltaXb;

	return sqrt(sq(posA.y - posB.y) + sq(deltaX));
}

Pacman.prototype.update = function(data) {

	pacmanTilePos = this.getTilePos();
	data.tilePos = pacmanTilePos;
	pacmanTile = this.checkTile(data.mazeTiles, pacmanTilePos);

	var protesterTile = this.getTilePos(data.protesterPos);
	var distProtPac = this.dist(pacmanTilePos, protesterTile);

	var oppositeDir = {'up': 'down', 'down': 'up', 'left': 'right', 'right': 'left'};

	var upTile		= { x: pacmanTilePos.x, y: pacmanTilePos.y - 1 },
		downTile	= { x: pacmanTilePos.x, y: pacmanTilePos.y + 1 },
		leftTile	= { x: pacmanTilePos.x - 1, y: pacmanTilePos.y },
		rightTile	= { x: pacmanTilePos.x + 1, y: pacmanTilePos.y };

	var adjTile = [
		{
			dir: 'up',
			dist: this.distX(upTile, protesterTile, data.mazeTiles[0].length),
			value: this.checkTile(data.mazeTiles, upTile),
		},
		{
			dir: 'down',
			dist: this.distX(downTile, protesterTile, data.mazeTiles[0].length),
			value: this.checkTile(data.mazeTiles, downTile),
		},
		{
			dir: 'left',
			dist: this.distX(leftTile, protesterTile, data.mazeTiles[0].length),
			value: this.checkTile(data.mazeTiles, leftTile),
		},
		{
			dir: 'right',
			dist: this.distX(rightTile, protesterTile, data.mazeTiles[0].length),
			value: this.checkTile(data.mazeTiles, rightTile),
		},
	];

	var index = 0;
	var validAdjTile = new Array();
	for (i = 0; i < adjTile.length; i++) {
		// remove os tiles parede // 9 é a porta da área de início e a partir do 10 paredes
		if(adjTile[i].value < 9) {
			if(distProtPac > 3) {
				if(adjTile[i].dir != oppositeDir[this.lastAct]) {
					validAdjTile[index] = adjTile[i];
					validAdjTile[index].dist += adjTile[i].value > 0 ? 2 : 0;
					index++;
				} 
			} else {
				validAdjTile[index] = adjTile[i];
				if(distProtPac > 2) {
					validAdjTile[index].dist += adjTile[i].value > 0 ? 2 : 0;
				}
				index++;
			}
		}
	}

	// checa para ver se o pacman está dentro da área inicial
	// e checa se ele esta no meio do quadrado
	if((pacmanTile < 8 || pacmanTile > 9) 
		&& this.pos.x % this.tileSize == 0 && this.pos.y % this.tileSize == 0) {

		validAdjTile.sort(function(a, b) {
			return -1 * ((a.dist > b.dist) - (b.dist > a.dist));
		});

		// se a distancia for a mesma de dois tiles
		if(validAdjTile.length > 1 && round(validAdjTile[0].dist) == round(validAdjTile[1].dist)) {
			// se a primeira é oposta à direcao anterior
			if(validAdjTile[0].dir != oppositeDir[this.lastAct]) {
				this.act = validAdjTile[0].dir;
			// se a segunda é oposta à direcao anterior
			} else if(validAdjTile[1].dir != oppositeDir[this.lastAct]) {
				this.act = validAdjTile[1].dir;
			// se a primeira tem dinheiro  ou não
			} else if(validAdjTile[0].value > validAdjTile[1].value) {
				this.act = validAdjTile[0].dir;
			} else {
				this.act = validAdjTile[1].dir;
			}
		} else if(validAdjTile.length > 0) {
			this.act = validAdjTile[0].dir;
		}

	}

	data.act = this.act;
	var move = this.tryToMove(data); // verifica se é possível mover usando o novo comando

	if(move) { // se for possível mover atualiza o último comando
		this.lastAct = this.act;
	} else { // se não possível mover usando o novo comando tenta se movimentar pelo último comando
		data.act = this.lastAct;
		move = this.tryToMove(data);

		if(!move) {
			this.lastAct = 'stop';
		}
	}
}

/////////////////////////////////
///// Protester Object Type /////
/////////////////////////////////
var Protester = function(config) {
	this.tileSize = config.tileSize;
	this.spriteSVG = loadShape("img/protester.svg");
	this.sizeExtra = (this.spriteSVG.width - this.tileSize) / 2;
	this.size = this.tileSize + this.sizeExtra;

	this.startTilePos = {
		x: config.tilex || 16,
		y: config.tiley || 16,
	};

	this.pos = {
		x: this.startTilePos.x * this.tileSize,
		y: this.startTilePos.y * this.tileSize
	};

	this.lastAct = 'stop';
	this.act = 'stop';
	this.speed = constrain(this.tileSize / config.speed, 1, this.tileSize) || this.tileSize / 6; // tem q ser um multiplo do tile size
};

Protester.prototype.restart = function() {
	this.lastAct = 'stop';
	this.act = 'stop';
	this.pos = {
		x: this.startTilePos.x * this.tileSize,
		y: this.startTilePos.y * this.tileSize
	};
}

Protester.prototype.getTilePos = function(pos) {
	pos = typeof pos !== 'undefined' ? pos : this.pos; // se a variavel posicao nao foi enviada usa a posicao atual do pacman

	var tilePos = {
		x: floor((pos.x + (this.tileSize / 2)) / this.tileSize),
		y: floor((pos.y + (this.tileSize / 2)) / this.tileSize),
	};
	return tilePos;
}

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
	
	shapeMode(CORNER);
	shape(this.spriteSVG.getChild(shapeName+step), - this.size / 2, - this.size / 2, this.size, this.size);

	popMatrix();
}

Protester.prototype.tryToMove = function (data) { // data = mazeTiles

	var nextPos = {
		x: this.pos.x,
		y: this.pos.y,
	};

	switch (data.act) {
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
	data.act = this.act;
	var move = this.tryToMove(data); // verifica se é possível mover usando o novo comando

	if(move) { // se for possível atualiza o último comando
		this.lastAct = this.act;
	} else { // se não possível mover usando o novo comando tenta se movimentar pelo último comando
		data.act = this.lastAct;
		this.tryToMove(data);
	}
}


//////////////////////////////
///// Button Object Type /////
//////////////////////////////

// armazenas as variaveis
var Button = function(config) {
	// posicao
	this.x = config.x || 0;
	this.y = config.y || 0;
	this.fontSize = config.fontSize || 8;
	this.label = config.label || "Click";
	this.width = config.width || this.label.length * this.fontSize;
	this.height = config.height || this.fontSize;
	this.clickableOffset = this.fontSize / 2;

	//cores
	this.colorDefault = config.colorDefault || color(255, 255, 255);
	this.colorActive = config.colorActive || color(0, 0, 180);
	this.colorHover = config.colorHover || color(0, 0, 255);

	// funcoes
	this.onClick = config.onClick || function() {};
};

// desenha o botao
Button.prototype.draw = function() {
	state = 'default';

	if (this.isMouseInside() && mousePressed) {
		state = 'active';
		cursor(HAND);
	} else if (this.isMouseInside()) {
		state = 'hover';
		cursor(HAND);
	}

	switch (state) {
		case 'hover':
			btcolor = this.colorHover;
			break;
		case 'active':
			btcolor = this.colorActive;
			break;
		default:
			btcolor = this.colorDefault;
			break;			
	}

	pushMatrix();
	translate(this.x - this.width / 2, this.y - this.height / 2);

	fill(btcolor);
	textSize(this.fontSize);
	textAlign(LEFT, TOP);
	text(this.label, 0, 0);

	popMatrix();
};

// verifica se o mouse esta sobre o botao
Button.prototype.isMouseInside = function() {
	return mouseX > (this.x - this.width / 2 - this.clickableOffset) &&
		   mouseX < (this.x + this.width / 2 + this.clickableOffset) &&
		   mouseY > (this.y - this.height / 2 - this.clickableOffset) &&
		   mouseY < (this.y + this.height / 2 + this.clickableOffset);
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

var tileSize = 20;
var saude = false;
var educacao = false;
var pauseMessage = false;
var score = 0;
var pauseWarningPrinted = false;

var messageCountdown = false;
var messageStart = 0;
var messageDuration = 5000;

var scene = 'start'; // 'start', 'paused', 'play', 'winner', 'loser'

size(tileSize * 31, tileSize * 26);
background(0);
PFont fontA = createFont("Press Start 2P");
textFont(fontA, 16);
noStroke();

var defaultColors = {
	blue:   color(142, 215, 247),
	yellow: color(252, 208,  12),
	pink:   color(240,  91, 136),
	purple: color(100,  20, 220),
	green:  color( 70, 200, 170),
};

long lastUpdate = 0;

var pacman = new Pacman({
	tileSize: tileSize,
	colors: defaultColors,
});

var protester = new Protester({
	tileSize: tileSize,
	colors: defaultColors,
});

var maze = new Maze({
	tileSize: tileSize,
	colors: defaultColors,
});


// sons
var music = new Howl({
	src: ['sound/265308__volvion__8-bit-bossfight.mp3'],
	loop: true,
	volume: .7,
	// rate: .8,
});

var soundCoin = new Howl({
	src: ['sound/336903__shnur__coin2.wav'],
	loop: false,
	volume: .3,
	rate: .9,
});

var soundWin = new Howl({
	src: ['sound/341629__projectsu012__coin-insert-or-collecting-item.mp3'],
	loop: false,
});

var soundLose = new Howl({
	src: ['sound/350982__cabled-mess__lose-c-06.mp3'],
	loop: false,
});

var startScreen = loadShape("img/start-screen.svg"); // icones usados como bônus
var winnerScreen = loadShape("img/winner-screen.svg"); // icones usados como bônus
var loserScreen = loadShape("img/loser-screen.svg"); // icones usados como bônus

var startButton = new Button({
	x: width/2,
	y: height/2,
	label: ">> JOGAR <<",
	fontSize: 16,
	colorDefault: defaultColors.blue,
	colorActive: defaultColors.yellow,
	colorHover: defaultColors.yellow,
	onClick: function() {
		scene = 'play';
		maze.restart();
		pacman.restart();
		protester.restart();
	}
});

var pauseButton = new Button({
	x: width - tileSize * 3,
	y: height - tileSize * 2,
	label: "PAUSAR",
	// fontSize: 8,
	colorDefault: defaultColors.blue,
	colorActive: defaultColors.yellow,
	colorHover: defaultColors.yellow,
	onClick: function() {
		scene = 'paused';
	}
});

mouseClicked = function() {
	if(scene == 'paused') scene = 'play';
	if(scene == 'start' || scene == 'winner' || scene == 'loser') startButton.handleMouseClick();
	if(scene == 'play') pauseButton.handleMouseClick();
};

draw = function() {

	cursor(ARROW);

	////////////////////
	///// CONTROLE /////
	////////////////////
	if (keyPressed) {
		switch (keyCode) {
			case UP:
				protester.act = 'up';
				break;	
			case DOWN:
				protester.act = 'down';
				break;	
			case LEFT:
				protester.act = 'left';
				break;		
			case RIGHT:
				protester.act = 'right';
				break;
		}
		if(key == 122) { // tecla 'z'
			/*
			// colocar uma ação para o boneco, tipo criar uma barricada
			var protTilePos = protester.getTilePos();
			*/
		}
		if((scene == 'paused' || scene == 'start') && (key == 32 || key == 10)) { // apertar enter ou espaço
			scene = 'play';
		}
	}

	if((!focused && scene != 'start') || scene == 'paused') {
		if(!pauseWarningPrinted) {
			fill(0, 150);
			noStroke();
			rect(0,0, width, height);

			if(!pauseMessage) music.pause();

			textSize(16);
			fill(defaultColors.blue);
			textAlign(CENTER, BOTTOM);
			text("PAUSADO", width/2, height / 2);

			textSize(8);
			fill(255);
			textAlign(CENTER, TOP);
			text(">> CLIQUE PARA CONTINUAR <<", width/2, height / 2 + tileSize);

			pushMatrix();
			translate(width/2, tileSize * 3);
			textSize(16);
			fill(defaultColors.yellow);
			textAlign(CENTER, TOP);

			switch (pauseMessage) {
				case 'educacao':
					text("SE A PEC 55 ESTIVESSE EM VIGOR\n\nENTRE 2002 E 2015, O INVESTIMENTO\n\nEM EDUCAÇÃO SERIA 47% MENOR, OU\n\nSEJA, R$ 268,8 BILHÕES A MENOS.", 0, 0);
					educacao = true;
					pauseMessage = false;

					messageStart = millis();
					messageCountdown = true;

					break;
				case 'saude':
					text("COM A PEC 55, ESTIMA-SE QUE A\n\nSAÚDE PÚBLICA DEIXARIA DE\n\nRECEBER R$ 424 BILHÕES NOS\n\nPRÓXIMOS 20 ANOS.", 0, 0);
					saude = true;
					pauseMessage = false;

					messageStart = millis();
					messageCountdown = true;
					break;
			}
			popMatrix();
			pauseWarningPrinted = true;
		}

		// timer que conta o tempo que a mensagem está aparecendo
		if(messageCountdown) {
			var messageTime = millis() - messageStart;
			pushMatrix();
			stroke(0);
			translate(width/2, height / 2 + tileSize * 4);
			ellipseMode(CENTER);
			fill(defaultColors.yellow);
			ellipse(0, 0, 38, 38);
			fill(0);
			arc(0, 0, 40, 40, -PI * messageTime / messageDuration, PI * messageTime / messageDuration);
			popMatrix();

			if(messageTime >= messageDuration) {
				scene = 'play';
				messageCountdown = false;
			}
		}

	} else {
		switch(scene) {
			case 'start':
				background(0);
				pushMatrix();
				translate(round(width/2), round(height/2));
				shapeMode(CENTER);
				shape(startScreen, 0, 0);
				popMatrix();

				// interface
				startButton.y = (height + startScreen.height) / 2 + 20;
				startButton.draw();

				break;

			case 'play':

				if(!music.playing()) music.play();
				background(0);

				// interface
				pauseButton.draw();

				// display de pontos
				fill(defaultColors.pink);
				textSize(16);
				textAlign(LEFT, TOP);
				text("-R$" + score + ",00", 4  * tileSize, (maze.tiles.length + 2) * tileSize);

				textSize(8);
				var countdown = maze.countdown();
				text(countdown, 2  * tileSize, (maze.tiles.length + 2) * tileSize);
				if(countdown == 0) {
					scene = 'loser';
					if(!soundLose.playing()) soundLose.play();
				}

				// testa a colisao do pacman com tiles e atualiza
				var pacmanTile = pacman.getTilePos();
				switch(maze.tiles[pacmanTile.y][pacmanTile.x]) {
					case 1: // cifrao
						maze.updateTile(pacmanTile.x, pacmanTile.y, 0);
						soundCoin.play();
						score += 1000;
						break;
					case 2: // educacao
						maze.updateTile(pacmanTile.x, pacmanTile.y, 0);
						soundCoin.play();
						score += 20000;
						if(!educacao) {
							scene = 'paused';
							pauseMessage = 'educacao';
						}
						break;
					case 3: // saude
						maze.updateTile(pacmanTile.x, pacmanTile.y, 0);
						soundCoin.play();
						score += 20000;
						if(!saude) {
							scene = 'paused';
							pauseMessage = 'saude';
						}
						break;
				}

				// debug: colore o quadrado que o pacman está
				if(debug) {
					noStroke();
					fill(255, 50);
					pushMatrix();
					translate(pacmanTile.x, pacmanTile.y);
					rectMode(CORNER);
					rect(0, 0, this.tileSize, this.tileSize);
					popMatrix();
				}

				// velocidade de atualizacao em ms
				if((millis() - lastUpdate) >= 16) { // 60 fram
					pacman.update({mazeTiles: maze.tiles, protesterPos: protester.pos});
					protester.update({mazeTiles: maze.tiles});
					lastUpdate = millis();
				}

				if(pacman.hitTest(protester.pos)) {
					scene = 'winner';
					if(!soundWin.playing()) soundWin.play();
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

				// pausa o jogo ao clicar 'p'
				if (keyPressed && key.code == 112) scene = 'paused'; 
				break;

			case 'loser':
				background(0);
				pushMatrix();
				translate(round(width/2), round(height/2));
				shapeMode(CENTER);
				shape(loserScreen, 0, 0);
				popMatrix();

				// interface
				startButton.y = (height + winnerScreen.height) / 2 + 20;
				startButton.draw();
				break;

			case 'winner':
				background(0);
				pushMatrix();
				translate(round(width/2), round(height/2));
				shapeMode(CENTER);
				shape(winnerScreen, 0, 0);
				popMatrix();

				// interface
				startButton.y = (height + winnerScreen.height) / 2 + 20;
				startButton.draw();
				break;
		}
	}
}
