local helpers = require("tests.utils.helpers")

local data = {
    {
        name = "1 html close tag",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<div| ]],
        after = [[<div>|</div>]],
    },
    {
        name = "2 html close tag",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<div clas="laa"| ]],
        after = [[<div clas="laa">|</div>]],
    },
    {
        name = "3 html not close tag on close tag",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<div>aa</div| ]],
        after = [[<div>aa</div>|]],
    },
    {
        name = "4 html not close on input tag",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<input| ]],
        after = [[<input>| ]],
    },
    {
        name = "5 html not close inside quote",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<div class="aa|"> </div>  ]],
        after = [[<div class="aa>|"> </div>  ]],
    },
    {
        name = "6 html not close on exist tag",
        filepath = "./sample/index.html",
        filetype = "html",
        linenr = 10,
        key = [[>]],
        before = [[<div><div|</div></div>]],
        after = [[<div><div>|</div></div>]],
    },
    {
        name = "7 typescriptreact close tag",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<Img| ]],
        after = [[<Img>|</Img> ]],
    },
    {
        name = "8 typescriptreact close",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<div class="abc"| ]],
        after = [[<div class="abc">|</div> ]],
    },
    {
        name = "9 typescriptreact not close on exist tag",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<div><div|</div></div>]],
        after = [[<div><div>|</div></div>]],
    },
    {
        name = "10 typescriptreact close on inline script",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 9,
        key = [[>]],
        before = [[const a = () => <div| ]],
        after = [[const a = () => <div>|</div> ]],
    },
    {

        name = "11 typescriptreact not close on close tag",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<button className="btn " onClick={()}> </button| ]],
        after = [[<button className="btn " onClick={()}> </button>| ]],
    },
    {
        name = "12 typescriptreact not close on expresion",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<button className="btn " onClick={(|)}> </button> ]],
        after = [[<button className="btn " onClick={(>|)}> </button> ]],
    },
    {
        name = "13 typescriptreact not close on typescript",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 6,
        key = [[>]],
        before = [[const data:Array<string| ]],
        after = [[const data:Array<string>| ]],
    },

    {
        name = "14 typescriptreact not close on script",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 6,
        key = [[>]],
        before = [[{(card.data | 0) && <div></div>}]],
        after = [[{(card.data >| 0) && <div></div>}]],
    },
    {
        name = "15 typescriptreact nested indentifer ",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<Opt.Input| ]],
        after = [[<Opt.Input>|</Opt.Input> ]],
    },
    {
        name = "16 typescriptreact autoclose fragment",
        filepath = "./sample/index.tsx",
        filetype = "typescriptreact",
        linenr = 12,
        key = [[>]],
        before = [[<|<div></div>]],
        after = [[<>|</><div></div>]],
    },
    {
        name = "17 javascript autoclose fragment",
        filepath = "./sample/index.js",
        filetype = "javascript",
        linenr = 12,
        key = [[>]],
        before = [[<|<div></div>]],
        after = [[<>|</><div></div>]],
    },
    {
        name = "18 vue auto close tag",
        filepath = "./sample/index.vue",
        filetype = "vue",
        linenr = 4,
        key = [[>]],
        before = [[<Img| ]],
        after = [[<Img>|</Img>]],
    },
    {
        name = "19 vue not close on script",
        filepath = "./sample/index.vue",
        filetype = "vue",
        linenr = 12,
        key = [[>]],
        before = [[const data:Array<string| ]],
        after = [[const data:Array<string>| ]],
    },
    {
        name = "20 php div ",
        filepath = "./sample/index.php",
        filetype = "php",
        linenr = 25,
        key = [[>]],
        before = [[<div| ]],
        after = [[<div>|</div> ]],
    },
    -- {
    --     name = '19 markdown div ',
    --     filepath = './sample/index.md',
    --     filetype = 'markdown',
    --     linenr = 4,
    --     key = [[>]],
    --     before = [[<div| ]],
    --     after = [[<div>|</div> ]],
    -- },
    {
        name = "21 lit template div",
        filepath = "./sample/index.ts",
        filetype = "typescript",
        linenr = 3,
        key = [[>]],
        before = [[<div| ]],
        after = [[<div>|</div> ]],
    },
    {
        name = "22 eruby template div",
        filepath = "./sample/index.html.erb",
        filetype = "eruby",
        linenr = 10,
        key = [[>]],
        before = [[<div| ]],
        after = [[<div>|</div> ]],
    },
    {
        name = "23 eruby template ruby string",
        filepath = "./sample/index.html.erb",
        filetype = "eruby",
        linenr = 10,
        key = [[>]],
        before = [[<%= <div| %>]],
        after = [[<%= <div>| %> ]],
    },
    {
        name = "24 templ close tag",
        filepath = "./sample/index.templ",
        filetype = "templ",
        linenr = 10,
        key = [[>]],
        before = [[<div| ]],
        after = [[<div>|</div>]],
    },
    {
        name = "25 templ close tag",
        filepath = "./sample/index.templ",
        filetype = "templ",
        linenr = 10,
        key = [[>]],
        before = [[<div clas="laa"| ]],
        after = [[<div clas="laa">|</div>]],
    },
    {
        name = "26 templ not close tag on close tag",
        filepath = "./sample/index.templ",
        filetype = "templ",
        linenr = 10,
        key = [[>]],
        before = [[<div>aa</div| ]],
        after = [[<div>aa</div>|]],
    },
    {
        name = "27 templ not close on input tag",
        filepath = "./sample/index.templ",
        filetype = "templ",
        linenr = 10,
        key = [[>]],
        before = [[<input| ]],
        after = [[<input>| ]],
    },
}

local autotag = require("nvim-ts-autotag")
autotag.test = true
local run_data = helpers.Test_filter(data)

describe("[close tag]", function()
    helpers.Test_withfile(run_data, {
        mode = "i",
        cursor_add = 0,
        before_each = function() end,
    })
end)
