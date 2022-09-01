// Future versions of Hyper may add additional config options,
// which will not automatically be merged into this file.
// See https://hyper.is#cfg for all currently supported options.
const WORKBENCH = '#171c28';
const BACKGROUND = '#1d2433';
const FOREGROUND = '#a2aabc';
const UI_GREY = '#6679a4';
const ACCENT = '#ffcc66';

const RED = '#ef6b73';
const GREEN = '#bae67e';
const YELLOW = '#ffd580';
// const ORANGE = '#ffae57';
const BLUE = '#5ccfe6';
const MAGENTA = '#c3a6ff';
const WHITE = '#d7dce2';
const LIGHT_GREY = '#8695b7';
const GREY = '#2f3b54';
const DARK_GREY = '#1d2433';

const red = '#d76068';
const lightRed = '#f17a81';
const green = '#a7cf71';
const lightGreen = '#c1e98b';
const yellow = '#ffae57';
const lightYellow = '#ffcc66';
const cyan = '#53bacf';
const lightCyan = '#5ccfe6';
const blue = '#1865A0';
const lightBlue = '#218DDE';
const magenta = '#c3a6ff';
const lightMagenta = '#c9afff';
const white = '#d7dce2';
const lightWhite = '#e7eaee';
const black = '#2f3b54';
const lightBlack = '#8695b7';
const uiWhite = '#f6f7f8';
const uiLightGrey = '#8695b7';
const uiDarkGrey = '#2f3b54';
const uiBlack = '#1d2433';
const uiAccent = '#5ccfe6';

module.exports = {
  config: {
    lineHeight: 1.2,
    // default font size in pixels for all tabs
    fontSize: 14,

    // font family with optional fallbacks
    fontFamily:
      // '"InputMonoNarrow Nerd Font", "Cascadia Code", "Operator Mono", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    '"OperatorMono Nerd Font"',
    // terminal cursor background color and opacity (hex, rgb, hsl, hsv, hwb or cmyk)
    // cursorColor: 'rgba(248,28,229,0.8)',

    // `BEAM` for |, `UNDERLINE` for _, `BLOCK` for █
    cursorShape: 'BEAM',

    // set to true for blinking cursor
    cursorBlink: true,

    // color of the text
    // foregroundColor: '#fff',

    // terminal background color
    // backgroundColor: '#000',

    // border color (window, tabs)
    // borderColor: '#333',

    // custom css to embed in the main window
    css: ``,

    // custom css to embed in the terminal window
    termCSS: ``,

    // set to `true` (without backticks) if you're using a Linux setup that doesn't show native menus
    // default: `false` on Linux, `true` on Windows (ignored on macOS)
    showHamburgerMenu: '',

    // set to `false` if you want to hide the minimize, maximize and close buttons
    // additionally, set to `'left'` if you want them on the left, like in Ubuntu
    // default: `true` on windows and Linux (ignored on macOS)
    showWindowControls: '',

    // custom padding (css format, i.e.: `top right bottom left`)
    padding: '16px',

    // the full list. if you're going to provide the full color palette,
    // including the 6 x 6 color cubes and the grayscale map, just provide
    // an array here instead of a color map object
    // colors: {
    //   black: '#000000',
    //   red: '#ff0000',
    //   green: '#33ff00',
    //   yellow: '#ffff00',
    //   blue: '#0066ff',
    //   magenta: '#cc00ff',
    //   cyan: '#00ffff',
    //   white: '#d0d0d0',
    //   lightBlack: '#808080',
    //   lightRed: '#ff0000',
    //   lightGreen: '#33ff00',
    //   lightYellow: '#ffff00',
    //   lightBlue: '#0066ff',
    //   lightMagenta: '#cc00ff',
    //   lightCyan: '#00ffff',
    //   lightWhite: '#ffffff',
    // },

    // colors: {
    //   black,
    //   red,
    //   green,
    //   yellow,
    //   blue,
    //   magenta,
    //   cyan,
    //   white,
    //   lightBlack,
    //   lightRed,
    //   lightGreen,
    //   lightYellow,
    //   lightBlue,
    //   lightMagenta,
    //   lightCyan,
    //   lightWhite,
    // },

    // foregroundColor: white,
    // backgroundColor: uiBlack,
    // selectionColor: uiDarkGrey,
    // borderColor: uiDarkGrey,
    // cursorColor: uiAccent,

    // the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
    // if left empty, your system's login shell will be used by default
    //
    // Windows
    // - Make sure to use a full path if the binary name doesn't work
    // - Remove `--login` in shellArgs
    //
    // Bash on Windows
    // - Example: `C:\\Windows\\System32\\bash.exe`
    //
    // Powershell on Windows
    // - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
    shell: '',

    // for setting shell arguments (i.e. for using interactive shellArgs: ['-i'])
    // by default ['--login'] will be used
    shellArgs: ['--login'],

    // for environment variables
    env: {},

    // set to false for no bell
    bell: false,

    // if true, selected text will automatically be copied to the clipboard
    copyOnSelect: false,

    // if true, on right click selected text will be copied or pasted if no
    // selection is present (true by default on Windows)
    // quickEdit: true

    // URL to custom bell
    // bellSoundURL: 'http://example.com/bell.mp3',

    // for advanced config flags please refer to https://hyper.is/#cfg
    updateChannel: 'stable',
  },

  // a list of plugins to fetch and install from npm
  // format: [@org/]project[#version]
  // examples:
  //   `hyperpower`
  //   `@company/project`
  //   `project#1.0.1`
  // plugins: [`hyper-halcyon-theme`],
  plugins: [
    // 'hyperterm-base-16-ocean',
    // 'hyper-sweet',
    // 'hyper-cyan',
    'hyper-ayu-mirage',
  ],

  // in development, you can create a directory under
  // `~/.hyper_plugins/local/` and include it here
  // to load it and avoid it being `npm install`ed
  localPlugins: [],

  keymaps: {},
};
