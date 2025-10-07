const AWS = require('aws-sdk');
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
    const params = { TableName: process.env.TABLE_NAME };
    const data = await dynamo.scan(params).promise();
    return { statusCode: 200, body: JSON.stringify(data.Items) };
};