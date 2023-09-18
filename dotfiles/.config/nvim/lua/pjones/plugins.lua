local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

    use('wbthomason/packer.nvim')

    use('ryanoasis/vim-devicons')
    use('kyazdani42/nvim-web-devicons')

    use('kyazdani42/nvim-tree.lua') -- NerdTree alternative

    use('tpope/vim-commentary') -- For Commenting gcc & gc
    use('vim-airline/vim-airline') -- Status bar
    use('akinsho/bufferline.nvim')
    use('kshenoy/vim-signature') -- Mark visualiser
    use('psliwka/vim-smoothie') -- Smooth scrolling

    use('ap/vim-css-color') -- CSS Colour Preview
    use({
        'neoclide/coc.nvim',
        branch = 'release'
    })  -- Auto Completion

    use('mg979/vim-visual-multi') -- CTRL + N for multiple cursors
    --use('LunarWatcher/auto-pairs')
    --
    --use('m4xshen/autoclose.nvim')-- doesn't conflict with <C-p>
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use('tpope/vim-surround')
    use('tpope/vim-fugitive') -- Git plugin

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires =  { { 'nvim-lua/plenary.nvim' } }
    }
    -- fzf
    -- use({
    --     'junegunn/fzf',
    --     run = (function()
    --         vim.fn['fzf#install']()
    --     end)
    -- })
    -- use('junegunn/fzf.vim')

    -- Colour scheme
    use({
        'dracula/vim',
        as = "dracula"
    })

    use({
        'nvim-treesitter/nvim-treesitter',
        run = (function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end)
    })
    use('nvim-treesitter/nvim-treesitter-context')


    if packer_bootstrap then
        require('packer').sync()
    end

end)
