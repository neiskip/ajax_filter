-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 08 2021 г., 17:01
-- Версия сервера: 10.4.14-MariaDB
-- Версия PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `ajax_ask`
--
CREATE DATABASE IF NOT EXISTS `ajax_ask` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ajax_ask`;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(11) NOT NULL,
  `cat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`cat_id`, `cat`) VALUES
(1, 'Телевизор'),
(2, 'Утюг'),
(3, 'Чайник');

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `color_id` int(11) NOT NULL,
  `color` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`color_id`, `color`) VALUES
(4, 'белый'),
(2, 'желтый'),
(3, 'красный'),
(1, 'черный');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `cat` varchar(30) NOT NULL,
  `color` varchar(30) NOT NULL,
  `weight` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `cat`, `color`, `weight`, `title`) VALUES
(1, 'Телевизор', 'черный', '1 кг', 'LG HREG51'),
(2, 'Телевизор', 'белый', '1 кг', 'SAMSUNG N692'),
(3, 'Телевизор', 'желтый', '5 кг', 'SAMSUNG P888'),
(4, 'Утюг', 'белый', '1 кг', 'POLARIS PR2'),
(5, 'Утюг', 'черный', '1 кг', 'LG GY5'),
(6, 'Утюг', 'желтый', '10 кг', 'LG GY5'),
(7, 'Чайник', 'красный', '5 кг', 'POLARIS RIS'),
(8, 'Чайник', 'черный', '1 кг', 'PANASONIC NIC'),
(9, 'Чайник', 'желтый', '5 кг', 'QEUNUA RT2'),
(10, 'Телевизор', 'красный', '10 кг', 'SONY X5SA21');

-- --------------------------------------------------------

--
-- Структура таблицы `weights`
--

CREATE TABLE `weights` (
  `weight_id` int(11) NOT NULL,
  `weight` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `weights`
--

INSERT INTO `weights` (`weight_id`, `weight`) VALUES
(1, '1 кг'),
(3, '10 кг'),
(2, '5 кг');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD UNIQUE KEY `cat` (`cat`);

--
-- Индексы таблицы `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`color_id`),
  ADD UNIQUE KEY `color` (`color`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_fk_categories` (`cat`),
  ADD KEY `products_fk_colors` (`color`),
  ADD KEY `products_fk_weights` (`weight`);

--
-- Индексы таблицы `weights`
--
ALTER TABLE `weights`
  ADD PRIMARY KEY (`weight_id`),
  ADD UNIQUE KEY `weight` (`weight`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `colors`
--
ALTER TABLE `colors`
  MODIFY `color_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `weights`
--
ALTER TABLE `weights`
  MODIFY `weight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_fk_categories` FOREIGN KEY (`cat`) REFERENCES `categories` (`cat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_fk_colors` FOREIGN KEY (`color`) REFERENCES `colors` (`color`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_fk_weights` FOREIGN KEY (`weight`) REFERENCES `weights` (`weight`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
