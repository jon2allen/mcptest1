import os
from fastmcp import Client
from google import genai
import asyncio

try:
    with open("npm_path.txt", "r") as f:
        # Assuming the file only contains the path or needs trimming
        client_location = f.read().strip()
except FileNotFoundError:
    raise FileNotFoundError("please run npm_setup.sh first")

# Use the read client_location when creating the FastMCP client
mcp_client = Client(client_location) # <--- Changed to use client_location
gemini_client = genai.Client()

async def main():
    async with mcp_client:
        response = await gemini_client.aio.models.generate_content(
            model="gemini-2.5-flash",
            contents="get a detail file listing of all files including hidden files in the users home directory",
            #contents="can you list the tools available to monitor disk io performance on local host and test if they exist. show os version",
            config=genai.types.GenerateContentConfig(
                temperature=0,
                tools=[mcp_client.session],  # Pass the FastMCP client session
            ),
        )
        print(response.text)

#     await gemini_client.close()

if __name__ == "__main__":
    asyncio.run(main())
