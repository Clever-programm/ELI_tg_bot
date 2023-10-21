import asyncio
import logging
import sys
import os
from dotenv import load_dotenv

from aiogram import Bot, Dispatcher
from aiogram.filters import CommandStart
from aiogram.types import Message, ReplyKeyboardRemove, \
    ReplyKeyboardMarkup, KeyboardButton, \
    InlineKeyboardMarkup, InlineKeyboardButton

load_dotenv()
TOKEN = os.getenv('BOT_TOKEN')

bot = Bot(token=TOKEN)
dp = Dispatcher(bot=bot)


@dp.message(CommandStart())
async def start_handler(message: Message) -> None:
    role_kb = [
        [KeyboardButton(text="Ученик")],
        [KeyboardButton(text="Учитель")],
        [KeyboardButton(text="Директор")],
        [KeyboardButton(text="Разработчик")]
    ]
    keyboard = ReplyKeyboardMarkup(keyboard=role_kb)
    await message.answer(f'''Привет, {message.from_user.full_name}

Это бот, с помощью которого вы сможете отслеживать свои оценки

Для начала работы укажите, кем вы являетесь:''', reply_markup=keyboard)


@dp.message()
async def message_handler(message: Message) -> None:
    if message.text == 'Ученик':
        await message.answer(f'Добро пожаловать в электронный дневник, ведь вы {message.text}')
    elif message.text == 'Учитель':
        await message.answer(f'Добро пожаловать в электронный журнал, ведь вы {message.text}')
    elif message.text == 'Директор':
        await message.answer(f'Добро пожаловать в информацию о работниках, ведь вы {message.text}')
    elif message.text == 'Разработчик':
        await message.answer(f'Добро пожаловать в рабочее пространство, ведь вы {message.text}')
    else:
        await message.answer(f'В базе нет такой роли: {message.text}')
