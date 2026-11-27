import JapanTaxLaw.TaxFinance

/-
# LocalTax701_31ElderAge65OrMore — pinned clause 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」

Pinned: law 325AC0000000226 (地方税法), revision 325AC0000000226_20261101_508AC0000000002,
article Num 701_31, paragraph 2.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json (SHA-256 3dd29e0078bf24e09c79436ce7b0f00fd2cfb5a5bbcb97bd4f4352971be68d53). Normative unit: NORM|f964cee74f1d40f1393cb701913d4bcfe7e8fc59083404ed4297b4b121b05734.
原文逐語: 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」
Scope: ONLY the 年齢六十五歳以上 (65 <= age) INCLUSIVE lower bound on the 現況判定 age. 障害者・雇用改善助成対象者の判定・前項第五号・他項他条項 are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax701_31ElderAge65OrMore

open JapanTaxLaw.TaxFinance

/-- statutory threshold literal (65), INCLUSIVE lower bound. -/
def threshold : Nat := 65

/-- 「前項第五号の場合において、障害者、年齢六十五歳以上の者又は雇用改善助成対象者であるかどうかの判定は、その者に対して給与等が支払われる時の現況によるものとする。」. -/
def inScope (age : Nat) : Prop := threshold <= age

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (age : Nat) : Bool := decide (65 <= age)

end JapanTaxLaw.LocalTax701_31ElderAge65OrMore
