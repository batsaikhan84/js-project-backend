require 'faker'
require 'securerandom'
category = ['home' ,'food', 'childCare', 'healthCare', 'transportation', 'personalCare', 'petCare', 'entertainment']
incomeType = ['salary', 'bonus', 'sideIncome']
paymentType = ['cash', 'creditCard']
date = [['2020-01-01', '2020-01-31'],
        ['2020-02-01', '2020-02-28'],
        ['2020-03-01', '2020-03-31'],
        ['2020-04-01', '2020-04-30'],
        ['2020-05-01', '2020-05-31'],
        ['2020-06-01', '2020-06-30'],
        ['2020-07-01', '2020-07-31'],
        ['2020-08-01', '2020-08-31'],
        ['2020-09-01', '2020-09-30'],
        ['2020-10-01', '2020-10-31'],
        ['2020-11-01', '2020-11-30'],
        ['2020-12-01', '2020-12-31']]
user_number = 3

user_number.times do 
    User.create do |user|
        user.first_name = Faker::Name.first_name
        user.last_name = Faker::Name.last_name
    end
end
u = 1
while u < User.all.length + 1 do
    m = 0
    while m < date.length do
        10.times do
            Expense.create do |expense|
                expense.name = Faker::Lorem.word
                expense.amount = Faker::Number.decimal(l_digits: 2)
                expense.category = category.sample 
                expense.date = Faker::Date.between(from: date[m][0], to: date[m][1])
                expense.note = Faker::Lorem.sentence
                expense.paymentType = paymentType.sample
                expense.user_id = u
            end
        end
        m += 1
    end
    u += 1
end
j = 1
while j < User.all.length + 1 do 
    i = 0  
    while i < date.length do
        incomeType.each do |e|
            Income.create do |income|
                income.name = e
                if e == 'salary'
                    income.isSupplement = false
                    income.amount = Faker::Number.between(from: 4000, to: 6000)
                elsif e == 'bonus'
                    income.isSupplement = true
                    income.amount = Faker::Number.between(from: 0, to: 500)
                elsif e == 'sideIncome'
                    income.isSupplement = true
                    income.amount = Faker::Number.between(from: 0, to: 300)
                end
                income.date = Faker::Date.between(from: date[i][0], to: date[i][1])
                income.user_id = j  
            end
        end
        i += 1
    end
    j += 1
end