import Std
import JapanTaxLaw.TaxFinance

/-
# SpecialCorpBusinessTaxZeroFloor — 特別法人事業税及び特別法人事業譲与税に関する法律施行令 附則第二条 第一項 第一号
（払込予定額−還付金等、零を下回れば零）

Pinned sources:
  Law id: 431CO0000000089 (特別法人事業税及び特別法人事業譲与税に関する法律施行令)
  Revision: 431CO0000000089_20240401_506CO0000000012 (enforced 2024-04-01)
  Raw snapshot: data/raw/431CO0000000089_20240401_506CO0000000012.law.json
  Supplementary article Num 2, Paragraph 1, Item 1, Column 2, Sentence 1.
  source_path: LawBody[3]/SupplProvision/SupplProvision[2]/Article:2/Article#2/Paragraph#1/Item#1/ItemSentence/Column#2/Sentence#1
  Normative unit: NORM|46867af69849a271b34d3e75f11c977e3a6be6b25e1c468b134446ad5e6245ad

Verbatim 原文 needle (scoped to the SUPPLEMENTARY article 2, Item 1):
  「特別法人事業税に係る払込予定額から特別法人事業税に係る還付金等に相当する額を控除した額（当該額が零を下回る場合には、零とする。）」

Variable contract:
  paymentDue = 特別法人事業税に係る払込予定額 (caller-established, Nat 円)
  refunds    = 特別法人事業税に係る還付金等に相当する額 (caller-established, Nat 円)
  netAmount paymentDue refunds = paymentDue - refunds (Nat subtraction is
      zero-saturating: when refunds > paymentDue the result is 零 = 0, matching
      「零を下回る場合には、零とする」).

This is a distinct law/revision/cell pin of the saturating subtraction pattern
(also present for 印紙税法 art.12 in ClampedSubtraction); no global novelty claim.

Scope: ONLY this zero floor. The computation of 払込予定額 and 還付金等, item 2's
additional 下回る額 subtraction, paragraph 2 (旧地方法人特別税), other
articles/laws and all legal effects are NOT MODELLED.
-/

namespace JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor

/-- 原文の「零」= 0（下限）。 -/
def floorYen : Nat := 0

/-- 払込予定額 − 還付金等（Nat 減算は零で飽和）。 -/
def netAmount (paymentDue : Nat) (refunds : Nat) : Nat :=
  paymentDue - refunds

theorem floor_is_zero : floorYen = 0 := rfl

/-- 通常の控除後残額。 -/
theorem net_100_40 : netAmount 100 40 = 60 := by decide

/-- 還付金等が払込予定額を上回れば零（還付は負にならない）。 -/
theorem net_40_100 : netAmount 40 100 = 0 := by decide

/-- 同額なら零。 -/
theorem net_50_50 : netAmount 50 50 = 0 := by decide

/-- 零入力なら零。 -/
theorem net_0_0 : netAmount 0 0 = 0 := by decide

/-- 小さい入力の境界。 -/
theorem net_1_0 : netAmount 1 0 = 1 := by decide
theorem net_1_2 : netAmount 1 2 = 0 := by decide

end JapanTaxLaw.SpecialCorpBusinessTaxZeroFloor
