var crypto = require('crypto');
var uuid = require('uuid');
var mysql = require('mysql');
var bodyParser = require('body-parser');
var express = require('express');

//mysql connection
var con = mysql.createConnection({
          host:'localhost',
          user:'root',
          password:'admin',
          database:'logindemo'
});

//password utils
var genRandomString = function(length) {
return crypto.randomBytes(Math.ceil(length/2))
 .toString('hex')
 .slice(0,length);
};

var sha512 = function(password,salt){
 var hash = crypto.createHmac('sha512',salt);
 hash.update(password);
 var value = hash.digest('hex');
return {
 salt:salt,
 passwordHash:value
 };
};

function saltHashPassword(userPassword){
 var salt = genRandomString(20);
 var passwordData = sha512(userPassword,salt);
return passwordData;
}

function checkHashPassword(userPassword,salt)
{
 var passwordData = sha512(userPassword,salt);
 return passwordData;
}

var app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:true}));

app.post('/register/',(req,res,next)=>{
 var post_data = req.body;    //get post params
 
 var plaint_password = post_data.password;
 var hash_data = saltHashPassword(plaint_password);
 var password = hash_data.passwordHash;
 var salt = hash_data.salt;
 
  
 var name = post_data.name;
 var email = post_data.email;

con.query('select * from user where email=?',[email],function(err,result,fields){
con.on('error',function(err){
     console.log(' [MySQL ERROR] ',err);
});


if(result && result.length)
  res.json('User already exists!!!');
else
{
con.query('INSERT INTO `user`( `email`, `name`, `encrypted_password`, `salt`) VALUES (?,?,?,?)',[email,name,password,salt],function(err,result,fields){
con.on('error',function(err){
     console.log(' [MySQL ERROR] ',err);
     res.json('Register Error: ',err);
});
res.json('Register Successful');
})
}
});
})

app.post('/login/',(req,res,next)=>{
     var post_data = req.body;
     var user_password = post_data.password;
     var email = post_data.email;
    
    con.query('select * from userinfo where email=?',[email],function(err,result,fields){
    con.on('error',function(err){
         console.log(' [MySQL ERROR] ',err);
    });
    
    if(result && result.length)
    {
    var salt = result[0].salt;
    var encrypted_password = result[0].encrypted_password;
    var hashed_password = checkHashPassword(user_password,salt).passwordHash;
    if(encrypted_password == hashed_password)
      res.end(JSON.stringify(result[0]))
    else
      res.end(JSON.stringify('Wrong Password'));
    }
    });
 })

app.listen(3000,()=>{
    console.log('Restful running on port 3000');
})