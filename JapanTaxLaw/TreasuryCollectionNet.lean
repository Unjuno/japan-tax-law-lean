import JapanTaxLaw.TaxFinance

/-!
# TreasuryCollectionNet — 国税収納金整理資金に関する法律 art. 14(1) 歳入組み入れ額（bounded slice）

Sources (pinned):
  Law id: 329AC0000000036
  Revision: 329AC0000000036_20240101_431AC0000000003
  Raw snapshot: data/raw/329AC0000000036_20240101_431AC0000000003.law.json
  Normative id: NORM|fb11fb27038e069e40cf5a7335a457a5e159a7acf4f6c409f65a67d3b31a8a1b
  Article Num 14, paragraph 1.

原文逐語（pinned clause, extracted from the raw snapshot）:
  「財務大臣は、毎会計年度、政令で定めるところにより、当該年度の初日から翌年度の五月三十一日までの期間内において資金に受け入れた国税収納金等（国税に係る返納金で政令で定めるもの並びに特定地方税及びこれに係る返納金を除く。）で当該年度に所属するものの額から当該年度において支払の決定をした過誤納金の還付金等（特定地方税に係る過誤納金の還付金等を除く。第三項において同じ。）の額を控除した額を、当該年度の一般会計又は特別会計の歳入に組み入れるものとする。」

Computation（単位: 円。組み入れ額 = 受入国税収納金等 - 過誤納還付金等、Nat 飽和）:
  net(collected, refunds, withinPeriod) =
    if withinPeriod then collected - min refunds collected else 0

Scope / NOT MODELLED:
  - 会計年度・「年度の初日から翌年度の五月三十一日まで」の日付計算、
    政令で定める返納金の区分、特定地方税の除外判定、一般会計/特別会計の
    区分は NOT MODELLED。Those facts are explicit provider inputs.
  - 本モデルは差額計算の計算スライスのみを扱い、法的レビューを提供しない。
-/

namespace JapanTaxLaw.TreasuryCollectionNet

/-- 資金に受け入れた国税収納金等から過誤納金の還付金等を控除した額。 -/
def netCollection (collected : Nat) (refunds : Nat) (withinPeriod : Bool) : Nat :=
  if !withinPeriod then 0 else
    let deduction := if refunds < collected then refunds else collected
    collected - deduction

example : netCollection 0 0 true = 0 := by decide
example : netCollection 1 0 true = 1 := by decide
example : netCollection 100 40 true = 60 := by decide
example : netCollection 100 100 true = 0 := by decide
example : netCollection 100 150 true = 0 := by decide
example : netCollection 100 40 false = 0 := by decide

end JapanTaxLaw.TreasuryCollectionNet
