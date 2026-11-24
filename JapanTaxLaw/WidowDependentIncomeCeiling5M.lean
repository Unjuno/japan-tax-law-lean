import JapanTaxLaw.TaxFinance

/-!
# WidowDependentIncomeCeiling5M — 地方税法 art.23 第11号イ(2)・第12号ロの合計所得金額 五百万円以下（bounded L4 モデル）

Sources (pinned):
  Law id: 325AC0000000226
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json

原文逐語:
  「前年の合計所得金額が五百万円以下であること。」
  （第11号イ（寡婦）の要件(2)。第12号ロ（ひとり親）は「イ（２）…を満たすもの」として同一要件を援用。）

Predicate（原文の金額要件のみ）:
  withinCeiling(priorYearTotalIncome) = priorYearTotalIncome <= 5_000_000

Scope / NOT MODELLED:
  - 寡婦・ひとり親の他の要件（扶養親族の有無、婚姻関係、事実上婚姻関係と同様の事情、
    総務省令の指定、障害者・控除対象配偶者の定義）は NOT MODELLED。
  - 前年の合計所得金額そのものの算定、所得控除、税額計算、市町村民税側の対応条項は NOT MODELLED。
  - 本モデルは所与の金額に対する「五百万円以下」判定のみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.WidowDependentIncomeCeiling5M

open JapanTaxLaw.TaxFinance

/-- 原文の金額閾値（五百万円）。 -/
def incomeCeiling : Money := 5_000_000

/-- 前年の合計所得金額が五百万円以下かどうか（境界値を含む）。 -/
def withinCeiling (priorYearTotalIncome : Money) : Bool :=
  priorYearTotalIncome <= incomeCeiling

example : withinCeiling 0 = true := by decide
example : withinCeiling 5_000_000 = true := by decide
example : withinCeiling 5_000_001 = false := by decide

end JapanTaxLaw.WidowDependentIncomeCeiling5M
