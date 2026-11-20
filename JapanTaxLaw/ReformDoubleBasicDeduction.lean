import JapanTaxLaw.TaxFinance

/-!
# ReformDoubleBasicDeduction — 税制改革関連法 art.9（相続税及び贈与税の負担の軽減及び合理化等）bounded L4 モデル

Sources (pinned):
  Law id: 363AC0000000107
  Revision: 363AC0000000107_19881230_000000000000000
  Raw snapshot: data/raw/363AC0000000107_19881230_000000000000000.law.json
  Article Num 9, flat/normalized leaf text 286 chars, U+3000 count 0.

原文逐語:
  「一 健全な資産の形成と国民生活の安定等に配慮し、遺産に係る基礎控除等を
     二倍に引き上げるとともに、税率区分の幅を拡大するほか、最高税率を引き下げること。」

Computation（原文逐語から導出）:
  doubled = 2 × base（遺産に係る基礎控除等を二倍に引き上げる）

Scope: これは税制改革の基本方針を定める規定であり、実際の控除額は
個別法令（相続税法 etc.）で定義される。base は caller-established。
税率区分の拡大・最高税率の引き下げ・配偶者非課税範囲の拡大・
養子数の制限・贈与税税率区分の拡大は NOT MODELLED。
-/

namespace JapanTaxLaw.ReformDoubleBasicDeduction

open JapanTaxLaw.TaxFinance

/-- 「二倍に引き上げる」= base × 2。 -/
def doubled (base : Money) : Money := base * 2

example : doubled 0 = 0 := by decide
example : doubled 1 = 2 := by decide
example : doubled 500 = 1000 := by decide
example : doubled 1_000_000 = 2_000_000 := by decide

end JapanTaxLaw.ReformDoubleBasicDeduction
