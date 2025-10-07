const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);
    const params = {
        TableName: process.env.TABLE_NAME,
        Item: {
            id: Date.now().toString(),
            text: body.text,
            completed: false
        }
    };

    await dynamo.put(params).promise();
    return { statusCode: 200, body: JSON.stringify({ id: params.Item.id }) };
};