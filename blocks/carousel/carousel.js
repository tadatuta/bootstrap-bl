BEM.DOM.decl('carousel',
{
    onSetMod: {
        'js': function() {

            var _this = this;
 
            this.bindTo(this.elem('control'), 'click', function(e) {
                _this.hasMod(e.data.domElem, 'slide', 'left') ? _this.prev() : _this.next();
            });

            this.update();
        }    
    },
    update: function() {
        this.elem('item', 'state', 'active').length || this.setMod(this.elem('item').eq(0), 'state', 'active');
    },
    next: function() {
        return this.slide('next');        
    },
    prev: function() {
        return this.slide('prev');    
    },
    slide: function(type) {
        var active = this.findElem('item', 'state', 'active'),
            next = active[type](),
            fallback = type == 'next' ? 'first' : 'last';

        next = next.length ? next : this.elem('item')[fallback]();

        this
            .trigger('slide')
            .delMod(active, 'state')
            .setMod(next, 'state', 'active')
            .trigger('slid');
    },
        getDefaultParams: function() {
        return {
            interval: 1000    
        }    
    },
    cycle: function(ctx) {
        var _this = ctx ? ctx : this;
        
        this.interval = setInterval(function() {
            _this.next.call(_this);
        }, _this.params.interval);    
    }
});
