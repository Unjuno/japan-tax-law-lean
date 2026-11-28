import JapanTaxLaw.TaxFinance

/-
# LocalTax701_43FloorAreaUpTo1000Sqm — pinned clause 「前二項の場合において、第一項に規定する事業所床面積の合計面積及び第二項に規定する事業所床面積が千平方メートル以下であるかどうか並びに第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定は課税標準の算定期間の末日の現況によるものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_43, paragraph 3.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|cc0c39fe14cafabb93799c35afb346c27749dfdaa8c2d1dbfdc28b58901bcf60.
原文逐語: 「前二項の場合において、第一項に規定する事業所床面積の合計面積及び第二項に規定する事業所床面積が千平方メートル以下であるかどうか並びに第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定は課税標準の算定期間の末日の現況によるものとする。」
Scope: ONLY the 千平方メートル以下 (sqm <= 1000) INCLUSIVE exemption-point floor-area ceiling and its 末日の現況 determination timing. 百人以下 employee count, 第一項・第二項の免税点, 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm

open JapanTaxLaw.TaxFinance

/-- 「千平方メートル以下」 — statutory threshold literal 1_000; INCLUSIVE boundary. -/
def inScope (sqm : Nat) : Prop := sqm <= 1_000

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (sqm : Nat) : Bool := decide (sqm <= 1_000)

end JapanTaxLaw.LocalTax701_43FloorAreaUpTo1000Sqm
