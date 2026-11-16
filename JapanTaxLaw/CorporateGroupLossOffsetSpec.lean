import JapanTaxLaw.CorporateGroupLossOffset

/-!
# CorporateGroupLossOffset spec — independent restatement of
  法人税法 art. 64の5(2)（通算対象欠損金額）・art. 64の5(4)（通算対象所得金額）

Sources (pinned; identical to CorporateGroupLossOffset.lean):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342

Independent restatement of:
  * art. 64の5(2) — 通算対象欠損金額 = （第一号に掲げる金額：
      他の通算法人の通算前欠損金額の合計額（当該合計額が第三号に掲げる金額を超える場合には、
      その超える部分を控除した金額））
      × （第二号に掲げる金額（自社の通算前所得金額））
      ÷ （第三号に掲げる金額（自社＋他社の通算前所得金額の合計額））
  * art. 64の5(4) — 通算対象所得金額（対称）：
      （第一号： 他の通算法人の通算前所得金額の合計額（超過分控除））
      × （第二号： 自社の通算前欠損金額）
      ÷ （第三号： 自社＋他社の通算前欠損金額の合計額）
from the statutory text itself.

Scope boundaries identical to the implementation.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: §2 第一号 — 配分可能な欠損プール。 -/
def specPoolIntercompanyLoss (partnerLosses totalGroupIncome : Money) : Money :=
  min partnerLosses totalGroupIncome

/-- Spec: §4 第一号 — 配分可能な所得プール。 -/
def specPoolIntercompanyIncome (partnerIncomes totalGroupLoss : Money) : Money :=
  min partnerIncomes totalGroupLoss

/-- Spec: §2 — 通算対象欠損金額（ownIncome / groupIncome × pool）。 -/
def specIntercompanyLossDeduction (partnerLosses ownIncome totalGroupIncome : Money) : Money :=
  if totalGroupIncome = 0 then 0 else specPoolIntercompanyLoss partnerLosses totalGroupIncome * ownIncome / totalGroupIncome

/-- Spec: §4 — 通算対象所得金額。 -/
def specIntercompanyIncomeInclusion (partnerIncomes ownLoss totalGroupLoss : Money) : Money :=
  if totalGroupLoss = 0 then 0 else specPoolIntercompanyIncome partnerIncomes totalGroupLoss * ownLoss / totalGroupLoss

example : specPoolIntercompanyLoss 90 300 = 90 := by decide
example : specPoolIntercompanyLoss 400 300 = 300 := by decide
example : specIntercompanyLossDeduction 100 80 80 = 80 := by decide
example : specIntercompanyLossDeduction 50 100 200 = 25 := by decide
example : specIntercompanyLossDeduction 90 100 300 = 30 := by decide
example : specIntercompanyLossDeduction 500 0 0 = 0 := by decide
example : specIntercompanyLossDeduction 100 400 300 = 133 := by decide
example : specPoolIntercompanyIncome 200 160 = 160 := by decide
example : specPoolIntercompanyIncome 500 100 = 100 := by decide
example : specIntercompanyIncomeInclusion 200 80 160 = 80 := by decide
example : specIntercompanyIncomeInclusion 200 50 100 = 50 := by decide
example : specIntercompanyIncomeInclusion 100 0 0 = 0 := by decide
example : specIntercompanyIncomeInclusion 200 100 100 = 100 := by decide

/-- Agreement checks between implementation and Spec. -/
def agreeCorporateGroupLossPoints : Bool :=
  [ (80, 100, 80, 0, 0, 0),
    (80, 50, 80, 0, 0, 0),
    (100, 50, 200, 0, 0, 0),
    (100, 90, 300, 0, 0, 0),
    (0, 500, 0, 0, 0, 0),
    (400, 100, 300, 0, 0, 0),
    (0, 0, 0, 80, 200, 160),
    (0, 0, 0, 50, 200, 100),
    (0, 0, 0, 0, 100, 0),
    (0, 0, 0, 80, 200, 100),
    (0, 0, 0, 100, 500, 100) ].all fun (oi, pl, tgi, ol, pi, tgl) =>
    intercompanyLossDeduction ⟨oi, pl, tgi, ol, pi, tgl⟩ ==
      specIntercompanyLossDeduction pl oi tgi
    && intercompanyIncomeInclusion ⟨oi, pl, tgi, ol, pi, tgl⟩ ==
      specIntercompanyIncomeInclusion pi ol tgl

example : agreeCorporateGroupLossPoints = true := by decide

end JapanTaxLaw
