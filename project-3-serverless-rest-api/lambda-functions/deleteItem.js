const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const body = JSON.parse(event.body);
    const params = {
        TableName: process.env.TABLE_NAME,
        Key: { id: body.id }
    };

    await dynamo.delete(params).promise();
    return { statusCode: 200, body: JSON.stringify({ message: 'Deleted' }) };
};