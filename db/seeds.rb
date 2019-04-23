MoneyFlow.destroy_all
Budget.destroy_all

Budget.create(start_at: Date.today, finished_at: Date.today >> 1)
MoneyFlow.create(kind: 2, category: 'expenditure', amount: 15, repeating: true)
MoneyFlow.create(kind: 0, category: 'remainder', amount: 1000, repeating: false, expected_date: Date.today)

3.times { FactoryBot.create(:income) }
3.times { FactoryBot.create(:expenditure) }
