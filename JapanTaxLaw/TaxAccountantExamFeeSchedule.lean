import JapanTaxLaw.TaxFinance

/-!
# TaxAccountantExamFeeSchedule — 税理士法施行令 art. 6_2（税理士試験 受験料 四千円＋二科目目以降千五百円加算）

Sources (pinned):

  Law id: 326CO0000000216
  Revision: 326CO0000000216_20240401_505CO0000000146
  Raw snapshot: data/raw/326CO0000000216_20240401_505CO0000000146.law.json

Pinned 原文: 「法第九条第一項に規定する政令で定める額は、受験科目の数が一である場合にあつては四千円、受験科目の数が二以上である場合にあつては四千円と千五百円に一を超える受験科目の数を乗じて得た額との合計額とする。」

Scoped claim: only the linear schedule: base amount + increment for each unit
above the statutory threshold. `x : Nat` is 税理士試験 受験料 四千円＋二科目目以降千五百円加算. Domain Nat; unit 円.
-/

namespace JapanTaxLaw.TaxAccountantExamFeeSchedule

def baseAmount : Nat := 4000
def perUnit : Nat := 1500
def threshold : Nat := 1

def amount (x : Nat) : Nat :=
  baseAmount + perUnit * (x - threshold)

theorem constants : baseAmount = 4000 ∧ perUnit = 1500 ∧ threshold = 1 := by
  constructor
  · rfl
  constructor <;> rfl

end JapanTaxLaw.TaxAccountantExamFeeSchedule
