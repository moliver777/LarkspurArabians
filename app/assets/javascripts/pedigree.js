// PEDIGREE CLASS
Pedigree = function(id) {
	this.init(id);
}
$.extend(Pedigree.prototype, {
	init: function(id) {
		this.horse_id = id;
		this.data = null;
		this.setup();
	},

	destroy: function() {
		this.horse_id = null;
		this.data = null;
	},

	setup: function() {
		var self = this;

		$.getJSON("/get_pedigree/"+this.horse_id, function(data) {
			self.data = data;
			self.tree();

			$.each($('g'), function(i,g) {
				$(g).click(function() {
					self.loadInfo($(g).attr('id'))
				})
			})
		})
	},

	tree: function() {
		var self = this;
		var w = window.innerWidth-100,
			h = window.innerHeight-100,
			fill = d3.scale.category10();

		var foci = [
			{x: window.innerWidth/2, y: window.innerHeight},
			{x: window.innerWidth/2-200, y: window.innerHeight-((h/6)*3)}, {x: window.innerWidth/2+200, y: window.innerHeight-((h/6)*3)},
			{x: window.innerWidth/2-400, y: window.innerHeight-((h/6)*4)}, {x: window.innerWidth/2-100, y: window.innerHeight-((h/6)*4)}, {x: window.innerWidth/2+100, y: window.innerHeight-((h/6)*4)}, {x: window.innerWidth/2+400, y: window.innerHeight-((h/6)*4)},
			{x: window.innerWidth/2-700, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2-500, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2-300, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2-100, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2+100, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2+300, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2+500, y: window.innerHeight-((h/6)*5)}, {x: window.innerWidth/2+700, y: window.innerHeight-((h/6)*5)}
		];

		var vis = d3.select("body").append("svg:svg")
			.attr("width", w)
			.attr("height", h);

		var force = this.force = d3.layout.force()
			.nodes(this.data.nodes)
			.links(this.data.links)
			.gravity(.05)
			.distance(150)
			.charge(-350)
			.size([w, h])
			.start();

		var link = vis.selectAll("line.link")
			.data(this.data.links)
			.enter().append("svg:line")
				.attr("class", "link")
				.style("stroke","#fff")
				.style("stroke-width","0.5")
				.attr("x1", function(d) { return d.source.x; })
				.attr("y1", function(d) { return d.source.y; })
				.attr("x2", function(d) { return d.target.x; })
				.attr("y2", function(d) { return d.target.y; });

		var node = vis.selectAll("g.node")
			.data(this.data.nodes)
			.enter().append("svg:g")
				.attr("class", "node")
				.attr("id", function(d) { return d.id })
				.call(force.drag);

		node.append("svg:circle")
			.attr("class", "node")
			.attr("name", function(d) { return d.name })
			.attr("cx", function(d) { return d.x; })
			.attr("cy", function(d) { return d.y; })
			.attr("r", 6)
			.style("fill", "#fff");

		node.append("svg:text")
			.attr("class", "nodetext")
			.attr("dx", 12)
			.attr("dy", ".35em")
			.attr("stroke", "#fff")
			.style("pointer-events","none")
			.style("font","10px sas-serif")
			.text(function(d) { return d.name });

		force.on("tick", function(e) {
			// Push nodes toward their designated focus.
			var k = .1 * e.alpha;
			self.data.nodes.forEach(function(o, i) {
				o.y += (foci[o.group-1].y - o.y) * k;
				o.x += (foci[o.group-1].x - o.x) * k;
			});

			vis.selectAll("circle.node")
				.attr("cx", function(d) { return d.x; })
				.attr("cy", function(d) { return d.y; });

			vis.selectAll("text.nodetext")
				.attr("x", function(d) { return d.x; })
				.attr("y", function(d) { return d.y; });

			link.attr("x1", function(d) { return d.source.x; })
				.attr("y1", function(d) { return d.source.y; })
				.attr("x2", function(d) { return d.target.x; })
				.attr("y2", function(d) { return d.target.y; });
		});
	},

	loadInfo: function(id) {
		console.log(id)
	}
});