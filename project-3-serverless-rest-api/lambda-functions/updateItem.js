const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);
    const params = {
        TableName: process.env.TABLE_NAME,
        Key: { id: body.id },
        UpdateExpression: 'set completed = :c',
        ExpressionAttributeValues: { ':c': body.completed },
        ReturnValues: 'UPDATED_NEW'
    };

    await dynamo.update(params).promise();
    return { statusCode: 200, body: JSON.stringify({ message: 'Updated' }) };
};