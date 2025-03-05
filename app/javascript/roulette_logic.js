(function($) {
	
	// table
	(function() {
		"use strict"
		
		function getButtonCells(btn) {
			var cells = btn.data('cells');
			if (!cells || !cells.length) {
				cells = [];
				switch (btn.data('type')) {
					case 'sector':
						var nums = sectors[btn.data('sector')];
						for (var i = 0, len = nums.length; i < len; i++) {
							cells.push(table_nums[nums[i]]);
						}
						return cells;
						break;
					case 'num':
					default:
						var nums = String(btn.data('num')).split(',');
						for (var i = 0, len = nums.length; i < len; i++) {
							cells.push(table_nums[nums[i]]);
						}
						btn.data('cells', cells)
						return btn.data('cells');
						break;
				}
			}
			return cells;
		};

		// props
		var active = true,
			selectors = {
				roulette : '.roulette',
				num : '.num',
				sector : '.sector',
				table_btns : '.controlls .btn'
			},
			classes = {
				red : 'red',
				black : 'black',
				green : 'green',
				hover : 'hover'
			},
			numbers = {
				red : [],
				black : [],
				green : []
			},
			sectors = {
				'1' : [], // 1st row
				'2' : [], // 2nd row
				'3' : [], // 3rd row
				'4' : [], // 1st 12
				'5' : [], // 2nd 12
				'6' : [], // 3rd 12
				'7' : [], // 1 to 18
				'8' : [], // EVEN
				'9' : [], // RED
				'10' : [], // BLACK
				'11' : [], // ODD
				'12' : [], // 19 to 36
			},
			table_nums = {},
			table_sectors = {};

		// init
		$(selectors.num).each(function() {
			var $this = $(this),
				color,
				num = Number($this.text());
			// add to instances array
			table_nums[num] = $this;
			// add to colors array
			for (var color in numbers) {
				if ($this.hasClass(classes[color])) {
					numbers[color].push(num);
					$this.data('color', color);
				}
			}
		})

		$(selectors.sector).each(function() { 
			var $this = $(this),
				color;
			if ($this.hasClass(classes.red)) {
				color = 'red';
			} else if ($this.hasClass(classes.black)) {
				color = 'black';
			} else {
				color = 'sector';
			}
			$this.data('color', color);
			table_sectors[$this.data('sector')] = $this;
		});

		// sort numbers
		for (var color in numbers) {
			numbers[color].sort(function(a, b) { return a - b; });
		}

		// populate sectors
		for (var i = 1; i <= 36; i++) {
			// 1st row, 2nd row, 3rd row
			switch (i%3) {
				case 0:
					sectors['1'].push(i);
					break;
				case 1:
					sectors['3'].push(i);
					break;
				case 2:
					sectors['2'].push(i);
					break;
			}

			// 1st 12, 2nd 12, 3rd 12
			if (i <= 12) {
				sectors['4'].push(i);
			} else if (i <= 24) {
				sectors['5'].push(i);
			} else {
				sectors['6'].push(i);
			}

			// 1 to 18, 19 to 36
			if (i <= 18) {
				sectors['7'].push(i);
			} else {
				sectors['12'].push(i);
			}

			// ODD, EVEN
			if (i%2) {
				sectors['11'].push(i);
			} else {
				sectors['8'].push(i);
			}

			if (numbers.red.indexOf(i) != -1) {
				sectors['9'].push(i);
			} else if (numbers.black.indexOf(i) != -1) {
				sectors['10'].push(i);
			}
		}

		// buttons
		var table_btns = $(selectors.table_btns).hover(
			function() {
				hovering=1;
				if (active) {
					var $this = $(this),
						cells = getButtonCells($this);
					for (var i = 0, len = cells.length; i < len; i++) {
						cells[i].addClass(classes.hover);
					}
					var sector = $this.data('sector');
					if (sector) {
						table_sectors[sector].addClass(classes.hover);
					}
				}
			},
			function() {
				hovering=0;
				var $this = $(this),
					cells = getButtonCells($this);
				for (var i = 0, len = cells.length; i < len; i++) {
					cells[i].removeClass(classes.hover);
				}
				var sector = $this.data('sector');
				if (sector) {
					table_sectors[sector].removeClass(classes.hover);
				}
			}
		).mousedown(function(e) {
			var numbers=[];
			if(typeof $(this).data('sector') != 'undefined'){
				console.log("SECTOR "+$(this).data('sector'));
				
				if(e.button==2)ChangeBet(36+$(this).data('sector'),-1);
				else ChangeBet(36+$(this).data('sector'),+1);
			}
			else{
				numbers=$(this).data('num');
				
				if(typeof numbers.length ==='undefined')numbers=[numbers];
				else numbers=numbers.split(',');
				
				if(e.button==2)for(var i=0;i<numbers.length;i++)ChangeBet(numbers[i],-1);
				else for(var i=0;i<numbers.length;i++)ChangeBet(numbers[i],+1);
			}
		});
	})();
	
document.oncontextmenu = function() {if(hovering)return false;};

})(jQuery);

function sendBet(id, amount) {
    fetch('/roulette/submit_roulette_bet', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ bet_id: id, amount: amount })
    })
    .then(response => response.json())
    .then(data => console.log("Bet placed:", data))
    .catch(error => console.error("Error:", error));
}

function ChangeBet(id, amount) {
    if (amount > 0) {
        sendBet(id, amount);
    } else if (amount < 0) {
        sendBet(id, amount);
    }
}


var hovering=0;