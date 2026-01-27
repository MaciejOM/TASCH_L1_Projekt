
// response.send(status) is now a function that takes the JSON object as the argument.

server.get("/status", (request, response) => {
    const status = {
        "Status": "Running"
    };

    response.send(status);
});