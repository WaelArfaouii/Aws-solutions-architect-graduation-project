const AWS = require('aws-sdk');
const sharp = require('sharp');
const s3 = new AWS.S3();

exports.handler = async (event) => {
    const bucket = event.Records[0].s3.bucket.name;
    const key = decodeURIComponent(event.Records[0].s3.object.key.replace(/\+/g, ' '));

    if (key !== 'uploads/' + path.basename(key)) return;

    const params = { Bucket: bucket, Key: key };
    const image = await s3.getObject(params).promise();

    // Resize to 300x300
    const resized = await sharp(image.Body)
        .resize(300, 300)
        .toFormat('jpeg')
        .jpeg({ quality: 80 })
        .toBuffer();

    // Watermark
    const watermarked = await sharp(resized)
        .composite([{ inputBuffer: Buffer.from('Watermark Text'), gravity: 'southeast' }])
        .toBuffer();

    const outputKey = 'processed/' + path.basename(key, path.extname(key)) + '_processed.jpg';
    await s3.putObject({
        Bucket: process.env.OUTPUT_BUCKET,
        Key: outputKey,
        Body: watermarked,
        ContentType: 'image/jpeg'
    }).promise();

    // Log to DynamoDB (optional integration)
    const dynamo = new AWS.DynamoDB.DocumentClient();
    await dynamo.put({
        TableName: 'ImageMetadata',  // Assume passed or hardcoded
        Item: { ImageId: key, UploadTime: new Date().toISOString(), Status: 'Processed' }
    }).promise();

    return { status: 'success' };
};