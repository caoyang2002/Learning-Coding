import yaml
from loguru import logger
import pywxdll
from utils.plugin_interface import PluginInterface
import asyncio
from aptos_sdk.async_client import FaucetClient, RestClient
from aptos_sdk.account_address import AccountAddress

class apt_faucet(PluginInterface):
    def __init__(self):
        self.config = self.load_config()
        self.bot = pywxdll.Pywxdll(self.config["ip"], self.config["port"])
        self.rest_client = RestClient("https://api.testnet.aptoslabs.com/v1")
        self.faucet_client = FaucetClient("https://faucet.testnet.aptoslabs.com", self.rest_client)

    def load_config(self):
        try:
            with open("main_config.yml", "r", encoding="utf-8") as f:
                return yaml.safe_load(f.read())
        except Exception as e:
            logger.error(f"加载配置文件失败: {e}")
            raise

    async def run(self, recv):
        content = [item for item in recv["content"] if item.strip()]
        logger.info(f"收到领取 gas 命令: {content}")

        if len(content) < 2:
            return await self.send_help(recv)

        amount, address = self.parse_command(content)
        if not address:
            return await self.send_error(recv, "无法获取有效的地址")

        await self.process_faucet(recv, address, amount)

    def parse_command(self, content):
        amount = 10_000_000  # 默认 10 APT
        address = None
        
        if len(content) == 2:
            address = content[1]
        elif len(content) >= 3:
            try:
                amount = int(float(content[1]) * 100_000_000)  # 转换为 octas
                address = content[2]
            except ValueError:
                address = content[1]

        return amount, address

    async def process_faucet(self, recv, address, amount):
        try:
            account_address = AccountAddress.from_str(address)
            await self.faucet_client.fund_account(account_address, amount)
            balance = await self.rest_client.account_balance(account_address)
            await self.send_success(recv, address, amount, balance)
        except Exception as e:
            logger.error(f"领取 gas 时发生错误: {e}")
            await self.send_error(recv, f"领取 gas 失败: {e}")

    async def send_message(self, recv, message, log_level="info"):
        getattr(logger, log_level)(f'[发送信息]{message}| [发送到] {recv["from"]}')
        self.bot.send_text_msg(recv["from"], message)

    async def send_help(self, recv):
        help_message = (
            "\n帮助信息:\n"
            "在指定的地址领取 Gas，默认在 testnet 领取 10 个 APT\n\n"
            "指令: \n"
            "领取 10 个 APT：\n"
            "/gas 0x123456789\n"
            "领取指定数量的 APT：\n"
            "/gas 5 0x123456789\n"
        )
        await self.send_message(recv, help_message)

    async def send_error(self, recv, message):
        await self.send_message(recv, f"\n❌ {message}", "error")

    async def send_success(self, recv, address, amount, balance):
        message = (
            f"\n✅ 成功为地址 {address} 领取了 {amount/100_000_000} APT！\n"
            f"当前账户余额: {balance/100_000_000} APT"
        )
        await self.send_message(recv, message)