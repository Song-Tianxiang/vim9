vim9script

g:ddc#custom#patch_global({
    ui: 'pum',
    sources: [ 'around', 'vsnip', ],
    sourceOptions: {
        _: {
            matchers: ['matcher_head'],
            sorters: ['sorter_rank'],
        },
        around: {
            mark: '  ',
        },
        vsnip: {
            mark: ' 󰘦 ',
        },
    },
    sourceParams: {
        around: {
            maxSize: 500,
        },
    },
})

g:ddc#enable()
