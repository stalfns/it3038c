var http = require("http");
var fs = require("fs");
var os = require("os");
var ip = require('ip');
var mb;
var fmb;
var seconds;
var days;
var minutes;
var hours;

function convertDays(){
days = Math.floor(os.uptime()/86400);
return days;
}

function convertHours(){
var daySec = os.uptime();
days = Math.floor(os.uptime()/86400);
var hourSec = daySec - (days*86400);
hours = Math.floor(hourSec/3600);
return hours;
}

function convertMinutes(){
var daySec = os.uptime();
days = Math.floor(os.uptime()/86400);
var hourSec = daySec - (days*86400);
hours = Math.floor(hourSec/3600);
var minSec = hourSec - (hours * 3600);
minutes = Math.floor(minSec/60);
return minutes;
}

function convertBytes(){
var mb = (os.totalmem()) / 1000000;
return mb; 
}

function convertFBytes(){
var fmb = (os.freemem()) / 1927.569408;
return fmb
}
http.createServer(function(req, res){

if(req.url === "/"){
fs.readFile("./Public/index.html","UTF-8", function(err, body){
res.writeHead(200,{"content-Type": "text/html"});
res.end(body);
});
} 
else if(req.url.match("/sysinfo")){
myHostName=os.hostname();
html=`
<!DOCTYPE html>
<html>
<head>
<title>Node JS Response</title>
</head>
<body>
<p>Hostname: ${myHostName}</p>
<p>IP: ${ip.address()}</p>
<p> Server Uptime: Days:${convertDays()} Hours: ${convertHours()} Minutes: ${convertMinutes()} Seconds: ${os.uptime()} </p>
<p> Total Memory: ${convertBytes()} MB</p>
<p> Free Memory: ${convertFBytes()} MB </p>
<p> Number of CPUs: ${os.cpus().length} </p> 
</body>
</html>`
res.writeHead(200, {"Content-Type": "text/html"});
res.end(html);
}
else{
res.writeHead(404, {"Content-Type": "text/plain"});
res.end(`404 File Not Found at ${req.url}`);
}



}).listen(3000)

console.log("servber listening on port 3000")
