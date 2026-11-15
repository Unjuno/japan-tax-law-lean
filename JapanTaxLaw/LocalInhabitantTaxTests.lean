import JapanTaxLaw.LocalInhabitantTax

/-!
# LocalInhabitantTax tests — 地方税法 art. 314の3 smoke checks

Decidable smoke tests for the municipal inhabitant tax income slice, pinned to
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Amendment enforcement date: 2026-11-01

Each `example` covers art. 314の3's flat standard rate boundary cases:
6% default / 8% designated-city-resident, the three-taxable-elements sum
computation, and the zero/mixed cases.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

-- art. 314の3: 所得割の標準税率 = 6% （指定都市区域内住所者 = 8%）
example : localInhabitantIncomeTaxAmount 10_000_000 0 0 false = 600_000 := by decide
example : localInhabitantIncomeTaxAmount 10_000_000 0 0 true = 800_000 := by decide

-- art. 314の3: 課税総所得金額+課税退職所得金額+課税山林所得金額の合計算出
example : localInhabitantIncomeTaxAmount 1_000_000 1_000_000 1_000_000 false = 180_000 := by decide
example : localInhabitantIncomeTaxAmount 1_000_000 1_000_000 1_000_000 true = 240_000 := by decide

-- art. 314の3: 0 is 0
example : localInhabitantIncomeTaxAmount 0 0 0 false = 0 := by decide
example : localInhabitantIncomeTaxAmount 0 0 0 true = 0 := by decide

-- art. 314の3: designated-city gap exactly 2 percentage points on 10,000,000
example : localInhabitantIncomeTaxAmount 10_000_000 0 0 true - localInhabitantIncomeTaxAmount 10_000_000 0 0 false = 200_000 := by decide

-- art. 314の3: 24,000,000 でも標準税率のまま（所得によらず一律の税率）
example : localInhabitantIncomeTaxAmount 24_000_000 0 0 false = 1_440_000 := by decide
example : localInhabitantIncomeTaxAmount 24_000_000 0 0 true = 1_920_000 := by decide

-- art. 314の3: 24_500_000+ still same flat rate
example : localInhabitantIncomeTaxAmount 25_000_000 0 0 false = 1_500_000 := by decide
example : localInhabitantIncomeTaxAmount 25_000_000 0 0 true = 2_000_000 := by decide

end JapanTaxLaw
