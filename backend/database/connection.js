// database/connection.js
const { Sequelize } = require('sequelize');

// Configura la conexión a la base de datos MySQL
const sequelize = new Sequelize('cardmarket', 'root', 'root', {
  host: '172.18.0.2',
  dialect: 'mysql',
});

module.exports = sequelize;
