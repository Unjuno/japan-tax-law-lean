import JapanTaxLaw.TaxFinance

/-!
# DonationTaxCredit — 寄附金税額控除（地方税法 art.37の2 §1）bounded L4 モデル

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  Article Num 37_2 §1, flat/normalized leaf text 4573 chars. Needles contain no U+3000.

原文逐語（第1項）:
  「...寄附金の額の合計額（当該合計額が前年の総所得金額、退職所得金額及び山林所得金額の
    合計額の百分の三十に相当する金額を超える場合には、当該百分の三十に相当する金額）
    が二千円を超える場合には、その超える金額の百分の四
    （当該納税義務者が指定都市の区域内に住所を有する場合には、百分の二）に相当する金額」

Computation（原文逐語から導出、上限適用・控除額の多段計算、単位: 円）:
  cap = totalIncome * 30 / 100
  capped = if donationTotal > cap then cap else donationTotal
  excess = if capped > 2000 then capped - 2000 else 0
  credit = excess * (if designatedCity then 2 else 4) / 100

Scope / NOT MODELLED:
  - 特例控除対象寄附金の加算・特例控除額・所得割額上限は NOT MODELLED。
  - 寄附金の定義・総所得金額等の算定・指定都市の認定は NOT MODELLED。
本モデルは法的レビューを提供しない。
-/

namespace JapanTaxLaw.DonationTaxCredit

open JapanTaxLaw.TaxFinance

/-- 寄附金税額控除額（2000円超部分×4%、指定都市は2%）。 -/
def credit (donationTotal : Money) (totalIncome : Money) (designatedCity : Bool) : Money :=
  let cap := totalIncome * 30 / 100
  let capped := if donationTotal > cap then cap else donationTotal
  let excess := if capped > 2000 then capped - 2000 else 0
  if designatedCity then excess * 2 / 100 else excess * 4 / 100

example : credit 10000 100000 false = 320 := by decide  -- min(10000,30000)-2000=8000, ×4%
example : credit 10000 100000 true = 160 := by decide   -- 指定都市 ×2%
example : credit 2000 100000 false = 0 := by decide
example : credit 100000 100000 false = 1120 := by decide -- cap=30000, -2000=28000, ×4%

end JapanTaxLaw.DonationTaxCredit
