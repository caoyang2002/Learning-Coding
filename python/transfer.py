# # Copyright © Aptos Foundation
# # SPDX-License-Identifier: Apache-2.0
# import asyncio
# from typing import Union
# from nacl.signing import SigningKey, VerifyKey
# import aptos_sdk.ed25519 as ed25519
# from aptos_sdk.account import Account
# from aptos_sdk.account_address import AccountAddress
# from aptos_sdk.async_client import FaucetClient, IndexerClient, RestClient

# # API endpoints for devnet
# FAUCET_URL = "https://faucet.testnet.aptoslabs.com"
# INDEXER_URL = "https://api.testnet.aptoslabs.com/v1/graphql"
# NODE_URL = "https://api.testnet.aptoslabs.com/v1"

# def create_account_from_private_key(private_key: Union[str, bytes]) -> Account:
#     """
#     从私钥创建 Aptos 账户
#     :param private_key: 私钥（32字节的字节串或64字符的十六进制字符串）
#     :return: Account 对象
#     """
#     if isinstance(private_key, str):
#         # 如果是十六进制字符串，转换为字节
#         if private_key.startswith('0x'):
#             private_key = private_key[2:]
#         private_key = bytes.fromhex(private_key)
    
#     if len(private_key) != 32:
#         raise ValueError("Private key must be 32 bytes long")
    
#     # 使用 SigningKey 创建私钥
#     signing_key = SigningKey(private_key)
#     # 创建 ed25519.PrivateKey
#     private_key_obj = ed25519.PrivateKey(signing_key)
#     account_address = AccountAddress.from_key(private_key_obj.public_key())
#     return Account(account_address, private_key_obj)

# async def test_transfer(private_key: Union[str, bytes]):
#     """
#     测试从指定私钥账户转账到新生成的账户
#     :param private_key: 32字节的字节串或64字符的十六进制字符串（可选0x前缀）
#     """
#     try:
#         # 初始化客户端
#         rest_client = RestClient(NODE_URL)
#         faucet_client = FaucetClient(FAUCET_URL, rest_client)
#         indexer_client = IndexerClient(INDEXER_URL) if INDEXER_URL != "none" else None

#         # 创建账户
#         alice = create_account_from_private_key(private_key)
#         bob = Account.generate()

#         print("\n=== Addresses ===")
#         print(f"Alice(from private key): {alice.address()}")
#         print(f"Bob(new generated): {bob.address()}")

#         # 为账户注资
#         print("\n=== Funding Accounts ===")
#         alice_fund = faucet_client.fund_account(alice.address(), 100_000_000)
#         bob_fund = faucet_client.fund_account(bob.address(), 0)
#         await asyncio.gather(*[alice_fund, bob_fund])

#         # 检查初始余额
#         print("\n=== Initial Balances ===")
#         alice_balance = rest_client.account_balance(alice.address())
#         bob_balance = rest_client.account_balance(bob.address())
#         [alice_balance, bob_balance] = await asyncio.gather(*[alice_balance, bob_balance])
#         print(f"Alice: {alice_balance}")
#         print(f"Bob: {bob_balance}")

#         # Alice 转账给 Bob
#         print("\n=== Transferring 1000 coins from Alice to Bob ===")
#         txn_hash = await rest_client.bcs_transfer(
#             alice, bob.address(), 1_000
#         )
#         print(f"Transaction hash: {txn_hash}")
        
#         # 等待交易确认
#         await rest_client.wait_for_transaction(txn_hash)

#         # 检查转账后余额
#         print("\n=== Final Balances ===")
#         alice_balance = rest_client.account_balance(alice.address())
#         bob_balance = rest_client.account_balance(bob.address())
#         [alice_balance, bob_balance] = await asyncio.gather(*[alice_balance, bob_balance])
#         print(f"Alice: {alice_balance}")
#         print(f"Bob: {bob_balance}")

#     except Exception as e:
#         print(f"Error: {str(e)}")
#         raise
#     finally:
#         if 'rest_client' in locals():
#             await rest_client.close()

# if __name__ == "__main__":
#     # 示例私钥 - 32字节的十六进制字符串
#     PRIVATE_KEY = "0x5ded41771785f91640902649c354cfc7d84e417e25fb337426d2b98caf4edcf0"
    
#     try:
#         asyncio.run(test_transfer(PRIVATE_KEY))
#     except Exception as e:
#         print(f"Test failed: {str(e)}")



# Copyright © Aptos Foundation
# SPDX-License-Identifier: Apache-2.0
import asyncio
# from typing import Union
from aptos_sdk.account import Account
from aptos_sdk.account_address import AccountAddress
from aptos_sdk.async_client import FaucetClient, IndexerClient, RestClient
from aptos_sdk.ed25519 import PrivateKey  # 直接使用 SDK 的 PrivateKey
from nacl.signing import SigningKey


# API endpoints for devnet
FAUCET_URL = "https://faucet.devnet.aptoslabs.com"
INDEXER_URL = "https://api.devnet.aptoslabs.com/v1/graphql"
NODE_URL = "https://api.devnet.aptoslabs.com/v1"

# def create_account_from_private_key(key: str) -> Account:
#     """
#     从私钥创建 Aptos 账户
#     :param key: 私钥（hex字符串，可选0x前缀）
#     :return: Account 对象
#     """
#     # 直接使用 PrivateKey.from_str
#     private_key = PrivateKey.from_str(key)
#     account_address = AccountAddress.from_key(private_key.public_key())
#     return Account(account_address, private_key)




def create_account_from_private_key(private_key: str) -> Account:
    """
    从私钥创建 Aptos 账户
    :param private_key: 私钥（hex字符串，可选0x前缀）
    :return: Account 对象
    """
    # 移除可能的0x前缀
    if private_key.startswith('0x'):
        private_key = private_key[2:]
        
    # 创建 SigningKey
    signing_key = SigningKey(bytes.fromhex(private_key))
    # 创建 PrivateKey
    private_key_obj = PrivateKey(signing_key)
    # 创建账户
    account_address = AccountAddress.from_key(private_key_obj.public_key())
    return Account(account_address, private_key_obj)



async def test_transfer(private_key: str):
    """
    测试从指定私钥账户转账到新生成的账户
    :param private_key: hex字符串格式的私钥（可选0x前缀）
    """
    try:
        # 初始化客户端
        rest_client = RestClient(NODE_URL)
        faucet_client = FaucetClient(FAUCET_URL, rest_client)
        indexer_client = IndexerClient(INDEXER_URL) if INDEXER_URL != "none" else None

        # 创建账户
        alice = create_account_from_private_key(private_key)
        bob = Account.generate()

        print("\n=== Addresses ===")
        print(f"Alice(from private key): {alice.address()}")
        print(f"Bob(new generated): {bob.address()}")

        # 为账户注资
        print("\n=== Funding Accounts ===")
        alice_fund = faucet_client.fund_account(alice.address(), 100_000_000)
        bob_fund = faucet_client.fund_account(bob.address(), 0)
        await asyncio.gather(*[alice_fund, bob_fund])

        # 检查初始余额
        print("\n=== Initial Balances ===")
        alice_balance = rest_client.account_balance(alice.address())
        bob_balance = rest_client.account_balance(bob.address())
        [alice_balance, bob_balance] = await asyncio.gather(*[alice_balance, bob_balance])
        print(f"Alice: {alice_balance}")
        print(f"Bob: {bob_balance}")

        # Alice 转账给 Bob
        print("\n=== Transferring 1000 coins from Alice to Bob ===")
        txn_hash = await rest_client.bcs_transfer(
            alice, bob.address(), 1_000
        )
        print(f"Transaction hash: {txn_hash}")
        
        # 等待交易确认
        await rest_client.wait_for_transaction(txn_hash)

        # 检查转账后余额
        print("\n=== Final Balances ===")
        alice_balance = rest_client.account_balance(alice.address())
        bob_balance = rest_client.account_balance(bob.address())
        [alice_balance, bob_balance] = await asyncio.gather(*[alice_balance, bob_balance])
        print(f"Alice: {alice_balance}")
        print(f"Bob: {bob_balance}")

        # 查询交易历史
        if indexer_client:
            print("\n=== Transaction History ===")
            query = """
                query TransactionsQuery($account: String) {
                  account_transactions(
                    limit: 20
                    where: {account_address: {_eq: $account}}
                  ) {
                    transaction_version
                    coin_activities {
                      amount
                      activity_type
                      coin_type
                      entry_function_id_str
                      owner_address
                      transaction_timestamp
                    }
                  }
                }
            """
            variables = {"account": f"{bob.address()}"}
            data = await indexer_client.query(query, variables)
            transactions = data["data"]["account_transactions"]
            for tx in transactions:
                print(f"Transaction version: {tx['transaction_version']}")
                for activity in tx.get('coin_activities', []):
                    print(f"  Amount: {activity['amount']}")
                    print(f"  Type: {activity['activity_type']}")
                    print(f"  Time: {activity['transaction_timestamp']}")

    except Exception as e:
        print(f"Error: {str(e)}")
        raise
    finally:
        if 'rest_client' in locals():
            await rest_client.close()

if __name__ == "__main__":
    # 示例私钥 - hex字符串
    PRIVATE_KEY = "0x5ded41771785f91640902649c354cfc7d84e417e25fb337426d2b98caf4edcf0"
    # 也可以带0x前缀
    # PRIVATE_KEY = "0x37368b46ce665362562c6d890e2040b005b35001a4267f65dc2a1464608c2889"
    
    try:
        asyncio.run(test_transfer(PRIVATE_KEY))
    except Exception as e:
        print(f"Test failed: {str(e)}")