var replace = require("replace");
replace({
    regex: "localhost",
    replacement: "10.110.240.205",
    paths: ['../config/db.js'],
    recursive: true,
    silent: true,
});
