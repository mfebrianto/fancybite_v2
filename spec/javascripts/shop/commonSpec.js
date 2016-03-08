describe('common', function(){
    it('should show overlay', function(){
        spyOn($('#loading-overlay'), 'show')
        expect($('#loading-overlay').show()).toHaveBeenCalled();
    })
})