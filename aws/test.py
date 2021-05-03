import boto3
import botocore
session = boto3.Session()
client = session.client("sts")
try:
    print(client.get_caller_identity())
except botocore.exceptions.Clienterror as error:
    raise error