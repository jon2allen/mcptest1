from fastmcp import Client
from google import genai
import asyncio

mcp_client = Client("./mcp_command_server.py")
gemini_client = genai.Client()

async def main():    
    async with mcp_client:
        response = await gemini_client.aio.models.generate_content(
            model="gemini-2.5-pro",
            # contents="get a detail file listing of all files including hidden files in /home/jon2allen/",
            contents="can you list the tools available to monitor disk io performance on local host and test if they exist. show os version" ,
            config=genai.types.GenerateContentConfig(
                temperature=0,
                tools=[mcp_client.session],  # Pass the FastMCP client session
            ),
        )
        print(response.text)

#    await gemini_client.close()

if __name__ == "__main__":
    asyncio.run(main())
