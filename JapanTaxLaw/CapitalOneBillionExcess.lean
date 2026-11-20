import JapanTaxLaw.TaxFinance

/-
# CapitalOneBillionExcess — 新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律 第七条第一項第一号

Pinned source:
  Law id: 502AC0000000025
  Official title: 新型コロナウイルス感染症等の影響に対応するための国税関係法律の臨時特例に関する法律
  Law type: Act (法律)
  Revision: 502AC0000000025_20260401_508AC0000000012
  Raw snapshot: data/raw/502AC0000000025_20260401_508AC0000000012.law.json
  sha256: 410e0d9715f6ea70fe2a9ca6c986a70abec48a3cbabe625fb54aabaa18efaa23
  Statutory article: 第七条 (art. 7), 第一項 (para. 1), 第一号 (item 1), 第一細目 (subitem 1)
  Source path: LawBody[1]/MainProvision/MainProvision[7]/Article:7/Article#7/
               Paragraph#1/Item#1/Subitem1#1/Subitem1Sentence/Sentence#1
  Normative unit id: NORM|3b1013fc326dbfcb98839b2a2a363fb2569d565af04514f05fe362ce89d7d027

原文逐語（pinned, 一字一句改変なし, CONDITION）:
  「資本金の額又は出資金の額が十億円を超える法人」

Variable contract:
  `capitalBillionFloor : Nat := 1_000_000_000` = 十億円 (1 billion yen).
  `exceedsCapitalBillion (amount : Nat) : Bool := decide (capitalBillionFloor < amount)`.
  Unit 円; domain Nat (whole yen). 「超える」 = strict `>`, NOT inclusive
  以上. A corporation with exactly 十億円 does NOT satisfy the condition.

Scope: ONLY the explicit numeric capital/contribution condition is modelled —
a corporation's capital or contribution amount strictly exceeds ¥1,000,000,000.
The rest of art. 7, the special tax measure this condition gates, other items,
other laws referenced by the act, and all enforcement/operational rules are
NOT MODELLED.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.CapitalOneBillionExcess

/-- 十億円 — strict lower bound (超える). Unit 円; domain Nat. -/
def capitalBillionFloor : Nat := 1_000_000_000

/-- 「資本金の額又は出資金の額が十億円を超える法人」: amount > ¥1,000,000,000. -/
def exceedsCapitalBillion (amount : Nat) : Bool :=
  decide (capitalBillionFloor < amount)

/-- 超える is exclusive: exactly 十億円 does not qualify. -/
theorem floor_exclusive : exceedsCapitalBillion 1_000_000_000 = false := by
  unfold exceedsCapitalBillion capitalBillionFloor
  decide

/-- One yen above the floor qualifies. -/
theorem first_above : exceedsCapitalBillion 1_000_000_001 = true := by
  unfold exceedsCapitalBillion capitalBillionFloor
  decide

/-- Zero capital/contribution does not satisfy the condition. -/
theorem zero_false : exceedsCapitalBillion 0 = false := by
  unfold exceedsCapitalBillion capitalBillionFloor
  decide

end JapanTaxLaw.CapitalOneBillionExcess
