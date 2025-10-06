import random
from fastmcp import FastMCP

mcp = FastMCP(name="Dice Roller")

@mcp.tool
def roll_dice(n_dice: int) -> list[int]:
    """Roll `n_dice` 6-sided dice and return the results."""
    return [random.randint(1, 6) for _ in range(n_dice)]

@mcp.tool
def multiply(x: int, y:int) -> float:
    """
    multiply 2 numbers  

    :param x: The first number (multiplicand).
    :param y: The second number (multiplier).
    :return: The product of x and y.
    """
    return x * y


if __name__ == "__main__":
    mcp.run()
