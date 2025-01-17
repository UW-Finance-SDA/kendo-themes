/// <reference path='lib/types.d.ts' />

suite.skip('Multiselect', () => {

    before( () => {
        loadFixture('/html/multiselect.html');
        window.kendo.Html.init();
    });
    after( () => {
        clearFixture();
    });

    test('Multiselect height should be 30', () => {
        let multiselect = $('#multiselect');

        assert.equal( multiselect.offsetHeight, metrics.multiselect.height );
    });

    test('Multiselect token height should be 24', () => {
        let token = $('#multiselect .k-multiselect-wrap ul .k-button');

        assert.equal( token.offsetHeight, metrics.multiselect.token.height );
    });

});
