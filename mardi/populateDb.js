let mysql = require('mysql')
let moment = require('moment')
let faker = require('faker')
const util = require('util')


faker.locale = 'fr'

let conn = mysql.createConnection({
  host: "localhost",
  user: "sqlcourses",
  password: "sqlcourses",
  port: 8889,
  database : 'sql_courses',
  charset: 'UTF8_GENERAL_CI',
  connectTimeout: 1000,
  multipleStatements: true
});

conn.connect((err) => {
  if (err) {
    throw err;
  }
  console.log("Connected!")

// Math.floor(Math.random() * (max - min + 1)) + min;
  let max = moment().get('year')
  let min = moment().get('year') - 100

  randAge = () => {
    return Math.round(Math.random() * (max - min + 1)) + min
  }

  getMaxIdTable = (conn, table, column_id) => {
    sql = `SELECT MAX(\`${column_id}\`) FROM \`${table}\`;`;
    // sql = 'SELECT MAX(user_id) FROM users';

    let higherId = conn.query(sql, function (err, results, fields) {
      if (err){
        throw err;
      }
      // console.log(util.inspect(results, {showHidden: false, depth: null}))
      return results[0]
    })
    return (higherId === undefined || 'NULL' ? 0 : higherId)
  }
  // console.log(getMaxIdTable(conn,'users', 'user_id'))

  makeFixtureSample = (id) => {
// let higherId = get higher id from table
    id++
    // let firstname = faker.name.firstName().replace(/ /g,'_')
    // let lastname = faker.name.lastName().replace(/ /g,'_')
    // let phone = faker.phone.phoneNumber().replace(/ /g,'_')
    // let address = `${faker.address.streetAddress()}_${faker.address.city()}`.replace(/ /g,'_')
    // let email = faker.lorem.word().replace(/ /g,'_')
    let firstname = faker.lorem.word().replace(/ /g,'_')
    let lastname = faker.lorem.word().replace(/ /g,'_')
    let phone = faker.lorem.word().replace(/ /g,'_')
    let address = faker.lorem.word().replace(/ /g,'_')
    let email = faker.lorem.word().replace(/ /g,'_')

    address = address.replace(/ /g,'_')
    email = email.toLowerCase()
    phone = phone.replace(/ /g,'_')
    // console.log(phone)
    // phone = phone.join(" ")
    // console.log(phone)
    return `(${id}, ${firstname}, ${lastname}, ${Date.now()}, ${address}, ${phone}, ${email})`
  }
  // console.log(fixtures(0))

  populate = (num) => {
    for( let a = 0; a < num; a++ ) {
      let fixtures = []

      let id = getMaxIdTable(conn, 'users', 'user_id')

      for (let i = 0; i < 10; i++) {
        id++
        let fixture = makeFixtureSample(id)
        // console.log(fixture)
        fixtures.push(fixture)
      }
      console.log(fixtures)
      // fixtures = fixtures.map(fixture => fixture.replace(/"|'|\\n/g, ""))
      console.log(fixtures[0])
    // console.groupEnd(fixtures)
      sql = 'DELETE FROM users;'
      conn.query(sql, (err, res) => {
        if(err) throw err;
        if(res) {
          return console.log('rows affected by DELETE: '+ res.changedRows)
        }
      })

      sql = 'INSERT INTO users (user_id, firstname, lastname,' +
        ' creation_date, address, phone, email, age) ' +
        `VALUES ${fixtures};`

      conn.query(sql, { fixtures: fixtures  }, (err, res) => {
        if(err) throw err;
        if(res) {
          return console.log('rows affected: '+ res.changedRows)
        }
      })
    }
  }
populate(1)
  conn.end();
})


