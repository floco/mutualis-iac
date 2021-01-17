from notion.client import NotionClient
import os

varToken = os.environ['TOKEN']
varPage = os.environ['PAGE']
print(varToken)
print(varPage)


# Obtain the `token_v2` value by inspecting your browser cookies on a logged-in (non-guest) session on Notion.so
client = NotionClient(token_v2=varToken)

# Replace this URL with the URL of the page you want to edit
page = client.get_block(varPage)

print("The page title is:", page.title)

# Access a database using the URL of the database page or the inline block
cv = client.get_collection_view(varPage)

# List all the records with "IOT" in them
for row in cv.collection.get_rows(search="IOT"):
    print("IP of '{}' is {}".format(row.name, row.ip))