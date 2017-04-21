var express = require('express');
var compression = require('compression');

const build = `${__dirname}/build`;
const port = process.env.PORT || 3000;

const app = express();

app.use(compression());
app.use(express.static(build));

app.listen(port, function (error) {
  if (error) {
    console.error(error);
  }

  console.info('Server is now running. Express is listening on port %s', port);
});
