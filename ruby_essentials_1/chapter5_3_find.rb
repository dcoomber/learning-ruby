#!/usr/bin/env ruby

# Notes
# * find / detect
# * find_all / select
# * any? / none?
# * all? / one?
# * delete_if

(1..10).detect { |i| i % 3 == 0 ? puts(i) : nil }

(1..10).find { |i| i % 3 == 0 ? puts(i) : nil }

fruits = ['apple', 'banana', 'orange', 'kiwi', 'pear']

fruits.find { |fruit| fruit.length > 5 ? puts(fruit) : nil }

pantry = { apple: 10, banana: 20, orange: 30, kiwi: 40, pear: 50 }

pantry.find_all { |key, value| value > 30 ? puts(key) : nil }

(1..10).one? { |i| i % 3 == 0 ? puts(i) : puts('none') }
