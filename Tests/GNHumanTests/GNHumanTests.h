//
//  GNHumanTests.h
//  GNLearnC
//
//  Created by Igor Devyatko on 10/18/15.
//  Copyright © 2015 IDAP College. All rights reserved.
//

#ifndef GNHumanTests_h
#define GNHumanTests_h

#include <stdio.h>

//1. Создать объектную структуру данных человек, имеющую поля имя, возраст, пол, количество детей, женат или нет, указатель на партнера, на родителей и на массив с детьми, где могло бы быть, максимум, 20 детей.
//Требования:
//- каждая из сущностей, будь то строка или массив, должны быть обернуты в свой объект, который, как минимум, умел бы выполнять подсчет ссылок и имел базовые аксессоры и тесты;
//- реализовать подсчет ссылок, геттеры и сеттеры для полей;
//- реализовать метод жениться, который бы устанавливал поле женат в true и указатель на партнера, с которым был брак;
//- реализовать метод развестись, который бы устанавливал поле женат и указатель на партнера;
//- реализовать метод произвести потомство, который бы создавал ребенка, устанавливал ему родителей, а у родителей добавлял бы ребенка;
//- создать тесты на все поведение человека.


// User story:


    //(инициализация по дефолту)
// После вызова метода Создать Человека мужского пола:
//   объект не должен быть нулевым
//   reference count должен быть равен 1
//   пол должен быть мужской
//   возраст должен быть равен 1

// После вызова метода Создать Человека женского пола:
//   объект не должен быть нулевым
//   reference count должен быть равен 1
//   пол должен быть женский
//   возраст должен быть равен 1


    //(по дефолту мужчина овладевает женщиной)
// При вызове метода Женитьба:
//   оба объекта должны быть не нулевыми
//   объекты должны быть не одного пола
//   поле партнер у мужчины должно быть нулевым, если не нулевое вызвать развод
//   поле партнер у женщины должно быть нулевым, если не нулевое вызвать развод
// После вызова метода Женитьба:
//   поле партнер у мужчины должен быть не нулевым
//   поле партнер у женщины должен быть не нулевым
//   reference count у мужчины должен остаться прежним
//   reference count у женщины должен увеличится на 1

// При вызове метода Развод:
//   объект должны быть не нулевым
//   поле партнер у объекта должно быть не нулевое
// После вызова метода Развод:
//   поле партнер у объекта должно быть нулевым
//   если объект женщина reference count должнен уменьшиться на 1


//(по дефолту родители овладевают детьми)
// При вызове метода Добавить Ребенка:
//   объект которому добавляем ребенка должен быть не нулевым
//   объект ребенок должен быть не нулевым
// После вызова метода Добавить Ребенка:
//   массив с детьми должен увеличиться на 1 объект
//   количество детей должно увеличится на 1
//   указатели на родителей у ребенка должны быть не нулевыми
//   reference count у ребенка должен увеличится на 1

// При вызове метода Удалить Детей:
//   объект должен быть не нулевым
//   количество детей у объекта не должно быть нулевым
// После вызова метода Удалить Детей:
//   количество детей должно быть нулевым
//   reference count у ребенка(детей) должнен уменьшится на 1
//   поле родителя у ребенка должно быть нулевым


// При вызова метода Убить Человека:
//   объект не должен быть нулевым
//   reference count не должен быть равен 0
// После вызова метода Убить Человека:
//   объект должен быть нулевым

#endif
