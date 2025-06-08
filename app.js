//declaration
let express = require("express");
let expressSession = require("express-session");
let bodyParser = require("body-parser");
let app = express();
let port = 3000;

//common controllers
let signup = require("./controllers/signup");
let login = require("./controllers/login");
let logout = require("./controllers/logout");

//admin controllers
let admin = require("./controllers/admin");

//customer controllers
let customer = require("./controllers/customer");

//configure
app.set("view engine", "ejs");

//middlewares
app.use(bodyParser.urlencoded({ extended: false }));
app.use(
  expressSession({
    secret: "my top secret pass",
    resave: false,
    saveUninitialized: true,
  })
);
app.use("/css", express.static(__dirname + "/css"));
app.use("/images", express.static(__dirname + "/images"));

app.use("*", function (req, res, next) {
  if (req.originalUrl == "/login" || req.originalUrl == "/signup") {
    next();
  } else {
    if (!req.session.admin && !req.session.customer) {
      res.redirect("/login");
      return;
    }
    next();
  }
});

//routes
app.use("/login", login);
app.use("/signup", signup);
app.use("/logout", logout);

//admin routes
app.use("/admin", admin);

//customer routes

app.use("/customer", customer);

//server start
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
