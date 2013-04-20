require({
    baseUrl: '/coffee/',
    paths: {
        jquery: '../js/jquery',
        cs: '../js/cs',
        'coffee-script': '../js/coffee-script',
        underscore: '../js/underscore',
        backbone: '../js/backbone'
    },
    shim: {
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        }
    }
}, ['cs!doble9']);