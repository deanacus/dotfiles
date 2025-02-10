const bellConfig = {
  bell: false,
  bellSound: null,
  bellSoundURL: null,
};

const colorConfig = {
  colors: {
    red: '#d76068',
    lightRed: '#f17a81',
    green: '#a7cf71',
    lightGreen: '#c1e98b',
    yellow: '#ffae57',
    lightYellow: '#ffcc66',
    cyan: '#53bacf',
    lightCyan: '#5ccfe6',
    blue: '#1865A0',
    lightBlue: '#218DDE',
    magenta: '#c3a6ff',
    lightMagenta: '#c9afff',
    white: '#d7dce2',
    lightWhite: '#e7eaee',
    black: '#2f3b54',
    lightBlack: '#8695b7',
  },
  cursorAccentColor: '',
  cursorColor: '#5ccfe6',
  foregroundColor: '#d7dce2',
  backgroundColor: '#1d2433',
  borderColor: '#2f3b54',
  selectionColor: '#2f3b54',
};

const typeConfig = {
  lineHeight: 1.2,
  fontSize: 14,
  fontFamily: [
    'Operator Mono',
    'Menlo',
    'DejaVu Sans Mono',
    'Consolas',
    'Lucida Console',
    'monospace',
  ].join(','),
  disableLigatures: true,
};

const cursorConfig = {
  cursorShape: 'BEAM',
  cursorBlink: true,
};

const envConfig = {
  preserveCWD: false,
  shell: '',
  shellArgs: [],
  env: {},
};

const cssConfig = {
  css: ``,
  termCSS: ``,
  padding: '16px',
};

const plugins = ['hyper-ayu-mirage'];
const localPlugins = [];
const keymaps = {};

module.exports = {
  config: {
    ...typeConfig,
    ...cursorConfig,
    ...colorConfig,
    ...envConfig,
    ...bellConfig,
    ...cssConfig,
  },
  plugins,
  localPlugins,
  keymaps,
};
