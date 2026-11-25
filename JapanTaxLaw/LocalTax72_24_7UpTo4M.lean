import JapanTaxLaw.TaxFinance

/-
# LocalTax72_24_7UpTo4M — pinned clause 「各事業年度の所得のうち年四百万円以下の金額」

Pinned: law 325AC0000000226, revision 325AC0000000226_20261101_508AC0000000002, article 72_24_7.
Raw: data/raw/325AC0000000226_20261101_508AC0000000002.law.json. Normative unit: NORM|e932cef31eb10a25dd172cb51adbc7ef69dfb6ada9e3d2c2d5644dba991d393f.
原文逐語: 「各事業年度の所得のうち年四百万円以下の金額」
Scope: ONLY the threshold/tier interval of this clause. Rates, other tiers,
the underlying computation and other articles are NOT MODELLED.
No sorry/admit/Classical.choice.
-/

namespace JapanTaxLaw.LocalTax72_24_7UpTo4M

open JapanTaxLaw.TaxFinance

/-- 四百万円 — 以下（inclusive） threshold (four million yen). -/
def threshold : Money := 4_000_000

/-- 「各事業年度の所得のうち年四百万円以下の金額」. -/
def inScope (amount : Money) : Prop := amount ≤ threshold

/-- Decidable Bool mirror for kernel boundary checks. -/
def inScopeBool (amount : Money) : Bool := decide (amount ≤ 4_000_000)

end JapanTaxLaw.LocalTax72_24_7UpTo4M
