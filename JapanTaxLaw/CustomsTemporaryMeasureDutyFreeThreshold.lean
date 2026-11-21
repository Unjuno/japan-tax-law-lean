import JapanTaxLaw.TaxFinance

/-!
# CustomsTemporaryMeasureDutyFreeThreshold — 関税暫定措置法施行令 第二十七条(1)2（課税価格 20万円以下の物品）

Pinned source:
  Law id: 335CO0000000069
  Official title: 関税暫定措置法施行令
  Law number: 昭和三十五年政令第六十九号
  Law type: CabinetOrder (政令)
  Revision: 335CO0000000069_20260401_508CO0000000085
  Raw snapshot: data/raw/335CO0000000069_20260401_508CO0000000085.law.json
  sha256: b64be40dba650308d9f0ae478e89539b412c4f0a4fac981b6c770d3f1e1f121a
  Normative unit id: NORM|47db57ba8db05d493e7e01968a4971d23ac9e1b03d347102d9459e0d272b05eb
  Source path: LawBody[3]/MainProvision/MainProvision[4]/Article:27/Article#27/
               Paragraph#1/Item#2/ItemSentence/Sentence#1
  Article caption: （原産地の証明）

原文逐語（pinned, 一字一句改変なし）:
  「課税価格の総額が二十万円以下の物品（前号に掲げる物品に該当するものを除く。）」

Variable contract (円, domain Nat):
  dutyFreePriceCeilingYen : Money := 200_000 — derived programmatically
  from the verbatim needle's kanji numeral 二十万. 「以下」 = ≤ (inclusive).
  This ITEM 2 is an EXCEPTION: goods at or below ¥200_000, but excluding
  goods of the preceding item (前号). The exclusion is part of the verbatim needle;
  the model covers the numeric ceiling only (see scope).

Scope: only the ¥200_000 price ceiling is modeled. The preceding-item
exclusion, the tax procedure, other items/paragraphs and other articles are NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold

open JapanTaxLaw.TaxFinance

/-- 課税価格の総額 二十万円以下 — duty-free price ceiling (以下, inclusive). -/
def dutyFreePriceCeilingYen : Money := 200_000

/-- 「課税価格の総額が二十万円以下」: total taxable price at most ¥200_000. -/
def withinDutyFreeThreshold (price : Money) : Prop :=
  price ≤ dutyFreePriceCeilingYen

end JapanTaxLaw.CustomsTemporaryMeasureDutyFreeThreshold
