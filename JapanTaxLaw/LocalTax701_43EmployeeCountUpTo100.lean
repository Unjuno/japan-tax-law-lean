import JapanTaxLaw.TaxFinance

/-
# LocalTax701_43EmployeeCountUpTo100 — pinned clause 「前項の場合において、第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定の基礎となる事業所等のうち、課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等として政令で定めるもの（当該課税標準の算定期間の中途において廃止された事業所等を除く。）については、当該課税標準の算定期間に属する各月の末日現在における従業者の数を合計した数を当該課税標準の算定期間の月数で除して得た数をもつて前項の課税標準の算定期間の末日現在の従業者の数と」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_43, paragraph 4.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|36c7d273f80c1b2c2c199c55a55d2be0cceea637315b90f00fb86c1e57993c8a.
原文逐語: 「前項の場合において、第一項に規定する従業者の数の合計数及び第二項に規定する従業者の数が百人以下であるかどうかの判定の基礎となる事業所等のうち、課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等として政令で定めるもの（当該課税標準の算定期間の中途において廃止された事業所等を除く。）については、当該課税標準の算定期間に属する各月の末日現在における従業者の数を合計した数を当該課税標準の算定期間の月数で除して得た数をもつて前項の課税標準の算定期間の末日現在の従業者の数と」
Scope: ONLY the 百人以下 (employees <= 100) INCLUSIVE exemption-point employee-count ceiling for a 指定都市等 business-tax exemption point. 千平方メートル以下 floor area, 課税標準の算定期間中を通じて従業者の数に著しい変動がある事業所等, the averaging formula and 他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100

open JapanTaxLaw.TaxFinance

/-- 「百人以下」 — statutory threshold literal 100; INCLUSIVE boundary. -/
def inScope (employees : Nat) : Prop := employees <= 100

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (employees : Nat) : Bool := decide (employees <= 100)

end JapanTaxLaw.LocalTax701_43EmployeeCountUpTo100
