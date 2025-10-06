from fastmcp import Client
from google import genai
import asyncio

mcp_client = Client("dice_server.py")
gemini_client = genai.Client()

async def main():    
    async with mcp_client:
        response = await gemini_client.aio.models.generate_content(
            model="gemini-2.0-flash",
            contents="Roll 2 dice! Then multiply the 2 numbers and print",
            config=genai.types.GenerateContentConfig(
                temperature=0,
                tools=[mcp_client.session],  # Pass the FastMCP client session
            ),
        )
        print(response.text)

#    await gemini_client.close()

if __name__ == "__main__":
    asyncio.run(main())
