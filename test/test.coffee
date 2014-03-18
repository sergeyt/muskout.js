describe 'muskout', ->

	beforeEach ->
		div = $('.test')
		ko.cleanNode(div[0]) if div.length
		div = $('#sandbox')
		$('<div id="sandbox"></div>').appendTo($('body')) unless div.length
		div.html('')

	it 'should replace text nodes', ->
		template = '<div class="test">{{value}}</div>'
		$(template).appendTo($('#sandbox'))

		vm = {value: 'test'}
		ko.applyBindings(vm, $('.test')[0])

		$('.test').text().should.eql('test')

	it 'should replace attribute', ->
		template = '<div class="test {{value}}"></div>'
		$(template).appendTo($('#sandbox'))

		vm = {value: 'green'}
		ko.applyBindings(vm, $('.test')[0])

		$('.test').hasClass('green').should.be.ok
