const path = require('path');
const pkg = require('../react-native-nitro-in-app-browser/package.json');

/**
 * @type {import('@react-native-community/cli-types').Config}
 */
module.exports = {
  dependencies: {
    [pkg.name]: {
      root: path.join(__dirname, '..', 'react-native-nitro-in-app-browser'),
    },
  },
};
