const express = require("express")
const port = 8000
const app = express()
app.listen(port, function (error) {
    if (error) console.log(error)
    console.log("Express Server is running on port", port)
})
app.get("/test", function (request, response) {
    response.status(200).json({
        message: "Success"
    })
})