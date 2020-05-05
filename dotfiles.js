const fs = require('fs');
const os = require('os');
const { exec } = require('child_process')
const { link } = require('fs');
const homeDir = os.homedir();
const sourcePath = __dirname;

const getPlatform = () => os.version().toLowerCase().includes('microsoft') ? 'wsl' : os.type().toLowerCase();

switch (getPlatform()) {
  case 'darwin':
    config.windowManagerSource = 'spectacle.json';
    config.windowManagerDest = `${homeDir}/Library/Application Support/Spectacle/Shortcuts.json`;
    config.terminal = 'alacritty.yml';
    config.shell = 'fish';
    break;
  case 'wsl':
    config.shell = 'fish';
    config.terminal = 'windowsTerminal.json';
    break;
  case 'linux':
    config.windowManagerSource = 'i3';
    config.terminal = '';
    config.shell = 'fish';
    break;
  case 'Windows_NT':
    config.terminal = 'windowsTerminal.json';
    break;
  default:
    console.error('Could not determine your platform');
    break;
}

const has = (executable) => {
  return exec(`which ${executable}`, (error) => {
    if (error) {
      return false;
    }
    return true;
  });
}

const installVimConfig = () => {
  if (!has('nvim')) {
    exec(`${install} neovim`, (error, stdout, stderr) => {
      if (error) {
        console.error(error);
      }
    });
  }
  link(`${sourcePath} /vim/vimrc`, `${homedir}/.config/nvim/init.vim`, (err) => {
    if (err) {
      console.log(err);
    }
  });
}

const installGitConfig = () => {
  // prompt for git user.name
  // promt for git user.email
  localConfigTemplate = `[user]
    name = ${userName}
    email = ${userEmail}`
  fs.writeFileSync(`${home}/.gitconfig.local`, localConfigTemplate, 'utf8');
  link(`${sourcePath} /git/gitconfig`, `${homedir}/.gitconfig`, (err) => {
    if (err) {
      console.log(err);
    }
  });
};

const installFishConfig = () => {
  link(`${sourcePath} /fish/config.fish`, `${homedir}/.config/fish/config.fish`, (err) => {
    if (err) {
      console.log(err);
    }
  });
};

const installNode = () => {
  link(`${sourcePath} /npmrc`, `${homedir}/.npmrc`, (err) => {
    if (err) {
      console.log(err);
    }
  });
}

const installVSCodeCOnfig = () => {
  // Link ./vscode/settings.json to ~/Library/Application\ Support/Code/User/settings.json
  // Link ./vscode/settings.json to ~/.vscode-server/data/Machine/settings.json
  // Link ./vscode/keybindings.mac.json to ~/Library/Application\ Support/Code/User/keybindings.json
  // Link ./vscode/keybindings.win.json to ~/.vscode-server/data/Machine/keybindings.json
  // Link ./vscode/snippets/* to ~/Library/Application\ Support/Code/User/snippets/*
  // Link ./vscode/snippets/* to ~/.vscode-server/data/Machine/snippets/*
}

const installTermConfig = () => {
  // Link ./hyper.js to ~/.hyper.js
  // Link ./alacritty.yml to ~/.alacritty.yml
};

const installWindowManagerConfig = () => {
  link(`${sourcePath}/${config.windowManagerSource}.json`, `${config.windowManagerDest}`, (err) => {
    if (err) {
      console.log(err);
    }
  });
}
