import JapanTaxLaw.CorporateLossCarryforward

/-!
# CorporateLossCarryforward spec — independent restatement of
  法人税法 art. 57（欠損金の繰越し）

Sources (pinned; identical to CorporateLossCarryforward.lean):

  Law id: 340AC0000000034
  Revision: 340AC0000000034_20261001_508AC0000000012
  Amendment enforcement date: 2026-10-01
  Raw snapshot sha256: 3B743C0FB772A2482ED143CBE2611E3B82E929868767514A3E1DB16F5C2EF342
  (data/raw/340AC0000000034_20261001_508AC0000000012.law.json,
   revision CurrentEnforced per data/INVENTORY.json)

Independent restatement of:
  * art. 57(1) 柱書 — 内国法人の各事業年度開始の日前十年以内に開始した事業年度において
    生じた欠損金額（国 tax base）は損金の額に算入する。ただし書： 損金算入限度額
    （当該各事業年度の所得の金額の百分の五十に相当する金額）を前年度の欠損金と合算して
    超える場合、その超える部分は当該年度に損金算入できない
  * art. 57(11) — 次の各号に掲げる内国法人の当該各号に定める各事業年度の所得に係る
    第一項ただし書の規定の適用については、同項ただし書中「所得の金額の百分の五十に相当する金額」
    とあるのは、「所得の金額」とする。
from the statutory text itself.
-/

namespace JapanTaxLaw

open JapanTaxLaw.TaxFinance

/-- Spec: art. 57(1)（1）柱・ただし書 — 所得の五十パーセント相当が上限。 -/
def specFiftyPercentCap (income : Nat) : Nat := income * 50 / 100

/-- Spec: art. 57(11) — 中小法人等等の場合は「所得の金額」そのもの。 -/
def specCarveOutCap (income : Nat) : Nat := income

/-- Spec: art. 57(1) ただし書、the carvezを適用した上限額。 -/
def specLossCap (isSme isReorg isFounding : Bool) (income alreadyUsed : Nat) : Nat :=
  let base := if isSme || isReorg || isFounding then specCarveOutCap income else specFiftyPercentCap income
  Nat.sub base alreadyUsed

/-- Spec: art. 57(1) 損金算入額。 -/
def specLossCarryforwardDeduction (isSme isReorg isFounding : Bool)
    (income lossAvailable alreadyUsed : Nat) : Nat :=
  min lossAvailable (specLossCap isSme isReorg isFounding income alreadyUsed)

-- ==== points (kernel-decided) ====

example : specFiftyPercentCap 10_000_000 = 5_000_000 := by decide
example : specFiftyPercentCap 9_999_999 = 4_999_999 := by decide
example : specFiftyPercentCap 0 = 0 := by decide
example : specLossCarryforwardDeduction false false false 10_000_000 6_000_000 0 = 5_000_000 := by decide
example : specLossCarryforwardDeduction true  false false 10_000_000 6_000_000 0 = 6_000_000 := by decide
example : specLossCarryforwardDeduction false true  false 10_000_000 6_000_000 0 = 6_000_000 := by decide
example : specLossCarryforwardDeduction false false true  10_000_000 6_000_000 0 = 6_000_000 := by decide
example : specLossCarryforwardDeduction false false false 10_000_000 6_000_000 3_000_000 = 2_000_000 := by decide
example : specLossCarryforwardDeduction false false false 10_000_000 6_000_000 8_000_000 = 0 := by decide
example : specLossCarryforwardDeduction false false false 0 1_000_000 0 = 0 := by decide

/-- Agreement examples between implementation and the Spec. -/
def agreeLossCarryforwardPoints : Bool :=
  [ false, true ].all fun s =>
  [ false, true ].all fun r =>
  [ false, true ].all fun fd =>
    [ (0, 0, 0), (10_000_000, 6_000_000, 0), (10_000_000, 6_000_000, 3_000_000),
      (10_000_000, 6_000_000, 5_000_000), (0, 9_000_000, 0),
      (2_000_000, 9_000_000, 0), (100_000_000, 100_000_000, 0) ].all fun (inc, loss, used) =>
      lossCarryforwardDeduction ⟨s, r, fd, inc, loss, used⟩ ==
        specLossCarryforwardDeduction s r fd inc loss used

example : agreeLossCarryforwardPoints = true := by decide

end JapanTaxLaw
