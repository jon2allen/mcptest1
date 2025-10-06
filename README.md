

# FastMCP-Gemini Integration proof of concept/test.

A Python proof of concept to  use **Google Gemini AI** with **FastMCP** for secure command execution and tool access.

---

## **Features**
- AI-driven shell commands via FastMCP
- Custom tools example (e.g., dice roller, system info)
- Configurable command blocking for security
- CLI and script-based workflows
- only uses STDIO MCP protocol

---

## **Installation**
```bash

pre-req - must have Gemini/Google api key in ENV variable

git clone https://github.com/jon2allen/mcptest1.git

run vsetup.py to establish venv

run the command run.sh to run python and git examples

run "bash run_npm.sh" to run npm server/client test work/flow

* delete_repos_contents.sh - removes repos diredtory

```

``` bash

| File Name                  | Description                                                                                     |
|----------------------------|-------------------------------------------------------------------------------------------------|
| `cleanup_repo.sh`          | Removes all contents of the `repos` directory and deletes the directory itself.                |
| `client.py`                | Uses Gemini to list disk I/O monitoring tools and check OS version via FastMCP.                |
| `client2.py`               | Uses Gemini to list all files (including hidden) in the user's home directory via FastMCP.     |
| `command_cli.py`           | CLI to send custom prompts to Gemini/FastMCP. Supports both inline and file-based prompts.      |
| `command_cli_enh.py`       | Enhanced version of `command_cli.py` using `mcp_command_server_enh.py`.                        |
| `config.toml`              | Configuration file to block dangerous commands and set security overrides.                     |
| `delete_repos_contents.sh` | Deletes contents of the `repos` directory without removing the directory itself.               |
| `dice_client.py`           | Uses Gemini to roll 2 dice, multiply the results, and print the output via FastMCP.            |
| `dice_server.py`           | FastMCP server providing dice rolling and multiplication tools.                                |
| `git_prompt.txt`           | Sample prompt to set up a test Git repo with fake credentials and commits.                     |
| `LICENSE`                  | MIT License file.                                                                               |
| `list.py`                  | Lists available FastMCP tools, resources, and prompts.                                         |
| `list8.py`                 | Alternative script to list FastMCP tools and prompts using `mcp` library.                      |
| `mcp_command_server.py`    | FastMCP server for executing shell commands and providing system info.                          |
| `mcp_command_server_enh.py`| Enhanced FastMCP server with command blocking and config support.                               |
| `npm_client.py`            | Uses Gemini to list disk I/O tools via FastMCP, using the NPM-installed server location.       |
| `npm_client2.py`           | Uses Gemini to list files in the user's home directory via FastMCP, using NPM server location. |
| `npm_install.sh`           | Installs the `mcp-server-commands` NPM package and locates its main file.                      |
| `requirements.txt`         | Python dependencies: `google-genai`, `fastmcp`, and `tomli`.                                   |
| `run.sh`                   | Runs sample scripts and checks the status of the test Git repo.                                |
| `run_npm.sh`               | Installs the NPM package and runs the NPM client scripts.                                      |
| `vsetup.sh`                | Sets up a Python virtual environment and installs dependencies.                                |

``` 
