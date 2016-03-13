describe('common', function(){
    it('should show overlay', function(){
        //var spyEvent = spyOnEvent('#loading-overlay', 'show');
        shop.common.loadLoadingOverlay();
        expect('#loading-overlay').toBeVisible();
    })
})