import JapanTaxLaw.TaxFinance

/-!
# LocalTaxArt154FreightTonSurcharge — 地方税法 第百五十四条(1)（貨物自動車 標準税率 加算）

Pinned source:
  Law id: 325AC0000000226
  Official title: 地方税法
  Law number: 昭和二十五年法律第二百二十六号
  Law type: Act (法律)
  Revision: 325AC0000000226_20261101_508AC0000000002
  Raw snapshot: data/raw/325AC0000000226_20261101_508AC0000000002.law.json
  sha256: 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53
  Normative unit id: NORM|cdd69708e364f7ffe3fc19e940a20601214602b741a034108754d57b296a45d0
  Source path: LawBody[2]/MainProvision/MainProvision[1]/Article:154/Article#154/
               Paragraph#1/TableStruct/Table/TableRow/TableColumn/Sentence#1
  Article caption: （自動車税の標準税率）
  Freight-vehicle standard rate: base 四万五百, plus 六千三百 per
  started ton of the portion exceeding 八 tons. All three
  constants derived programmatically from the verbatim needle.

原文逐語（pinned, 一字一句改変なし）:
  「四万五百円に最大積載量が八トンを超える部分一トンまでごとに六千三百円を加算した額」

Variable contract / units / domain (次元整合性):
  unit of money: 円 (Money = Nat); unit of load: キログラム (kg, Nat).
  Modeling sub-unit: 1 トン = 1000 キログラム (metric ton; standard unit fact,
  NOT a statutory constant). 最大積載量 (maximum loading capacity) loadKg : Nat
  is measured in whole kilograms, domain Nat (>= 0).
  「一トンまでごとに」 = per started ton -> ceiling of excess kg / 1000.

Formulas:
  chargeableTons loadKg :=
    if loadKg <= thresholdKg then 0
    else (loadKg - thresholdKg + 999) / 1000        -- ceil(excess / 1000)
  amountYen loadKg := baseFeeYen + incrementYen * chargeableTons loadKg

Scope: only this amount formula cell. Other table cells, the 端数 handling
outside this cell, other paragraphs and other articles are NOT MODELLED.
Fractional kilograms are NOT MODELLED (load is whole kg). No legal-correctness
claim; human legal review remains pending.

No `sorry`, `admit`, `axiom` or `Classical.choice`.
-/

namespace JapanTaxLaw.LocalTaxArt154FreightTonSurcharge

open JapanTaxLaw.TaxFinance

/-- 基本額 = 四万五百. Derived from verbatim source. -/
def baseFeeYen : Money := 40_500

/-- 閾値 = 八 トン = 8_000 キログラム. From verbatim source. -/
def thresholdKg : Nat := 8_000

/-- 1 トン = 1000 キログラム (standard metric unit; modeling assumption). -/
def kgPerTon : Nat := 1_000

/-- 加算額 = 六千三百 per started ton. Derived from verbatim source. -/
def incrementYen : Money := 6_300

/-- 超過トン数（一トンまでごとに = ceiling, 端数切上）。 -/
def chargeableTons (loadKg : Nat) : Nat :=
  if loadKg <= thresholdKg then 0
  else (loadKg - thresholdKg + kgPerTon - 1) / kgPerTon

/-- 標準税率額 = 基本額 + 加算額 × 超過トン数。 -/
def amountYen (loadKg : Nat) : Money :=
  baseFeeYen + incrementYen * chargeableTons loadKg

end JapanTaxLaw.LocalTaxArt154FreightTonSurcharge
