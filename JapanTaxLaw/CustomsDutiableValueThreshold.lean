import JapanTaxLaw.TaxFinance

/-!
# CustomsDutiableValueThreshold — 関税定率法施行令 第一条の二(1)第三号（十万円超）

Pinned source:
  Law id: 329CO0000000155
  Official title: 関税定率法施行令
  Law number: 昭和二十九年政令第百五十五号
  Law type: CabinetOrder (政令)
  Revision: 329CO0000000155_20260401_508CO0000000085
  Raw snapshot: data/raw/329CO0000000155_20260401_508CO0000000085.law.json
  sha256: 7f76960b6510a6bd086c236c7d7facf5e47cb276f24a3f4a705c0c0aa8e15d01
  Normative unit id: NORM|347d0d0ebd32cab1a2f5054abe7a87ebe56cae34b125a2481f38c63e5cf05723
  Source path: LawBody[3]/MainProvision/MainProvision[0]/Article:1_2/Article#1_2/
               Paragraph#1/Item#3/ItemSentence/Sentence#1
  Statutory article: 第一条の二(1)第三号

原文逐語（pinned, 一字一句改変なし）:
  「前二号に掲げるもののほか、一個又は一組の課税価格が十万円を超えるもの」

Variable contract:
  `thresholdYen : Money := 100_000` = 十万円 (strict lower bound: 超える).
  `aboveThreshold dutiableValue := thresholdYen < dutiableValue`.
  Unit 円; domain Nat (whole yen). 「超える」 = strict >.

Scope: only this dutiable-value threshold. The first two items of 第一条の二(1),
the substantive rule this item gates, other paragraphs, 省令 details, and the
customs valuation rules themselves are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsDutiableValueThreshold

open JapanTaxLaw.TaxFinance

/-- 十万円 — strict lower bound (超える). Unit 円; domain Nat. -/
def thresholdYen : Money := 100_000

/-- 「課税価格が十万円を超える」: dutiable value strictly exceeds ¥100,000. -/
def aboveThreshold (dutiableValue : Money) : Prop :=
  thresholdYen < dutiableValue

end JapanTaxLaw.CustomsDutiableValueThreshold
