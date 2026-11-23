import JapanTaxLaw.TaxFinance

/-
# AreaMultiplierSixTwo — 地方税法 第三十一条（滅失建物等の面積 六倍・特例二倍）

Pinned source:
  Law id: 423CO0000000112
  Revision: 423CO0000000112_20260401_508CO0000000102
  Raw snapshot: data/raw/423CO0000000112_20260401_508CO0000000102.law.json
  SHA-256: d1e8cc26fcec663e706cec8859f4175d1c282f5670bd21a9649d786836db6964
  Statutory article: 第三十一条 (art. 31; raw JSON Article attr.Num = "31",
    scoped Article 31 = 384 chars; needle occurs verbatim exactly once).

原文逐語（pinned, 一字一句改変なし; scoped Article 31）:
  「り当該共用部分の床面積を按あん分して計算した面積を含む。））に六（前条第三項第一号の建物にあっては、二）を乗じて計算した面積と当該滅失建物等の敷地の用に供されていた土地の面積とのいずれか大きい面積とする。」

Variable contract:
  area : Nat = 計算した面積 (the computed area; the apportionment itself is not modelled).
  isSpecial : Bool = whether the building is 前条第三項第一号の建物.
  generalMultiplier = 6 (六); specialMultiplier = 2 (二) for the special building.
  multipliedArea area isSpecial = (if isSpecial then 2 else 6) * area.

Scope: ONLY the explicit conditional multiplier 六 / 二 is modelled.
  NOT MODELLED: the max-with-land-area comparison (いずれか大きい面積), the
  床面積の按あん分 (apportionment), and every other provision.
  This is a CONDITIONAL MULTIPLIER norm — not a threshold, cap, ratio,
  rounding or tier. Proofs use only rfl / by decide.
-/

namespace JapanTaxLaw.AreaMultiplierSixTwo

/-- 六 — general multiplier. -/
def generalMultiplier : Nat := 6

/-- 二 — special multiplier for 前条第三項第一号の建物. -/
def specialMultiplier : Nat := 2

/-- 計算した面積に六（特別な建物は二）を乗じて計算した面積。 -/
def multipliedArea (area : Nat) (isSpecial : Bool) : Nat :=
  (if isSpecial then specialMultiplier else generalMultiplier) * area

theorem generalMultiplier_is_six : generalMultiplier = 6 := rfl

theorem specialMultiplier_is_two : specialMultiplier = 2 := rfl

theorem multipliedGeneralTen : multipliedArea 10 false = 60 := by decide

theorem multipliedSpecialTen : multipliedArea 10 true = 20 := by decide

theorem multipliedZero : multipliedArea 0 false = 0 := by decide

theorem multipliedSpecialOne : multipliedArea 1 true = 2 := by decide

end JapanTaxLaw.AreaMultiplierSixTwo
