import asyncio
from aptos_sdk.async_client import FaucetClient, RestClient
from aptos_sdk.account import Account
from aptos_sdk.account_address import AccountAddress

async def main():
    # Create API and faucet clients.
    rest_client = RestClient("https://api.testnet.aptoslabs.com/v1")
    faucet_client = FaucetClient("https://faucet.testnet.aptoslabs.com", rest_client)

    # Create Bob's account
    bob = AccountAddress.from_str("0x5dcb60faa729186d2bf13e21241e5edd0222c69ccb4973324511c21ee19a3626")
    print(f"Bob's address: {bob}")

    try:
        # Fund the account
        await faucet_client.fund_account(bob, 500_000_000)
        print("Account funded successfully")
    except Exception as e:
        print(f"Error funding account: {e}")
        return

    try:
        # Get account balance
        bob_balance = await rest_client.account_balance(bob)
        print(f"\n=== 账户余额 ===")
        print(f"Bob's balance: {bob_balance} coins")
    except Exception as e:
        print(f"Error getting account balance: {e}")

if __name__ == "__main__":
    asyncio.run(main())