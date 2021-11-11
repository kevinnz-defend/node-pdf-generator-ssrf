# CVE-2020-7740

This affects all versions of package [`node-pdf-generator`](https://github.com/darrenhaken/node-pdf-generator). Due to lack of user input validation and sanitization done to the content given to node-pdf-generator, it is possible for an attacker to craft a url that will be passed to an external server allowing an SSRF attack.


[Source](https://nvd.nist.gov/vuln/detail/CVE-2020-7740)


## Quick start
1. Clone the project using `git clone {link to be inserted}`
2. Install the dependencies from `https://wkhtmltopdf.org/`
3. Start the server using `node .\node-pdf-generator-server` the server will be running at `localhost:3000`
4. Install the requirements of the hidden python server using `python -m pip install -r requirements.txt`
5. Start the hidden server using `python "hidden service"` the server will be running at ['localhost:3001`](http://localhost:3001)



# How does it work?
1. A get request with a body is sent to the server. This can be sent using `curl --location --request GET localhost:3000/test --data-raw http://www.google.com --output test.pdf`
2. This will save a copy of the html page of `http://www.google.com` to the file `test.pdf`


# Why is it vulnerable?
1. The server is vulnerable to SSRF attacks

