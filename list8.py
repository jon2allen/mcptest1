import asyncio
from mcp import StdioServerParameters, ClientSession
from mcp.client.stdio import stdio_client
# It's good practice to import the specific result types for clarity
from mcp.types import ListToolsResult, ListPromptsResult

# --- Configuration ---
server_params = StdioServerParameters(
    command="npx",
    args=["mcp-server-commands"],
)

async def list_capabilities():
    """
    Connects to the MCP server and correctly parses the list of tools and prompts
    by accessing the attributes of the result objects.
    """
    print("Attempting to connect to MCP server...")
    async with stdio_client(server_params) as streams:
        reader, writer = streams
        
        async with ClientSession(reader, writer) as session:
            await session.initialize()
            print("MCP Session initialized. Fetching capabilities...")

            try:
                # --- Get Tools ---
                tool_response: ListToolsResult = await session.list_tools()
                
                # --- CORRECTION APPLIED HERE ---
                # Access the list of tools via the '.tools' attribute
                available_tools = tool_response.tools

                print("\n--- ✅ AVAILABLE TOOLS ---")
                if not available_tools:
                    print("No tools found in the response.")
                else:
                    for tool_details in available_tools:
                        # tool_details is an object, so we access its attributes directly
                        tool_name = tool_details.name
                        description = tool_details.description or 'No description available.'
                        print(f"  - Name: {tool_name}")
                        print(f"    Description: {description}")
                        print("-" * 25)

                # --- Get Prompts ---
                prompt_response: ListPromptsResult = await session.list_prompts()

                # --- CORRECTION APPLIED HERE ---
                # Access the list of prompts via the '.prompts' attribute
                available_prompts = prompt_response.prompts

                print("\n--- 📝 AVAILABLE PROMPTS ---")
                if not available_prompts:
                    print("No prompts found in the response.")
                else:
                    for prompt_details in available_prompts:
                        # prompt_details is an object, so we access its attributes directly
                        prompt_name = prompt_details.name
                        description = prompt_details.description or 'No description available.'
                        print(f"  - Name: {prompt_name}")
                        print(f"    Description: {description}")
                        print("-" * 25)

            except Exception as e:
                print(f"An error occurred while listing capabilities: {e}")

if __name__ == "__main__":
    asyncio.run(list_capabilities())
