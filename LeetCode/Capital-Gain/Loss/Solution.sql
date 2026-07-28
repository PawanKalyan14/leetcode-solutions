# Helper function to update prices in 'stocks' DataFrame.
def helper(operation, price):
    if operation == "Buy":
        return -int(price)
    elif operation == "Sell":
        return int(price)