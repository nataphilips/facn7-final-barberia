const databaseConnection = require("../database/db_connection.js");

const getallhours = day => {
  return databaseConnection.query(
    `SELECT * FROM working_schedule where week_day=$1`,
    [day]
  );
};

const modifyworkingday = data => {
  const values = data.list
    .reduce((acc, row) => {
      return (acc += `('${row.day}',' ${row.start_time}', '${row.end_time}'),`);
    }, "")
    .slice(0, -1);
  const result = databaseConnection
    .query(`DELETE FROM working_schedule WHERE week_day=$1;`, [data.day])
    .catch(err => console.log(err));
  if (data.list.length) {
    return databaseConnection.query(
      "INSERT INTO working_schedule (week_day, start_hr, end_hr) VALUES " +
        [values]
    );
  }
  return result;
};

module.exports = { modifyworkingday, getallhours };
